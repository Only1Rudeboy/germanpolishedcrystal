CianwoodPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, CIANWOOD_CITY, 3
	warp_event  6,  7, CIANWOOD_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalChuckScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  6,  3, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodGymGuyScript, -1
	object_event  1,  5, SPRITE_PICNICKER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodPokeCenter1FLassText, -1
	object_event  9,  7, SPRITE_JUGGLER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodPokeCenter1FSuperNerdText, -1
	object_event 11,  5, SPRITE_RICH_BOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodPokeCenter1FRichBoyText, -1

PokemonJournalChuckScript:
	setflag ENGINE_READ_CHUCK_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Spezial:"
	line "Chuck!"

	para "Man sagt, Chuck"
	line "liebe süße"

	para "Nachspeisen."

	para "Trotzdem sah man"
	line "ihn auch unter"

	para "einem Wasserfall"
	line "trainieren, um"

	para "sie loszuwerden."
	done

CianwoodGymGuyScript:
	checkevent EVENT_GOT_HM04_STRENGTH
	iffalsefwd .no_strength
	checkevent EVENT_BEAT_CHUCK
	iftrue_jumptextfaceplayer .WinText
	jumptextfaceplayer .Text

.no_strength
	faceplayer
	opentext
	writetext .Text
	waitbutton
	writetext .StrengthText1
	promptbutton
	verbosegivetmhm HM_STRENGTH
	setevent EVENT_GOT_HM04_STRENGTH
	writetext .StrengthText2
	waitendtext

.Text:
	text "Die Trainer in"
	line "der PKMN-ARENA"

	para "sind richtige"
	line "Schlägertypen."

	para "Wenn ich dort"
	line "rum-"
	line "stehe, schnappen"
	cont "sie mich."

	para "Ein Tipp: Der"
	line "LEI-"
	line "TER setzt gerne"

	para "Kampf-#mon"
	line "ein."

	para "Du solltest ihn"
	line "mit Psycho-#-"
	cont "MON überraschen."

	para "Besiege seine"
	line "#mon, bevor sie"

	para "ihre Kraft ein-"
	line "setzen können."

	para "Und die Felsen"
	line "in der Mitte der"
	cont "PKMN-ARENA?"

	para "Räume sie aus dem"
	line "Weg, denn sonst"

	para "wirst du den"
	line "ARENALEITER nie"
	cont "erreichen."

	para "Hast du dich ver-"
	line "schoben, verlasse"
	cont "die PKMN-ARENA."
	done
.StrengthText1:
	text "Du kannst die"
	line "Felsen nicht"
	cont "wegstoßen?"

	para "Nimm das und"
	line "bring"
	line "deinem #mon"
	cont "Strength bei!"
	done

.StrengthText2:
	text "Viel Glück!"
	done

.WinText:
	text "<PLAYER>! Du"
	line "hast gewonnen!"

	para "Das sah ich dir"
	line "schon von"
	cont "weitem an!"
	done

CianwoodPokeCenter1FLassText:
	text "Hast du schon den"
	line "#MANIAC getrof-"
	cont "fen?"

	para "Er gibt immer mit"
	line "seinen seltenen"
	cont "#mon an."
	done
CianwoodPokeCenter1FSuperNerdText:
	text "Ich liebe es, mit"
	line "meinen"
	cont "trainierten"

	para "#mon anzugeben."
	line "Du etwa nicht?"

	para "Ich werde einige"
	line "Kämpfe"
	cont "bestreiten,"

	para "um mit meinen"
	line "#mon anzugeben!"
	done
CianwoodPokeCenter1FRichBoyText:
	text "In dieser Stadt"
	line "gibt es keinen"
	cont "Markt,"

	para "deshalb"
	line "importieren"
	line "wir Waren über"
	cont "das Meer."
	done
