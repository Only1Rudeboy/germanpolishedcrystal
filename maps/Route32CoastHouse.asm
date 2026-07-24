Route32CoastHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_32_COAST, 2
	warp_event  3,  7, ROUTE_32_COAST, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  2, SPRITE_BAKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GourmetManiacScript, -1

GourmetManiacScript:
	faceplayer
	opentext
	writetext .GreetingText
	promptbutton
	special Special_ChooseItem
	iffalse_jumpopenedtext .NoItemText
	special GetGourmetManiacPrice
	iffalse_jumpopenedtext .WrongItemText
	special ItemManiac_SelectQuantity
	iffalse_jumpopenedtext .NoItemText
	special MultiplyMoneyByQuantity
	writetext .OfferText
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext .NoItemText
	special TakeItemFromMemWithQuantity
	waitsfx
	playsound SFX_TRANSACTION
	special Give_hMoneyTemp
	special PlaceMoneyTopRight
	jumpthisopenedtext

	text "Merci! Danke!"
	para "Damit kann ich"
	line "etwas"
	cont "Hervorragendes"
	cont "kreieren."
	done

.GreetingText:
	text "Hallo! Ich bin ein"
	line "Gourmet-Bäcker!"
	para "Ich koche"
	line "wunderbare"
	cont "Gerichte nur mit"
	cont "den feinsten"
	cont "Zutaten!"
	para "Hast du Zutaten,"
	line "die du mir"
	cont "verkaufen willst?"
	done

.OfferText:
	text "Ach, das riecht so"
	line "gut!"
	para "Nimmst du ¥"
	text_decimal hMoneyTemp, 3, 7
	text " dafür?"
	done

.WrongItemText:
	text "Hmmm… Das ist"
	line "nicht ganz das,"
	cont "was ich suche."
	done

.NoItemText:
	text "Ach… Na ja, schon"
	line "gut."
	done
