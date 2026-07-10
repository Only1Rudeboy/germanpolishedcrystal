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

	text "ULI: Ich werde"
	line "gewinnen! Lass"
	cont "mich in Ruhe."
	done

BugCatchingContestant2AScript:
	jumpthistextfaceplayer

	text "ALAN: Mein PARASEK"
	line "versetzt #mon"
	cont "mit Sporo in"
	cont "Schlaf."
	done

BugCatchingContestant3AScript:
	jumpthistextfaceplayer

	text "LARS: Ich"
	line "trainiere schnelle"
	cont "#mon für"
	cont "Kämpfe."
	done

BugCatchingContestant4AScript:
	jumpthistextfaceplayer

	text "WILHELM: Mir"
	line "geht's nicht ums"
	cont "Gewinnen."

	para "Ich suche nur"
	line "seltene #mon."
	done

BugCatchingContestant5AScript:
	jumpthistextfaceplayer

	text "AXEL: Pst! Du"
	line "verscheuchst noch"
	cont "SICHLOR."

	para "Wir reden später."
	done

BugCatchingContestant6AScript:
	jumpthistextfaceplayer

	text "TILL: Du solltest"
	line "Käfer-#mon"

	para "zuerst schwächen,"
	line "bevor du einen"
	cont "Ball wirfst."
	done

BugCatchingContestant7AScript:
	jumpthistextfaceplayer

	text "CINDY: Ich liebe"
	line "Käfer-#mon."

	para "Du magst sie"
	line "bestimmt auch."
	done

BugCatchingContestant8AScript:
	jumpthistextfaceplayer

	text "ENNO: Ich sammle"
	line "Käfer-#mon"
	cont "schon,"

	para "seit ich klein"
	line "war."

	para "Ich werde auf"
	line "keinen Fall"
	cont "verlieren!"
	done

BugCatchingContestant9AScript:
	jumpthistextfaceplayer

	text "GUIDO: Wenn du"
	line "Zeit zum Reden"

	para "hast, such lieber"
	line "Käfer-#mon."
	done

BugCatchingContestant10AScript:
	jumpthistextfaceplayer

	text "MICHEL: Ich habe"
	line "viel über Käfer-"
	cont "#mon gelernt."

	para "Ich werde ganz"
	line "sicher gewinnen."
	done


