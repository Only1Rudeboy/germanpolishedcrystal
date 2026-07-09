CianwoodPharmacy_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  7, CIANWOOD_CITY, 4
	warp_event  4,  7, CIANWOOD_CITY, 4

	def_coord_events

	def_bg_events
	bg_event  5,  1, BGEVENT_JUMPSTD, radio2
	bg_event  6,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  4,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodPharmacist, -1

CianwoodPharmacist:
	checkevent EVENT_GOT_SECRETPOTION_FROM_PHARMACY
	iftruefwd .Mart
	checkevent EVENT_JASMINE_EXPLAINED_AMPHYS_SICKNESS
	iffalsefwd .Mart
	faceplayer
	opentext
	writetext PharmacistGiveSecretpotionText
	promptbutton
	verbosegivekeyitem SECRETPOTION
	setevent EVENT_GOT_SECRETPOTION_FROM_PHARMACY
	writetext PharmacistDescribeSecretpotionText
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end

.Mart:
	scall .PokeMart
	turnobject LAST_TALKED, UP
	end

.PokeMart:
	pokemart MARTTYPE_PHARMACY, MART_CIANWOOD

PharmacistGiveSecretpotionText:
	text "Deinen #mon"
	line "scheint es gut zu"

	para "gehen. Bedrückt"
	line "dich etwas?"

	para "…"

	para "Dem #mon vom"
	line "LEUCHTTURM geht"
	cont "es"
	cont "nicht gut?"

	para "Ich hab's!"

	para "Das sollte das"
	line "Problem lösen."
	done


PharmacistDescribeSecretpotionText:
	text "Mein GEHEIMTRANK"
	line "ist sehr stark."

	para "Ich biete ihn nur"
	line "in Notfällen an."
	done


