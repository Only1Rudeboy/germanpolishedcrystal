SaffronHitmontopKidHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, SAFFRON_CITY, 19
	warp_event  3,  7, SAFFRON_CITY, 19

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  4, SPRITE_CHILD, SPRITEMOVEDATA_WANDER, 2, 2, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SaffronHitmontopKidHouseChildScript, -1
	object_event  2,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 2, 2, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronHitmontopKidHouseTeacherScript, -1

	object_const_def
	const SAFFRONHITMONTOPKIDHOUSE_CHILD

SaffronHitmontopKidHouseChildScript:
	showtextfaceplayer .Text1
	applymovement SAFFRONHITMONTOPKIDHOUSE_CHILD, .SpinMovement
	faceplayer
	pause 20
	checkpoke HITMONTOP
	iffalsefwd .Done
	showemote EMOTE_SHOCK, SAFFRONHITMONTOPKIDHOUSE_CHILD, 15
	showtext .Text2
	applymovement SAFFRONHITMONTOPKIDHOUSE_CHILD, .Spin2Movement
	pause 20
	showtext .Text3
	setevent EVENT_SHOWED_SAFFRON_KID_HITMONTOP
.Done
	end

.Text1:
	text "Top! Top!"
	line "Hit-mon-TOP!"
	done

.Text2:
	text "Top… Top? TOP!"
	line "HITMONTOP! ♥"
	done

.Text3:
	text "Das ist ein"
	line "HITMONTOP!"
	cont "Boah! So toll!"
	done

.SpinMovement:
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
.Spin2Movement:
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	step_end

SaffronHitmontopKidHouseTeacherScript:
	checkevent EVENT_GOT_AIR_BALLOON_FROM_SAFFRON
	iftrue_jumptextfaceplayer .Text3
	faceplayer
	opentext
	checkevent EVENT_SHOWED_SAFFRON_KID_HITMONTOP
	iffalse_jumpopenedtext .Text1
	writetext .Text2
	promptbutton
	verbosegiveitem AIR_BALLOON
	iffalse_endtext
	setevent EVENT_GOT_AIR_BALLOON_FROM_SAFFRON
	jumpthisopenedtext

.Text3:
	text "Mein Sohn hat"
	line "endlich sein"
	line "Lieblings-#mon"
	cont "getroffen."
	done

.Text1:
	text "Mein Sohn tut"
	line "so, als wäre er"
	cont "ein #mon."

	para "Das ist manchmal"
	line "echt peinlich."

	para "Vielleicht würde"
	line "er ruhig werden,"
	cont "wenn er ein"
	cont "echtes HITMON-"
	cont "TOP sähe…"
	done

.Text2:
	text "Ach du meine!"
	line "Du hast meinen"

	para "Sohn so glücklich"
	line "gemacht!"

	para "Als Dank — nicht"
	line "viel, aber nimm"
	cont "das hier."
	done
