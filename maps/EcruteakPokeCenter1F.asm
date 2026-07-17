EcruteakPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, ECRUTEAK_CITY, 6
	warp_event  6,  7, ECRUTEAK_CITY, 6
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalMortyScript

	def_object_events
	object_event  6,  3, SPRITE_BILL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokeCenter1FBillScript, EVENT_ECRUTEAK_POKE_CENTER_BILL
	pc_nurse_event  5, 1
	object_event 11,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, EcruteakPokeCenter1FPokefanMScript, -1
	object_event 11,  5, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakPokeCenter1FLassScript, -1
	object_event  1,  4, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakPokeCenter1FCooltrainerFText, -1
	object_event  8,  1, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakPokeCenter1FGymGuyText, -1

	object_const_def
	const ECRUTEAKPOKECENTER1F_BILL

PokemonJournalMortyScript:
	setflag ENGINE_READ_MORTY_JOURNAL
	jumpthistext

	text "#MON Journal"
	para "Spezial:"
	line "ARENALEITER JENS!"
	para "JENS behauptet,"
	line "ENTEI einmal"
	para "gesehen zu haben."
	line "Er sagt:"
	para "'Es war"
	line "unglaublich. ENTEI"
	cont "sah"
	para "mich direkt an."
	para "Ich werde seine"
	line "Augen nie"
	cont "vergessen. Es war,"
	para "als könnte es"
	line "direkt durch mich"
	para "bis in die Tiefen"
	line "meines Herzens"
	cont "sehen …"
	done

EcruteakPokeCenter1FBillScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_BILL_INTRO
	iftruefwd .heardintro
	writetext .IntroText
	waitbutton
	setevent EVENT_LISTENED_TO_BILL_INTRO
.heardintro
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .NoText
	writetext .YesText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequalfwd PARTY_LENGTH, .NoRoom
	givepoke EEVEE, PLAIN_FORM, 5, NO_ITEM, GREAT_BALL
	givepokemail .GiftEeveeMail
	callasm .SetEeveeMailOT
	setevent EVENT_GOT_EEVEE
	writetext .GoodbyeText
	waitbutton
	closetext
	readvar VAR_FACING
	turnobject PLAYER, DOWN
	ifnotequal UP, .noleftstep
	applyonemovement ECRUTEAKPOKECENTER1F_BILL, step_left
.noleftstep
	applymovement ECRUTEAKPOKECENTER1F_BILL, .LeaveMovement
	playsound SFX_EXIT_BUILDING
	disappear ECRUTEAKPOKECENTER1F_BILL
	clearevent EVENT_NEVER_MET_BILL
	waitsfx
	end

.NoRoom:
	jumpthisopenedtext

	; GSC-DE Dump
	text "Moment! Du hast"
	line "keinen Platz mehr"
	cont "in deinem Team."
	done
.IntroText:
	; GSC-DE Dump (B: PC ZEITKAPSEL-Plot)
	text "Hi, ich bin BILL."
	line "Und wer bist du?"

	para "Hmm, <PLAYER>?"
	line "Du bist gerade zum"
	cont "richtigen Zeit-"
	cont "punkt gekommen."

	para "Die ZEITKAPSELN"
	line "sind total kaputt,"

	para "und ich bräuchte"
	line "deine Hilfe."
	done

.QuestionText:
	; GSC-DE Dump (B: PC ZEITKAPSEL-Ausfall)
	text "BILL: Dieses EVOLI"
	line "kam hierher, als"
	cont "ich an der ZEIT-"
	cont "KAPSEL arbeitete."

	para "Jemand sollte sich"
	line "darum kümmern,"

	para "aber ich gehe"
	line "nicht gerne raus."

	para "Wirst du für mich"
	line "mit ihm spielen,"
	cont "<PLAYER>?"
	done

