Route28FamousSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_28, 1
	warp_event  3,  7, ROUTE_28, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Celebrity, -1
	pokemon_event  6,  5, SKARMORY, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_GRAY, CelebritysSkarmoryText, -1

Celebrity:
	checkevent EVENT_GOT_TM47_STEEL_WING
	iftrue_jumptextfaceplayer CelebrityText2
	faceplayer
	opentext
	writetext CelebrityText1
	promptbutton
	verbosegivetmhm TM_STEEL_WING
	setevent EVENT_GOT_TM47_STEEL_WING
	endtext

CelebrityText1:
	text "Ach, du hast"
	line "mich gefunden."

	para "Bitte erzähl"
	line "niemandem von"
	cont "mir."

	para "Ich gebe dir"
	line "dies,"
	line "wenn du mich"
	cont "nicht"
	cont "verrätst. Bitte?"
	done
CelebrityText2:
	text "Es ist hart, so"
	line "berühmt zu sein."

	para "Wo immer ich auch"
	line "hingehe, die"
	cont "Leute"
	cont "folgen mir."

	para "Ich möchte nur"
	line "meine Ruhe haben…"
	done
CelebritysSkarmoryText:
	text "Skarmory: Scree!"
	done
