// GSC-DE localization pass for germanpolishedcrystal.
// Scan → adversarial verify → user gate → apply → safety recheck → report.
// Hard lessons: do not expand EnemyLinebreak mid-battle cont; keep ability "hat ".

let meta = #{
    name: "gsc-de-pass",
    description: "GSC-DE Uebersetzungspass: Scan, Verify, User-Gate, Apply, Kampftext-Safety",
    when_to_use: "When localizing Polished Crystal DE, hunting EN leftovers, fixing map/system/battle text, or after a Claude/agent merge that may have regressed Kampftexte.",
    phases: [
        #{ title: "Scope", detail: "args + hard rules" },
        #{ title: "Scan", detail: "parallel domain scanners" },
        #{ title: "Verify", detail: "adversarial gate, fail closed" },
        #{ title: "Plan", detail: "minimal safe fix plan" },
        #{ title: "Apply", detail: "user-gated edits" },
        #{ title: "Safety", detail: "battle regression recheck" },
        #{ title: "Report", detail: "scratch report + summary" },
    ],
};

// --- schemas ---
let findings_schema = #{
    "type": "object",
    "required": ["findings", "domain", "notes"],
    "properties": #{
        "domain": #{ "type": "string" },
        "notes": #{ "type": "string" },
        "findings": #{
            "type": "array",
            "maxItems": 8,
            "items": #{
                "type": "object",
                "required": ["id", "file", "issue", "severity", "fix_hint", "risk"],
                "properties": #{
                    "id": #{ "type": "string" },
                    "file": #{ "type": "string" },
                    "issue": #{ "type": "string" },
                    "severity": #{ "type": "string" },
                    "fix_hint": #{ "type": "string" },
                    "risk": #{ "type": "string" },
                },
            },
        },
    },
};

let verdict_schema = #{
    "type": "object",
    "required": ["real", "safe_to_apply", "reason", "evidence", "battle_risk"],
    "properties": #{
        "real": #{ "type": "boolean" },
        "safe_to_apply": #{ "type": "boolean" },
        "reason": #{ "type": "string" },
        "evidence": #{ "type": "string" },
        "battle_risk": #{ "type": "string" },
    },
};

let plan_schema = #{
    "type": "object",
    "required": ["summary", "actions", "do_not_touch"],
    "properties": #{
        "summary": #{ "type": "string" },
        "do_not_touch": #{ "type": "string" },
        "actions": #{
            "type": "array",
            "maxItems": 12,
            "items": #{
                "type": "object",
                "required": ["file", "change", "why"],
                "properties": #{
                    "file": #{ "type": "string" },
                    "change": #{ "type": "string" },
                    "why": #{ "type": "string" },
                },
            },
        },
    },
};

let apply_schema = #{
    "type": "object",
    "required": ["applied", "skipped", "files_touched", "notes"],
    "properties": #{
        "applied": #{ "type": "integer" },
        "skipped": #{ "type": "integer" },
        "files_touched": #{ "type": "array", "items": #{ "type": "string" } },
        "notes": #{ "type": "string" },
    },
};

let safety_schema = #{
    "type": "object",
    "required": ["ok", "issues", "notes"],
    "properties": #{
        "ok": #{ "type": "boolean" },
        "notes": #{ "type": "string" },
        "issues": #{
            "type": "array",
            "maxItems": 8,
            "items": #{
                "type": "object",
                "required": ["file", "issue"],
                "properties": #{
                    "file": #{ "type": "string" },
                    "issue": #{ "type": "string" },
                },
            },
        },
    },
};

// --- args ---
let scope = "battle";
let dry_run = false;
let skip_apply = false;
let max_findings = 8;
if args != () {
    if args.scope != () { scope = args.scope; }
    if args.dry_run != () { dry_run = args.dry_run; }
    if args.skip_apply != () { skip_apply = args.skip_apply; }
    if args.max_findings != () { max_findings = args.max_findings; }
}

// Normalize scope token (no regex): battle | maps | system | names | all
let valid_scope = false;
if scope == "battle" || scope == "maps" || scope == "system" || scope == "names" || scope == "all" {
    valid_scope = true;
}
if !valid_scope {
    pause("verification", "args.scope must be battle|maps|system|names|all (got something else). Resume after fixing args.");
}

