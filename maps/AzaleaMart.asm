AzaleaMart_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, AZALEA_TOWN, 3
	warp_event  3,  7, AZALEA_TOWN, 3

	def_coord_events

	def_bg_events

	def_object_events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_AZALEA
	object_event  2,  5, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaMartCooltrainermText, -1
	object_event  7,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaMartBugCatcherText, -1
	object_event  8,  6, SPRITE_LADY, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << MORN) | (1 << DAY), PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaMartLadyText, -1
	object_event  8,  6, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, (1 << EVE) | (1 << NITE), PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaMartRockerText, -1

AzaleaMartCooltrainermText:
	; GSC-DE Dump
	text "Hier gibt es keine"
	line "SUPERBÄLLE. Ich"
	para "werde mit #-"
	line "BÄLLEN auskommen"
	cont "müssen."
	para "Ich wünschte, KURT"
	line "würde mir einen"
	cont "seiner BÄLLE"
	cont "machen."
	done

AzaleaMartBugCatcherText:
	; GSC-DE Dump
	text "Ein SUPERBALL eig-"
	line "net sich besser"
	cont "zum Fangen von"
	cont "#MON als ein"
	cont "#BALL."
	para "Aber manchmal sind"
	line "KURTs BÄLLE"
	cont "besser."
	done


AzaleaMartLadyText:
	text "Ich kann in"
	line "Dukatia City viele"
	cont "Items kaufen, aber"
	cont "für"
	para "Feuer-Attacken ist"
	line "nichts besser"
	para "als Azaleas"
	line "Holzkohle!"
	done

AzaleaMartRockerText:
	text "Die Prototypen von"
	line "KURTs Bällen"
	para "hatten Probleme."
	line "Sympabälle fingen"
	cont "nur"
	cont "gleichgeschlechtl."
	cont "#mon, und"
	cont "Turbobälle"
	para "funktionierten nur"
	line "für drei"
	cont "#mon-Arten."
	para "Zum Glück wurden"
	line "diese Probleme"
	cont "behoben!"
	done