.YesText:
	; GSC-DE Dump
	text "BILL: Ich wusste,"
	line "dass du es"

	para "schaffst! Noch ein"
	line "kleines Stück! Du"
	cont "bist einzigartig!"

	para "O.K., ich zähle"
	line "auf dich."

	para "Pass auf dich auf!"
	done

.GoodbyeText:
	; GSC-DE Dump (B: PC Abreise)
	text "BILL: PROF. LIND"
	line "sagt, EVOLI kann"

	para "sich in neue, un-"
	line "bekannte Arten"
	cont "entwickeln."

	para "Ich muss zurück"
	line "nach DUKATIA CITY,"
	cont "um meine Freunde"
	cont "zu besuchen."

	para "Tschü-hüs!"
	done

.NoText:
	; GSC-DE Dump
	text "Oh… Was soll ich"
	line "tun?"
	done
.LeaveMovement:
	step_down
	step_down
	step_down
	step_down
	step_end

.GiftEeveeMail:
	db   EON_MAIL
	setcharmap no_ngrams
	db   "Bitte passe auf"
	next "Evoli gut auf!@@"
	setcharmap default

.SetEeveeMailOT:
	ld hl, sPartyMon1MailAuthor
	ld a, [wPartyCount]
	dec a
	ld bc, MAIL_STRUCT_LENGTH
	rst AddNTimes
	push hl
	pop de
	ld hl, .EeveeMailOTID
	ld bc, .EeveeMailOTIDEnd - .EeveeMailOTID
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	rst CopyBytes
	jmp CloseSRAM

.EeveeMailOTID:
	rawchar "PROF. EICH@@"
	bigdw 00001
.EeveeMailOTIDEnd

EcruteakPokeCenter1FPokefanMScript:
	checkevent EVENT_GOT_HM03_SURF
	iftrue_jumptextfaceplayer .SurfText
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "Sowohl der Tanz"
	line "der KIMONO-GIRLS"

	para "als auch die Art,"
	line "wie sie ihre #-"
	cont "MON einsetzen, ist"
	cont "wunderbar!"
	done

.SurfText:
	; GSC-DE Dump
	text "Du hoffst, hier"
	line "mehr Kämpfe zu er-"
	cont "leben, nicht wahr?"

	para "Es gibt offen-"
	line "sichtlich einen"

	para "Ort, an dem sich"
	line "Trainer treffen."

	para "Wo, fragst du?"

	para "Kurz nach"
	line "OLIVIANA CITY."
	done

EcruteakPokeCenter1FLassScript:
	faceplayer
	opentext
	writetext .QuestionText
	yesorno
	iffalsefwd .No
	checkevent EVENT_ECRUTEAK_POKE_CENTER_BILL
	iffalse_jumpopenedtext .HereText
	jumpthisopenedtext

	text "Ich hörte einmal,"
	line "dass BILLs Mutter"

	para "früher eine"
	line "KIMONO-GIRL war."
	cont "Vielleicht deshalb"

	para "besucht er diesen"
	line "Ort so oft."
	done

.No:
	checkevent EVENT_ECRUTEAK_POKE_CENTER_BILL
	iffalse_jumpopenedtext .HereText
	jumpthisopenedtext

	text "Ach… Schon gut."
	done

.QuestionText:
	text "Weißt du, wer BILL"
	line "ist?"
	done

.HereText:
	text "Dann red mit ihm!"
	line "Er ist an der"
	cont "Theke!"
	done

EcruteakPokeCenter1FCooltrainerFText:
	; GSC-DE Dump
	text "JENS, der ARENA-"
	line "LEITER, ist soooo"
	cont "cool."

	para "Auch seine #MON"
	line "sind sehr stark."
	done

EcruteakPokeCenter1FGymGuyText:
	; GSC-DE Dump
	text "SEE DES ZORNS…"

	para "Das Erscheinen ei-"
	line "nes GARADOS-"
	cont "Schwarms…"

	para "Das riecht nach"
	line "Verschwörung!"
	done