// Shared hard rules injected into every agent prompt (self-contained; no parent context).
let HARD_RULES = "";
HARD_RULES += "PROJECT: germanpolishedcrystal (Polished Crystal 3.2.3 DE GSC-canon). Branch master only. ";
HARD_RULES += "STYLE: pure German, GSC DE Crystal fidelity. Canon dump: tools/_gsc_de_crystal_msg.txt. ";
HARD_RULES += "Also read CANON_STYLE.md. Anrede du. TEXTBOX_INNERW = 18 tiles max per line (hard). ";
HARD_RULES += "Macros: #MON/#BALL/#DEX/#COM use 7 tiles. Keep GSC anglicisms that exist in DE Crystal. Mama says Schatz. ";
HARD_RULES += "City/route landmarks often CAPS where already established. ARENALEITER CAPS. ";
HARD_RULES += "LINE-WRAP / OVERFLOW (all domains: battle, maps NPC, system — P0/P1): ";
HARD_RULES += "(W1) NEVER split a German word mid-word across line/cont (e.g. schickt -> sc|hickt is a bug). ";
HARD_RULES += "(W2) Soft hyphen only at natural syllable breaks with '-', and only if dump/GSC style needs it. ";
HARD_RULES += "(W3) DYNAMIC WIDTH: any line with text_decimal, text_ram, <PLAYER>, <USER>, nicknames, money (¥) must fit ";
HARD_RULES += "WORST CASE (long name + max digits). Count tiles, leave headroom; move static words to next line/para. ";
HARD_RULES += "(W4) Known pitfall: SentSomeToMomText — dump is '<PLAYER> erhält' / '¥N und schickt' / para / 'einen Teil nach' / 'Hause.' ";
HARD_RULES += "Do NOT put 'erhält ¥N und schickt' on one line. ";
HARD_RULES += "(W5) Overflow that draws past the box bottom is P0/P1 — fix reflow, do not ignore. ";
HARD_RULES += "(W6) Prefer dump layout (line/cont/para) over cramming; one intentional para is better than mid-word wrap. ";
HARD_RULES += "BATTLE SAFETY (critical regressions): ";
HARD_RULES += "(1) Do NOT expand EnemyLinebreakTable / mid-battle cont linebreaks — extra cont causes extra A-press and feels bugged. ";
HARD_RULES += "(2) Ability slideout must keep grammar 'hat NAME' (do not remove 'hat '). ";
HARD_RULES += "(3) Recall: Text_BattleMonNickComma + ComeBack — no double comma. ";
HARD_RULES += "(4) Prefer stable battle strings over creative reflow. ";
HARD_RULES += "(5) MistText dump-true style where already locked. ";
HARD_RULES += "Polished-only content: keep PC story/rewards; rewrite in DE Crystal tone. ";
HARD_RULES += "Do not commit/push/shiny work unless explicitly told. Do not invent EN→DE wholesale without dump check. ";
HARD_RULES += "Use tools (grep, read_file) on real files — never answer from memory alone. ";

phase("Scope");
log("gsc-de-pass scope=" + scope + " dry_run=" + dry_run.to_string() + " skip_apply=" + skip_apply.to_string());

// --- domain list for scan fan-out ---
let domains = [];
if scope == "all" {
    domains = ["battle", "maps", "system", "names"];
} else {
    domains.push(scope);
}

// --- Scan ---
phase("Scan");
let scan_jobs = [];
for d in domains {
    let p = "";
    p += HARD_RULES;
    p += "TASK: SCAN domain='" + d + "' for concrete localization defects. ";
    p += "Return at most " + max_findings.to_string() + " findings. Empty findings is valid ONLY after real greps/reads. ";
    p += "Each finding needs id (short), file path, issue, severity (P0|P1|P2), fix_hint, risk. ";
    p += "severity P0 = softlock/wrong control flow/broken battle UX/extra A-press mid-fight. ";
    p += "severity P1 = wrong EN leftover, wrong GSC name, broken grammar, overlong line. ";
    p += "severity P2 = polish/style only. ";
    if d == "battle" {
        p += "FOCUS FILES: engine/battle/text.asm, data/text/battle.asm, data/text/common.asm, ";
        p += "engine/battle/ability_gfx.asm (or similar ability text), any EnemyLinebreak table. ";
        p += "Hunt: English leftovers, missing 'hat ', extra cont mid-enemy text, empty HitNTimes lines, ";
        p += "double commas on recall, over-expanded EnemyLinebreakTable entries. ";
        p += "Also hunt MONEY/MOM payout lines (GotMoneyForWinningText, SentSomeToMomText, SentHalf/AllToMomText) for overlong lines ";
        p += "with text_decimal wBattleReward — mid-word wrap is P0. ";
        p += "Do NOT propose expanding EnemyLinebreaks as a 'fix' for width unless absolutely necessary; prefer shorter wording. ";
    }
    if d == "maps" {
        p += "FOCUS: maps/*.asm NPC dialogues. Hunt EN leftovers, non-GSC place names, overlong lines (>18 tiles), ";
        p += "mid-word wraps, mid-@ breaks, text_ram/money bugs. ";
        p += "Lines with text_ram / player name / item name must fit worst-case width. ";
        p += "Compare against tools/_gsc_de_crystal_msg.txt when a known Crystal line exists. Sample, do not claim full coverage of all maps. ";
    }
    if d == "system" {
        p += "FOCUS: data/text/*.asm, engine/menus/*.asm, start menu (#COM/FERTIG), options, PC strings, common chains, diploma/judge if DE. ";
        p += "Hunt EN menus, wrong casing, overlong labels, dynamic money/name strings that overflow the box. ";
    }
    if d == "names" {
        p += "FOCUS: data/pokemon names, trainer class_names, landmarks.asm CAPS, item/move names vs GSC DE. ";
        p += "Tools may exist under tools/*gsc*. Prefer dump-aligned names. Ability names max ~13 chars if that limit is already project policy. ";
    }
    p += "Output schema fields only. domain must equal '" + d + "'. notes = brief scan method used (which greps).";
    scan_jobs.push(#{
        prompt: p,
        label: "scan:" + d,
        capability_mode: "read-only",
        output_schema: findings_schema,
    });
}
let scan_results = parallel(scan_jobs);

