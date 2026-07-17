SnowtopMountainInside_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, SnowtopMountainInsideFixFacing

	def_warp_events
	warp_event  9, 29, RUGGED_ROAD_NORTH, 1
	warp_event 27, 29, SNOWTOP_MOUNTAIN_OUTSIDE, 1
	warp_event 26,  4, HIDDEN_CAVE_GROTTO, 1

	def_coord_events

	def_bg_events
	bg_event 26,  3, BGEVENT_JUMPSTD, cavegrotto, HIDDENGROTTO_SNOWTOP_MOUNTAIN_INSIDE
	bg_event  6, 22, BGEVENT_ITEM + ZINC, EVENT_SNOWTOP_MOUNTAIN_INSIDE_HIDDEN_ZINC

	def_object_events
	object_event 28, 14, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_AZURE, OBJECTTYPE_SCRIPT, 0, KimonoGirlAmiScript, -1
	object_event  5, 20, SPRITE_SKIER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SnowtopMountainInsideSkierScript, -1
	itemball_event  8,  8, ETHER, 1, EVENT_SNOWTOP_MOUNTAIN_INSIDE_ETHER
	itemball_event 16,  9, HEAVY_BOOTS, 1, EVENT_SNOWTOP_MOUNTAIN_INSIDE_HEAVY_BOOTS
	itemball_event 31, 17, COVERT_CLOAK, 1, EVENT_SNOWTOP_MOUNTAIN_INSIDE_COVERT_CLOAK

	object_const_def
	const SNOWTOPMOUNTAININSIDE_KIMONO_GIRL

SnowtopMountainInsideFixFacing:
	callasm .FixFacing
	endcallback

.FixFacing:
	ld hl, wPrevWarp
	ld a, [hli]
	dec a ; warp #1 of SNOWTOP_MOUNTAIN_OUTSIDE comes here
	ret nz
	assert wPrevWarp + 1 == wPrevMapGroup
	ld a, [hli]
	cp GROUP_SNOWTOP_MOUNTAIN_OUTSIDE
	ret nz
	assert wPrevMapGroup + 1 == wPrevMapNumber
	ld a, [hl]
	cp MAP_SNOWTOP_MOUNTAIN_OUTSIDE
	ret nz
	ld a, [wPlayerSpriteSetupFlags]
	or (1 << 5) | UP
	ld [wPlayerSpriteSetupFlags], a
	ret

KimonoGirlAmiScript:
	checkevent EVENT_GOT_PP_MAX_FROM_KIMONO_GIRL_AMI
	iftrue_jumptextfaceplayer .OutroText
	faceplayer
	checkevent EVENT_BEAT_KIMONO_GIRL_AMI
	iftruefwd .Beaten
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalse_jumptext .IntroText
	showtext .SeenText
	winlosstext .BeatenText, 0
	setlasttalked SNOWTOPMOUNTAININSIDE_KIMONO_GIRL
	loadtrainerwithpal KIMONO_GIRL, AMI, TRAINERPAL_AMI
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_KIMONO_GIRL_AMI
.Beaten:
	opentext
	writetext .AfterText
	promptbutton
	verbosegiveitem PP_MAX
	iffalse_endtext
	setevent EVENT_GOT_PP_MAX_FROM_KIMONO_GIRL_AMI
	jumpthisopenedtext

.OutroText:
	text "Meine Cousinen und"
	line "ich tanzen in TEAK"
	cont "CITY, aber"
	para "wir reisen auch"
	line "gern umher."
	done

.IntroText:
	text "Ich bin ein"
	line "Kimono-Girl."
	para "Kennst du meine"
	line "fünf tanzenden"
	cont "Cousinen in TEAK"
	cont "CITY?"
	para "Sag Bescheid, wenn"
	line "du sie triffst."
	done

.SeenText:
	text "Würde ich hier"
	line "tanzen, würden"

	para "meine Sandalen"
	line "rutschen oder am"
	cont "Eis kleben."

	para "Also kämpfen wir"
	line "lieber!"
	done

.BeatenText:
	text "Ach, du bist"
	line "furchterregend…"
	done

.AfterText:
	text "Du bist ein"
	line "ausgewogener"
	cont "Trainer."
	para "Bitte nutze dieses"
	line "Item!"
	done

SnowtopMountainInsideSkierScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_ICY_WIND_INTRO
	iftruefwd SnowtopMountainInsideTutorIcyWindScript
	writetext SnowtopMountainInsideSkierText
	waitbutton
	setevent EVENT_LISTENED_TO_ICY_WIND_INTRO
SnowtopMountainInsideTutorIcyWindScript:
	writetext Text_SnowtopMountainInsideTutorIcyWind
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_SnowtopMountainInsideTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval ICY_WIND
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpopenedtext Text_SnowtopMountainInsideTutorRefused

.NoSilverLeaf
	jumpthisopenedtext

	text "Ach, aber du hast"
	line "kein Silberblatt."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "O.K.! Dein #MON"
	line "kennt jetzt"
	cont "Eissturm!"
	done

SnowtopMountainInsideSkierText:
	text "Wind und Hagel in"
	line "dieser Schlucht"
	para "können wehtun,"
	line "wenn du nicht für"
	cont "Eiswetter gerüstet"
	cont "bist."
	para "Das könnte eine"
	line "gute Technik für"
	cont "ein #MON sein!"
	done

Text_SnowtopMountainInsideTutorIcyWind:
	text "Ich bringe einem"
	line "deiner #MON"
	para "Eissturm bei, wenn"
	line "du mir ein"
	para "Silberblatt gibst."
	done


Text_SnowtopMountainInsideTutorQuestion:
	text "Soll ich deinem"
	line "#MON"
	cont "Eissturm"
	cont "beibringen?"
	done

Text_SnowtopMountainInsideTutorRefused: ; text > text
	text "Brr…"
	done
