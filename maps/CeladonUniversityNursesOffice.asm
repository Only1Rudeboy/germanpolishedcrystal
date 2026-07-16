CeladonUniversityNursesOffice_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  5, CELADON_UNIVERSITY_2F, 7
	warp_event  3,  5, CELADON_UNIVERSITY_2F, 7

	def_coord_events

	def_bg_events
	bg_event  2,  0, BGEVENT_JUMPTEXT, CeladonUniversityNursesOfficeSignText

	def_object_events
	object_event  4,  2, SPRITE_BOWING_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonUniversityNursesOfficeNurseScript, -1

CeladonUniversityNursesOfficeNurseScript:
	showtextfaceplayer CeladonUniversityNursesOfficeNurseText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special Special_FadeInQuickly
	special RestartMapMusic
	jumpthistext

	text "Pass auf dich auf!"
	done

CeladonUniversityNursesOfficeNurseText:
	text "Komm rein. Geht es"
	line "dir gut?"
	para "Oder sind deine"
	line "#MON er-"
	cont "schöpft?"
	para "Ruh dich hier"
	line "etwas aus!"
	done

CeladonUniversityNursesOfficeSignText:
	text "Gesunde #MON"
	line "sind glückliche"
	cont "#MON."
	para "Lass deine Freunde"
	line "im Kampf nicht"
	cont "ohnmächtig werden!"
	done