let findings = [];
let scan_notes = [];
let si = 0;
for r in scan_results {
    if r != () && r.success && r.output != () {
        if r.output.notes != () { scan_notes.push(domains[si] + ": " + r.output.notes); }
        if r.output.findings != () {
            for f in r.output.findings {
                // Scope invariant: keep only findings whose file path looks project-ish (no absolute drive spam filter beyond prompt).
                if f.file != () && f.issue != () {
                    findings.push(f);
                }
            }
        }
    } else {
        log("scan slot failed for domain index " + si.to_string());
    }
    si += 1;
}

log("scan produced " + findings.len().to_string() + " raw findings");
if findings.len() == 0 {
    let empty_report = "# gsc-de-pass report\n\nScope: " + scope + "\n\nNo findings after scan.\n";
    let empty_path = write_scratch_file("gsc-de-pass-report.md", empty_report);
    complete(#{ summary: "No findings.", path: empty_path, confirmed: [], applied: 0 });
}

// Cap verification fan-out
const MAX_VERIFY = 12;
let to_verify = [];
let vi = 0;
for f in findings {
    if vi < MAX_VERIFY {
        to_verify.push(f);
    }
    vi += 1;
}
if findings.len() > MAX_VERIFY {
    log("truncated findings for verify: " + findings.len().to_string() + " -> " + MAX_VERIFY.to_string());
}

// --- Verify (fail closed) ---
phase("Verify");
let vjobs = [];
for f in to_verify {
    let vp = "";
    vp += HARD_RULES;
    vp += "TASK: ADVERSARIAL VERIFY this localization finding. Default real=false unless evidence is strong. ";
    vp += "Read the actual file(s) with tools before deciding. ";
    vp += "Finding id=" + json_encode(f.id) + " file=" + json_encode(f.file) + " issue=" + json_encode(f.issue) + " ";
    vp += "severity=" + json_encode(f.severity) + " fix_hint=" + json_encode(f.fix_hint) + " risk=" + json_encode(f.risk) + ". ";
    vp += "Set real=true only if the defect exists in shipped code. ";
    vp += "Set safe_to_apply=true only if a minimal fix will NOT: ";
    vp += "(a) add mid-battle cont/EnemyLinebreak A-presses (except intentional dump para for multi-box texts), ";
    vp += "(b) remove ability 'hat ', (c) break scripts/text_ram, ";
    vp += "(d) invent non-GSC names, (e) rewrite large unrelated text, (f) leave mid-word wraps or >18 tile lines. ";
    vp += "battle_risk: none|low|high — high if battle text/ability/EnemyLinebreak involved. ";
    vp += "If fix_hint proposes expanding EnemyLinebreaks, set safe_to_apply=false unless you prove no extra A-press. ";
    vp += "evidence must quote path + what you saw. reason explains verdict.";
    let flabel = "verify";
    if f.id != () { flabel = "verify:" + f.id; }
    vjobs.push(#{
        prompt: vp,
        label: flabel,
        capability_mode: "read-only",
        output_schema: verdict_schema,
    });
}
let verdicts = parallel(vjobs);

