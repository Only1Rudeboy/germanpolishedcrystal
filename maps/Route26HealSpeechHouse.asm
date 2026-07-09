Route26HealSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_26, 2
	warp_event  3,  7, ROUTE_26, 2

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, picturebookshelf

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route26HealHouseTeacherScript, -1

Route26HealHouseTeacherScript:
	showtextfaceplayer Route26HealHouseRestAWhileText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special Special_FadeInQuickly
	special RestartMapMusic
	jumpthistext

	text "Hier!"

	para "Deine #mon"
	line "sehen gut aus!"

	para "Mach weiter so!"
	done
Route26HealHouseRestAWhileText:
	text "Deine #mon"
	line "sehen müde aus."

	para "Gönne ihnen eine"
	line "kleine Pause."
	done
