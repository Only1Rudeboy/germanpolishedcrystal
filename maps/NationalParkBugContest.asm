NationalParkBugContest_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 35, 18, ROUTE_36_NATIONAL_PARK_GATE, 1
	warp_event 35, 19, ROUTE_36_NATIONAL_PARK_GATE, 1
	warp_event 12, 47, ROUTE_35_NATIONAL_PARK_GATE, 1
	warp_event 13, 47, ROUTE_35_NATIONAL_PARK_GATE, 1

	def_coord_events

	def_bg_events
	bg_event 16, 44, BGEVENT_JUMPTEXT, NationalParkRelaxationSquareText
	bg_event 29, 31, BGEVENT_JUMPTEXT, NationalParkBattleNoticeText
	bg_event 14,  4, BGEVENT_JUMPTEXT, NationalParkTrainerTipsText
	bg_event  8, 47, BGEVENT_ITEM + FULL_HEAL, EVENT_NATIONAL_PARK_HIDDEN_FULL_HEAL

	def_object_events
	object_event 21, 29, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant1AScript, EVENT_BUG_CATCHING_CONTESTANT_1A
	object_event 30, 22, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_WANDER, 2, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant2AScript, EVENT_BUG_CATCHING_CONTESTANT_2A
	object_event 11, 18, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant3AScript, EVENT_BUG_CATCHING_CONTESTANT_3A
	object_event  9, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant4AScript, EVENT_BUG_CATCHING_CONTESTANT_4A
	object_event 25,  9, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant5AScript, EVENT_BUG_CATCHING_CONTESTANT_5A
	object_event 29, 13, SPRITE_CAMPER, SPRITEMOVEDATA_WANDER, 3, 3, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant6AScript, EVENT_BUG_CATCHING_CONTESTANT_6A
	object_event  9, 23, SPRITE_PICNICKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant7AScript, EVENT_BUG_CATCHING_CONTESTANT_7A
	object_event 13, 27, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant8AScript, EVENT_BUG_CATCHING_CONTESTANT_8A
	object_event 18,  8, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant9AScript, EVENT_BUG_CATCHING_CONTESTANT_9A
	object_event 19, 34, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant10AScript, EVENT_BUG_CATCHING_CONTESTANT_10A
	itemball_event 37, 12, SHINY_STONE, 1, EVENT_NATIONAL_PARK_SHINY_STONE
	tmhmball_event  3, 43, TM_DIG, EVENT_NATIONAL_PARK_TM_DIG

BugCatchingContestant1AScript:
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "ULI: Ich werde"
	line "gewinnen! Lass"
	cont "mich in Ruhe."
	done

BugCatchingContestant2AScript:
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "ALAN: Mein PARASEK"
	line "versetzt #MON"
	cont "mittels PILZSPORE"
	cont "in den Schlaf."
	done

BugCatchingContestant3AScript:
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "LARS: Ich trai-"
	line "niere schnelle"
	cont "#MON für"
	cont "den Kampf."
	done

BugCatchingContestant4AScript:
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "WILHELM: Gewin-"
	line "nen ist mir nicht"
	cont "wichtig."

	para "Ich suche seltene"
	line "#MON."
	done

BugCatchingContestant5AScript:
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "AXEL: Pst! Du"
	line "hast SICHLOR ver-"
	cont "schreckt. Ich rede"
	cont "später mit dir."
	done

BugCatchingContestant6AScript:
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "TILL: Schwäche"
	line "Käfer-#MON, ehe"

	para "du einen #BALL"
	line "wirfst."
	done

BugCatchingContestant7AScript:
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "CINDY: Was ist"
	line "los?"

	para "Du magst Käfer-"
	line "#MON doch"
	cont "auch, oder?"
	done

BugCatchingContestant8AScript:
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "ENNO: Seit meiner"
	line "Kindheit sammle"

	para "ich Käfer-"
	line "#MON."

	para "Du kannst mich"
	line "nicht besiegen!"
	done

BugCatchingContestant9AScript:
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "GUIDO: Wenn du"
	line "Zeit für Gespräche"

	para "hast, solltest du"
	line "lieber Käfer-"
	cont "#MON suchen."
	done

BugCatchingContestant10AScript:
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "MICHEL: Ich habe"
	line "Käfer-#MON"
	cont "lange studiert."

	para "Ich werde sicher-"
	line "lich gewinnen."
	done