let confirmed = [];
let rejected = 0;
let unverified = 0;
let i = 0;
for v in verdicts {
    if v != () && v.success && v.output != () {
        if v.output.real == true && v.output.safe_to_apply == true
            && v.output.evidence != () && v.output.evidence != "" {
            // Attach verdict meta onto finding map by rebuilding a plan-friendly item
            let f = to_verify[i];
            confirmed.push(#{
                id: f.id,
                file: f.file,
                issue: f.issue,
                severity: f.severity,
                fix_hint: f.fix_hint,
                risk: f.risk,
                evidence: v.output.evidence,
                battle_risk: v.output.battle_risk,
                reason: v.output.reason,
            });
        } else {
            rejected += 1;
        }
    } else {
        unverified += 1;
    }
    i += 1;
}
log(confirmed.len().to_string() + " confirmed; " + rejected.to_string() + " rejected; " + unverified.to_string() + " unverified (fail-closed)");

if confirmed.len() == 0 {
    let rep = "# gsc-de-pass report\n\nScope: " + scope + "\n\n";
    rep += "Raw findings: " + findings.len().to_string() + "\n";
    rep += "Confirmed safe: 0 (all rejected or unverified).\n";
    rep += "No apply step.\n";
    let path = write_scratch_file("gsc-de-pass-report.md", rep);
    complete(#{ summary: "No safe confirmed findings.", path: path, confirmed: [], applied: 0 });
}

// --- Plan ---
phase("Plan");
let plan_prompt = "";
plan_prompt += HARD_RULES;
plan_prompt += "TASK: Build a MINIMAL safe fix plan from these CONFIRMED findings only. ";
plan_prompt += "Do not add new issues. Prefer smallest string edits. ";
plan_prompt += "For any battle_risk high item: prefer restore-known-stable wording over reflow. ";
plan_prompt += "do_not_touch must list EnemyLinebreak over-expansion, ability 'hat ' removal, double-comma recall, mass rewrites. ";
plan_prompt += "CONFIRMED JSON:\n" + json_encode(confirmed);
let plan_r = agent(plan_prompt, #{
    label: "plan",
    capability_mode: "read-only",
    output_schema: plan_schema,
});

