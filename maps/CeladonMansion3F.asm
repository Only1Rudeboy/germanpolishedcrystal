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

	text "Game Freak"
	line "Entwicklungsraum"
	done

MapCeladonMansion3FSignpost1Script:
	jumpthistext

	text "Eine detaillierte"
	line "Zeichnung eines"
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

	text "Es steckt voller"
	line "Referenzmaterial."
	cont "Sogar eine #"
	cont "Puppe ist dabei!"
	done

GameFreakGameDesignerText:
	text "Ach, wirklich?"

	para "Ich bin der"
	line "Spieledesigner!"

	para "Den #dex zu"
	line "füllen ist hart,"
	cont "aber gib nicht"
	cont "auf!"
	done

GameFreakGameDesignerCompletedPokedexText:
	text "Wow! Exzellent! Du"
	line "hast deinen"
	cont "#dex komplett!"

	para "Glückwunsch!"
	done

GameFreakGameDesignerPauseForDiplomaText:
	text "Als Anerkennung"
	line "deiner Leistung…"
	cont "hier, bitte!"

	para "Ein druckfrisches"
	line "Diplom!"
	done

GameFreakGameDesignerGiveDiplomaText:
	text "<PLAYER> erhielt"
	line "ein Diplom!"
	done

GameFreakGameDesignerDiplomaSentText:
	text "Das Diplom kam"
	line "nach Hause."
	done


GameFreakDesignerGaveDiplomaText:
	text "Glückwunsch zum"
	line "Abschluss deines"
	cont "#dex!"

	para "Zeig doch dein"
	line "Diplom herum!"
	done

GameFreakGraphicArtistText:
	text "Ich bin der"
	line "Grafikdesigner."

	para "Ich hab dich"
	line "gezeichnet!"
	done

GameFreakGraphicArtistPrintDiplomaText:
	text "Ich bin der"
	line "Grafikdesigner."

	para "Oh, du hast deinen"
	line "#dex komplett?"

	para "Soll ich dein"
	line "Diplom drucken?"
	done

GameFreakGraphicArtistRefusedText:
	text "Sag Bescheid, wenn"
	line "dein Diplom"
	cont "gedruckt sein"
	cont "soll."
	done

GameFreakProgrammerText:
	text "Wer, ich? Ich bin"
	line "der Programmierer."

	para "Nutzt das"
	line "Wundertausch-"
	cont "Terminal!"
	done

GameFreakCharacterDesignerText:
	text "Ist Lyra nicht"
	line "süß?"

	para "Jasmine ist auch"
	line "hübsch."

	para "Ich liebe die"
	line "beiden!"
	done



CeladonMansion3FGameProgramText:
	text "Das ist das"
	line "Spielprogramm."

	para "Daran zu pfuschen"
	line "könnte einen Bug"

	para "verursachen!"
	line "Willst du es"
	cont "riskieren?"
	done

CeladonMansion3FAreYouSureText:
	text "Bist du sicher?"
	line "Könnte abstürzen!"
	done
