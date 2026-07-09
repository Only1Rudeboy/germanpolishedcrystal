RedsHouse1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, PALLET_TOWN, 1
	warp_event  3,  7, PALLET_TOWN, 1
	warp_event  7,  0, REDS_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  5,  1, BGEVENT_UP, RedsHouse1FTVScript

	def_object_events
	object_event  5,  3, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsMom, -1

RedsMom:
	checkevent EVENT_MET_REDS_MOM
	iftrue_jumptextfaceplayer .Text2
	setevent EVENT_MET_REDS_MOM
	jumpthistextfaceplayer

	text "Hallo!"

	para "ROT ist schon so"
	line "lange weg."

	para "Er hat sich auch"
	line "nicht gemeldet,"

	para "also weiß ich"
	line "nicht, wo er ist"
	cont "oder was er"
	cont "macht."

	para "Man sagt, keine"
	line "Nachricht sei"

	para "eine gute Nach-"
	line "richt, aber ich"
	cont "mache mir Sorgen"
	cont "um ihn."
	done
.Text2:
	text "Ich habe Angst,"
	line "dass sich ROT"

	para "verletzt oder"
	line "krank wird. Aber"

	para "er ist ein Junge"
	line "und ich bin"
	cont "stolz,"

	para "dass er macht,"
	line "was"
	line "ihm gefällt."
	done
RedsHouse1FTVScript:
	jumpthistext

	text "Sie haben"
	line "Programme, die"
	cont "man"
	cont "in JOHTO nicht"
	cont "empfängt…"
	done