let actions = [];
let plan_summary = "no plan";
let do_not_touch = "";
if plan_r != () && plan_r.success && plan_r.output != () {
    if plan_r.output.summary != () { plan_summary = plan_r.output.summary; }
    if plan_r.output.do_not_touch != () { do_not_touch = plan_r.output.do_not_touch; }
    if plan_r.output.actions != () { actions = plan_r.output.actions; }
} else {
    // Fail closed: if plan fails, stop before apply
    let rep = "# gsc-de-pass report\n\nPlan agent failed; apply skipped.\nConfirmed count: " + confirmed.len().to_string() + "\n";
    let path = write_scratch_file("gsc-de-pass-report.md", rep);
    complete(#{ summary: "Plan failed; no apply.", path: path, confirmed: confirmed, applied: 0 });
}

log("plan actions=" + actions.len().to_string() + " — " + plan_summary);

// --- User gate ---
if dry_run || skip_apply {
    log("dry_run/skip_apply set — skipping apply");
} else {
    let gate_msg = "gsc-de-pass: " + confirmed.len().to_string() + " confirmed fixes planned. ";
    gate_msg += "Summary: " + plan_summary + " ";
    gate_msg += "Resume to APPLY these edits on master worktree, or stop the workflow to abort. ";
    gate_msg += "DO NOT TOUCH: " + do_not_touch;
    await_user("user", gate_msg);

    phase("Apply");
    let ap = "";
    ap += HARD_RULES;
    ap += "TASK: APPLY only the planned actions below. Minimal diffs. No drive-by refactors. ";
    ap += "If a change would add mid-battle cont or remove ability 'hat ', SKIP it and count as skipped. ";
    ap += "Do not commit or push. Do not run make unless needed to check a syntax error in a tiny way — prefer no build here. ";
    ap += "After edits, report applied/skipped/files_touched/notes. ";
    ap += "PLAN SUMMARY: " + plan_summary + "\n";
    ap += "DO NOT TOUCH: " + do_not_touch + "\n";
    ap += "ACTIONS JSON:\n" + json_encode(actions);
    let apply_r = agent(ap, #{
        label: "apply",
        capability_mode: "read-write",
        output_schema: apply_schema,
    });

    let applied_n = 0;
    let skipped_n = 0;
    let files_touched = [];
    let apply_notes = "";
    if apply_r != () && apply_r.success && apply_r.output != () {
        if apply_r.output.applied != () { applied_n = apply_r.output.applied; }
        if apply_r.output.skipped != () { skipped_n = apply_r.output.skipped; }
        if apply_r.output.files_touched != () { files_touched = apply_r.output.files_touched; }
        if apply_r.output.notes != () { apply_notes = apply_r.output.notes; }
    } else {
        log("apply agent failed");
        apply_notes = "apply agent failed";
    }

    // --- Safety recheck (battle-focused) ---
    phase("Safety");
    let sp = "";
    sp += HARD_RULES;
    sp += "TASK: SAFETY RECHECK after localization edits. Read real files. ";
    sp += "Check: EnemyLinebreakTable not over-expanded; ability text still has 'hat '; ";
    sp += "no double-comma recall; no empty critical battle lines; no accidental EN reintroduced in touched files; ";
    sp += "no mid-word wraps; SentSomeToMom / money lines still dump-safe under long player names + 6-digit rewards. ";
    sp += "files_touched JSON: " + json_encode(files_touched) + ". ";
    sp += "ok=true only if no P0 battle regressions found. List issues if any.";
    let safety_r = agent(sp, #{
        label: "safety",
        capability_mode: "read-only",
        output_schema: safety_schema,
    });

    let safety_ok = false;
    let safety_issues = [];
    let safety_notes = "";
    if safety_r != () && safety_r.success && safety_r.output != () {
        if safety_r.output.ok == true { safety_ok = true; }
        if safety_r.output.issues != () { safety_issues = safety_r.output.issues; }
        if safety_r.output.notes != () { safety_notes = safety_r.output.notes; }
    } else {
        safety_notes = "safety agent failed — treat as not ok";
        safety_ok = false;
    }

    phase("Report");
    let rep = "# gsc-de-pass report\n\n";
    rep += "- scope: `" + scope + "`\n";
    rep += "- raw findings: " + findings.len().to_string() + "\n";
    rep += "- confirmed safe: " + confirmed.len().to_string() + "\n";
    rep += "- rejected/unverified: " + rejected.to_string() + "/" + unverified.to_string() + "\n";
    rep += "- plan: " + plan_summary + "\n";
    rep += "- do_not_touch: " + do_not_touch + "\n";
    rep += "- applied: " + applied_n.to_string() + " skipped: " + skipped_n.to_string() + "\n";
    rep += "- files_touched: " + json_encode(files_touched) + "\n";
    rep += "- apply_notes: " + apply_notes + "\n";
    rep += "- safety_ok: " + safety_ok.to_string() + "\n";
    rep += "- safety_notes: " + safety_notes + "\n\n";
    rep += "## Confirmed findings\n\n";
    rep += json_encode(confirmed);
    rep += "\n\n## Actions\n\n";
    rep += json_encode(actions);
    rep += "\n\n## Safety issues\n\n";
    rep += json_encode(safety_issues);
    rep += "\n\n## Next steps for human\n\n";
    rep += "1. Playtest battle text if battle domain touched.\n";
    rep += "2. `make` ROM; version with tools/save_rom_versioned.ps1 if OK.\n";
    rep += "3. README/docs ROM changelog with date.\n";
    rep += "4. Commit/push only after playtest.\n";

    let path = write_scratch_file("gsc-de-pass-report.md", rep);
    complete(#{
        summary: "applied=" + applied_n.to_string() + " safety_ok=" + safety_ok.to_string(),
        path: path,
        confirmed_count: confirmed.len(),
        applied: applied_n,
        skipped: skipped_n,
        safety_ok: safety_ok,
        files_touched: files_touched,
    });
}

// dry_run / skip_apply report path
phase("Report");
let rep2 = "# gsc-de-pass report (no apply)\n\n";
rep2 += "- scope: `" + scope + "`\n";
rep2 += "- dry_run/skip_apply: true\n";
rep2 += "- raw findings: " + findings.len().to_string() + "\n";
rep2 += "- confirmed safe: " + confirmed.len().to_string() + "\n";
rep2 += "- plan: " + plan_summary + "\n";
rep2 += "- do_not_touch: " + do_not_touch + "\n\n";
rep2 += "## Confirmed\n\n";
rep2 += json_encode(confirmed);
rep2 += "\n\n## Actions (not applied)\n\n";
rep2 += json_encode(actions);
rep2 += "\n";
let path2 = write_scratch_file("gsc-de-pass-report.md", rep2);
complete(#{
    summary: "Plan only; no apply. confirmed=" + confirmed.len().to_string(),
    path: path2,
    confirmed_count: confirmed.len(),
    applied: 0,
    actions: actions,
});
