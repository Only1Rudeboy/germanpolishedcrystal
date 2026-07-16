CeladonMansion3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  0, CELADON_MANSION_ROOF, 1
	warp_event  1,  0, CELADON_MANSION_2F, 2
	warp_event  6,  0, CELADON_MANSION_2F, 3
	warp_event  7,  0, CELADON_MANSION_ROOF, 2

	def_coord_events

	def_bg_events
	bg_event  5,  8, BGEVENT_UP, MapCeladonMansion3FSignpost0Script
	bg_event  4,  3, BGEVENT_UP, MapCeladonMansion3FSignpost1Script
	bg_event  1,  6, BGEVENT_UP, MapCeladonMansion3FSignpost2Script
	bg_event  1,  3, BGEVENT_UP, MapCeladonMansion3FSignpost3Script

	def_object_events
	object_event  3,  6, SPRITE_COOL_DUDE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GameFreakGameDesignerScript, -1
	object_event  3,  4, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GameFreakGraphicArtistScript, -1
	object_event  0,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, GameFreakProgrammerText, -1
	object_event  0,  4, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 2, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GameFreakCharacterDesignerText, -1

GameFreakGameDesignerScript:
	checkevent EVENT_DECO_POSTER_4
	iftrue_jumptextfaceplayer GameFreakDesignerGaveDiplomaText
	faceplayer
	opentext
	writetext GameFreakGameDesignerText
	setval16 NUM_POKEMON
	special CountCaught
	iftruefwd .CompletedPokedex
	waitendtext

.CompletedPokedex:
	promptbutton
	writetext GameFreakGameDesignerCompletedPokedexText
	playsound SFX_DEX_FANFARE_230_PLUS
	waitsfx
	writetext GameFreakGameDesignerPauseForDiplomaText
	waitbutton
	writetext GameFreakGameDesignerGiveDiplomaText
	setevent EVENT_DECO_POSTER_4
	playsound SFX_KEY_ITEM
	waitsfx
	promptbutton
	callasm Diploma
	writetext GameFreakGameDesignerDiplomaSentText
	waitbutton
	setevent EVENT_ENABLE_DIPLOMA_PRINTING
	jumpthisopenedtext

	text "Der Grafikdesigner"
	line "druckt dir ein"
	cont "Diplom aus."
	para "Das solltest du"
	line "herumzeigen!"
	done

GameFreakGraphicArtistScript:
	faceplayer
	opentext
	checkevent EVENT_ENABLE_DIPLOMA_PRINTING
	iftruefwd .CanPrintDiploma
	writetext GameFreakGraphicArtistText
	waitendtext

.CanPrintDiploma:
	writetext GameFreakGraphicArtistPrintDiplomaText
	yesorno
	iffalsefwd .Refused
	special PrintDiploma
	closetext
	end

.Refused:
	writetext GameFreakGraphicArtistRefusedText
	waitendtext

MapCeladonMansion3FSignpost0Script:
	jumpthistext

	; GSC-DE Dump
	text "GAME FREAK"
	line "ENTWICKLUNGSRAUM"
	done

MapCeladonMansion3FSignpost1Script:
	jumpthistext

	; GSC-DE Dump
	text "Das ist eine sehr"
	line "detaillierte"
	cont "Zeichnung eines"
	cont "hübschen Mädchens."
	done

MapCeladonMansion3FSignpost2Script:
	opentext
	writetext CeladonMansion3FGameProgramText
	nooryes
	iffalse_endtext
	writetext CeladonMansion3FAreYouSureText
	nooryes
	iffalse_endtext
	callasm .MessWithGameProgram
	endtext

.MessWithGameProgram:
	ld a, ERR_PEBKAC
	jmp Crash

MapCeladonMansion3FSignpost3Script:
	jumpthistext

	; GSC-DE Dump
	text "Es ist angefüllt"
	line "mit Utensilien."
	cont "Da ist sogar eine"
	cont "#puppe."
	done

GameFreakGameDesignerText:
	; GSC-DE Dump
	text "Ist das richtig?"
	para "Ich bin der"
	line "SPIELDESIGNER!"
	para "Es ist schwer,"
	line "den #dex zu"
	cont "erstellen, aber"
	cont "gib nicht auf!"
	done

GameFreakGameDesignerCompletedPokedexText:
	; GSC-DE Dump
	text "Wow! Hervorragend!"
	line "Dein #dex ist"
	cont "komplett!"
	para "Gratuliere!"
	done

GameFreakGameDesignerPauseForDiplomaText:
	; GSC-DE Dump
	text "Der GRAFIKER wird"
	line "dir ein DIPLOM"
	cont "ausdrucken."
	para "Gib ruhig damit"
	line "an."
	done

GameFreakGameDesignerGiveDiplomaText:
	text "<PLAYER> erhält"
	line "ein DIPLOM!"
	done

GameFreakGameDesignerDiplomaSentText:
	text "Das DIPLOM kam"
	line "nach Hause."
	done

GameFreakDesignerGaveDiplomaText:
	; GSC-DE Dump
	text "Der GRAFIKER wird"
	line "dir ein DIPLOM"
	cont "ausdrucken."
	para "Gib ruhig damit"
	line "an."
	done

GameFreakGraphicArtistText:
	; GSC-DE Dump
	text "Ich bin der"
	line "GRAFIKER."
	para "Ich habe eine"
	line "Zeichnung von dir"
	cont "angefertigt!"
	done

GameFreakGraphicArtistPrintDiplomaText:
	; GSC-DE Dump
	text "Ich bin der"
	line "GRAFIKER."
	para "Oh, du hast deinen"
	line "#dex fertig"
	cont "gestellt?"
	para "Möchtest du, dass"
	line "ich dir ein DIPLOM"
	cont "ausdrucke?"
	done

GameFreakGraphicArtistRefusedText:
	; GSC-DE Dump
	text "Gib mir Bescheid,"
	line "wenn ich dir dein"
	cont "DIPLOM ausdrucken"
	cont "soll."
	done

GameFreakProgrammerText:
	; GSC-DE Dump
	text "Wer, ich? Ich bin"
	line "der PROGRAMMIERER."
	para "Probier die"
	line "Spielautomaten"
	cont "aus!"
	done

GameFreakCharacterDesignerText:
	; GSC-DE Dump + PC (LYRA)
	text "Sind die ZWILLINGE"
	line "nicht"
	cont "anbetungswürdig?"
	para "JASMIN ist auch"
	line "sehr hübsch."
	para "Oh, ich bete"
	line "sie an!"
	done

CeladonMansion3FGameProgramText:
	; GSC-DE Dump + PC prompt
	text "Das ist das Spiel-"
	line "programm. Die"
	para "falsche Handhabe"
	line "könnte Fehler im"
	cont "Spiel verursachen!"
	para "Willst du es"
	line "riskieren?"
	done

CeladonMansion3FAreYouSureText:
	; PC-only Class C
	text "Bist du sicher?"
	line "Könnte abstürzen!"
	done
