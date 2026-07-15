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

	text "#mon Journal"
	para "Spezial:"
	line "ARENA-LEITER JENS!"
	para "JENS behauptet,"
	line "Entei einmal"
	para "gesehen zu haben."
	line "Er sagt:"
	para "'Es war"
	line "unglaublich. Entei"
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

	text "Moment! Du hast"
	line "keinen Platz mehr"
	cont "in deinem Team."
	done
.IntroText:
	text "Hallo, ich bin"
	line "BILL. Und wer bist"
	cont "du?"
	para "Hmm, <PLAYER>, hm?"
	line "Du kommst gerade"
	cont "recht."
	para "Die ZEITKAPSELN"
	line "sind total kaputt,"
	para "und ich bräuchte"
	line "deine Hilfe."
	done

.QuestionText:
	text "BILL: Dieses EVOLI"
	line "kam kurz"
	para "bevor die"
	line "ZEIT-KAPSEL"
	cont "ausfiel."
	para "Jemand muss sich"
	line "darum kümmern,"
	para "aber ich mag es"
	line "nicht, draußen zu"
	cont "sein."
	para "Kann ich auf dich"
	line "zählen, dass du"
	cont "mit ihm spielst,"
	cont "<PLAYER>?"
	done

.YesText:
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
	text "BILL: PROF. LIND"
	line "behauptet, EVOLI"

	para "könnte sich auf"
	line "neue, unbekannte"
	cont "Weise entwickeln."

	para "Ich muss schnell"
	line "nach DUKATIA CITY"
	cont "zu meinen Eltern,"

	para "und dann geht's"
	line "für mich zurück"
	cont "nach KANTO."

	para "Tschüss!"
	done

.NoText:
	text "Ach… Was soll ich"
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

	text "Sowohl der Tanz"
	line "der KIMONO-GIRLS"

	para "als auch die Art,"
	line "wie sie ihre"
	cont "#mon einsetzen,"
	cont "ist wunderbar!"
	done
.SurfText:
	text "Du hoffst, hier"
	line "mehr Kämpfe zu"
	cont "erleben, nicht"
	cont "wahr?"
	para "Es gibt"
	line "offensichtlich"
	cont "einen"
	para "Ort, an dem sich"
	line "Trainer treffen."
	para "Wo, fragst du?"
	para "Kurz nach OLIVIANA"
	line "CITY."
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
	line "KIMO-NO-GIRL war."
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
	text "JENS, der"
	line "ARENA-LEITER, ist"
	cont "soooo cool."
	para "Auch seine #mon"
	line "sind sehr stark."
	done
EcruteakPokeCenter1FGymGuyText:
	text "SEE DES ZORNS…"
	para "Das Erscheinen"
	line "eines"
	cont "GARADOS-Schwarms…"
	para "Das riecht nach"
	line "Verschwörung!"
	done
