GoldenrodHappinessRater_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 3
	warp_event  3,  7, GOLDENROD_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, radio2

	def_object_events
	object_event  2,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodHappinessRaterTeacherScript, -1
	object_event  5,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodHappinessRaterPokefanMText, -1
	object_event  5,  6, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodHappinessRaterTwinText, -1

GoldenrodHappinessRaterTeacherScript:
	faceplayer
	opentext
	writetext GoldenrodHappinessRaterAskCheckText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	special Special_MintTeaPickMon
	iffalse_jumpopenedtext .RefusedText
	ifequalfwd 1, .Egg
	special GetSelectedPokemonHappiness
	writetext GoldenrodHappinessRaterTeacherText
	promptbutton
	ifequalfwd 255, .AdoresYou                            ; 255
	ifgreater AFFECTION_THRESHOLD_2 - 1, .LovesYouALot    ; 220-254
	ifgreater AFFECTION_THRESHOLD_1 - 1, .Affectionate    ; 180-219
	ifgreater HAPPINESS_THRESHOLD_2 - 1, .ReallyTrustsYou ; 160-179
		assert HAPPINESS_TO_EVOLVE == HAPPINESS_THRESHOLD_2
		assert MAX_RETURN_HAPPINESS == HAPPINESS_THRESHOLD_2
	ifgreater HAPPINESS_THRESHOLD_1 - 1, .SortOfHappy     ; 100-159
		assert FRIEND_BALL_HAPPINESS >= HAPPINESS_THRESHOLD_1 && FRIEND_BALL_HAPPINESS < HAPPINESS_THRESHOLD_2
		assert HATCHED_HAPPINESS >= HAPPINESS_THRESHOLD_1 && HATCHED_HAPPINESS < HAPPINESS_THRESHOLD_2
	ifgreater 50 - 1, .QuiteCute                          ; 50-99
		assert 50 < BASE_HAPPINESS
	ifgreater 0, .NotUsedToYou                            ; 1-49
	jumpthisopenedtext                                    ; 0

	text "Es scheint dich"
	line "gar nicht zu"
	cont "mögen. Es sieht"
	cont "gemein aus."
	done



.Egg:
	jumpthisopenedtext

	text "Das ist ein EI."
	line "Es hat noch keine"
	cont "Gefühle."
	done

.AdoresYou:
	jumpthisopenedtext

	text "Es vergöttert"
	line "dich! Es könnte"
	cont "dich nicht mehr"
	cont "lieben."

	para "Schon beim"
	line "Anblick werde ich"
	cont "glücklich! ♥"
	done

.LovesYouALot:
	jumpthisopenedtext

	text "Es sieht sehr"
	line "glücklich aus! Es"
	cont "muss dich sehr"
	cont "gern haben."
	done
.Affectionate:
	jumpthisopenedtext

	text "Es ist sehr"
	line "anhänglich!"

	para "Es will wohl ein"
	line "bisschen verwöhnt"
	cont "werden."
	done

.ReallyTrustsYou:
	jumpthisopenedtext

	text "Ich habe den Ein-"
	line "druck, dass es"
	cont "dir"
	cont "wirklich"
	cont "vertraut."
	done
.SortOfHappy:
	jumpthisopenedtext

	text "Es verhält sich"
	line "dir gegenüber"
	cont "sehr"
	cont "freundlich. Es"
	cont "muss glücklich"
	cont "sein."
	done
.QuiteCute:
	jumpthisopenedtext

	text "Es ist sehr süß."
	done

.NotUsedToYou:
	jumpthisopenedtext

	text "Du solltest es"
	line "besser behandeln."
	cont "Es hat sich noch"
	cont "nicht an dich ge-"
	cont "wöhnt."
	done
.RefusedText:
	text "Komm wieder, wenn"
	line "du es dir anders"
	cont "überlegst."
	done

GoldenrodHappinessRaterAskCheckText:
	text "Wenn du deine"
	line "#mon gut"

	para "behandelst,"
	line "lieben sie dich"
	cont "zurück."

	para "Soll ich die"
	line "Zuneigung deines"
	cont "#mon prüfen?"
	done

GoldenrodHappinessRaterTeacherText:
	text "Behandelst du"
	line "deine #mon gut,"

	para "werden sie dich"
	line "regelrecht"
	cont "lieben."

	para "Oh! Lass mich"
	line "dein"
	line "@"
	text " sehen…"
	done






GoldenrodHappinessRaterPokefanMText:
	text "Ständig verliere"
	line "ich in Kämpfen"
	cont "und"

	para "meine #mon"
	line "werden immer be-"
	cont "siegt…"

	para "Das mag der Grund"
	line "sein, warum mich"
	cont "meine #mon"
	cont "nicht mögen…"
	done






GoldenrodHappinessRaterTwinText:
	text "Wenn ich meinem"
	line "#mon ein Item"
	cont "gebe, dann freut"
	cont "es sich!"
	done






