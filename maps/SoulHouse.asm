SoulHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  9, LAVENDER_TOWN, 6
	warp_event  5,  9, LAVENDER_TOWN, 6
	warp_event  4,  2, SOUL_HOUSE_B1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  7, SPRITE_AGATHA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, AgathaScript, -1
	object_event  4,  2, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFujiScript, -1 ; TODO: EVENT_SOUL_HOUSE_MR_FUJI
	object_event  7,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, SoulHouseTeacherText, -1
	object_event  2,  7, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, SoulHouseLassText, -1
	object_event  1,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, SoulHouseGrannyText, -1

	object_const_def
	const SOULHOUSE_AGATHA

AgathaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_AGATHA
	iftruefwd AgathaAfterScript
	writetext AgathaSeenText
	waitbutton
	closetext
	winlosstext AgathaBeatenText, 0
	setlasttalked SOULHOUSE_AGATHA
	loadtrainer AGATHA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_AGATHA
	opentext
	writetext AgathaRewardText
	promptbutton
	verbosegivetmhm TM_SHADOW_CLAW
	setevent EVENT_GOT_TM65_SHADOW_CLAW_FROM_AGATHA
AgathaAfterScript:
	jumpthisopenedtext

	text "Ich erwarte"
	line "Großes"
	line "von dir, wenn du"
	cont "es dir wünschst."
	done

MrFujiScript:
	faceplayer
	opentext
	writetext MrFujiText
	waitbutton
	checkevent EVENT_GOT_SILPHSCOPE2_FROM_MR_FUJI
	iftrue_endtext
	writetext MrFujiGiveSilphScopeText
	waitbutton
	verbosegivekeyitem SILPHSCOPE2
	writetext MrFujiUseThisText
	waitbutton
	setevent EVENT_GOT_SILPHSCOPE2_FROM_MR_FUJI
	endtext

MrFujiText:
	text "MR. FUJI: Sei"
	line "willkommen."

	para "Hm… Du scheinst"
	line "deine #mon"

	para "mit Sorgfalt und"
	line "Liebe"
	cont "aufzuziehen."

	para "Solche, die #-"
	line "MON verehren,"

	para "zollen hier den"
	line "dahingegangenen"
	cont "#mon ihren"
	cont "Respekt."

	para "Bekunde bitte"
	line "dein"
	line "Beileid für die"

	para "Seelen der"
	line "dahingegangenen"
	cont "#mon."

	para "Ich bin sicher,"
	line "das macht sie"
	cont "glücklich."
	done





MrFujiGiveSilphScopeText:
	text "Hier, ich habe"
	line "ein Geschenk für"
	cont "dich."

	para "Bitte, nimm es."
	done

MrFujiUseThisText:
	text "Du darfst das"
	line "benutzen, um die"

	para "Seelen ruheloser"
	line "#mon zu"
	cont "beruhigen."
	done

SoulHouseTeacherText:
	text "Ich glaube, hier"
	line "liegen noch"
	cont "andere"
	cont "#mon begraben."

	para "Es gibt viele"
	line "Kammern, die nur"
	cont "MR. FUJI betreten"
	cont "darf."
	done





SoulHouseLassText:
	text "Ich besuche mit"
	line "meiner Mutter die"
	cont "Grabmale der"
	cont "#mon…"
	done





SoulHouseGrannyText:
	text "Die #mon, die"
	line "bei mir lebten…"

	para "Ich hatte sie so"
	line "lieb wie meine"
	cont "Enkelkinder…"
	done





AgathaSeenText:
	text "Agatha: Hallo,"
	line "Kind."

	para "Mein Name ist"
	line "Agatha."

	para "Jahrelang kämpfte"
	line "ich als Mitglied"
	cont "der TOP VIER."

	para "…………"

	para "Bist du gekommen,"
	line "einem #mon"

	para "nachzutrauern?"
	line "Es ist vielleicht"

	para "nicht mehr hier."

	para "MR. FUJI verlegte"
	line "viele Gräber"

	para "woanders, nachdem"
	line "die Radiostation"

	para "übernahm."
	line "…………"

	para "Er hätte kämpfen"
	line "können, um den"

	para "Turm zu retten!"
	line "Aber er mischte"

	para "sich nicht ein."
	line "Zu viel Angst,"

	para "seinen Einfluss"
	line "zu missbrauchen."

	para "Dieser alte Narr…"

	para "Macht ist dazu"
	line "da, genutzt zu"

	para "werden!"
	line "Du verstehst"
	cont "mich."

	para "Ich zeige dir,"
	line "was ein mächtiger"
	cont "Trainer kann!"
	done

AgathaBeatenText:
	text "Ach, du meine"
	line "Güte!"
	done

AgathaRewardText:
	text "Du bist wirklich"
	line "etwas Besonderes,"
	cont "Kind."

	para "Ein starker"
	line "Trainer"
	line "mit einer tiefen"

	para "Verbindung zu"
	line "deinen #mon."

	para "Hier, nimm diese"
	line "TM!"
	done
