Route17South_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route17SouthAlwaysOnBikeCallback

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 11, 69, BGEVENT_ITEM + MAX_ETHER, EVENT_ROUTE_17_SOUTH_HIDDEN_MAX_ETHER
	bg_event 10, 121, BGEVENT_ITEM + MAX_ELIXIR, EVENT_ROUTE_17_SOUTH_HIDDEN_MAX_ELIXIR
	bg_event  9, 62, BGEVENT_JUMPTEXT, Route17SouthNotice1Text
	bg_event  9, 69, BGEVENT_JUMPTEXT, Route17SouthTrainerTips1Text
	bg_event  9, 92, BGEVENT_JUMPTEXT, Route17SouthTrainerTips2Text
	bg_event  9, 99, BGEVENT_JUMPTEXT, Route17SouthNotice2Text

	def_object_events
	object_event 12,  7, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBikerDale, -1
	object_event  4, 15, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBikerReilly, -1
	object_event 18, 22, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBikerJacob, -1
	object_event  2, 35, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBikerDan, -1
	object_event  3, 54, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBikerGlenn, -1
	object_event 11, 63, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBikerJoel, -1
	object_event 13, 70, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBikerAiden, -1
	object_event  3, 84, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBikerTeddy, -1
	object_event  6, 126, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  1, 27, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerRoughneckBrian, -1
	object_event  6, 40, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerRoughneckTheron, -1
	object_event  4, 89, SPRITE_ROUGHNECK, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerRoughneckMarkey, -1

Route17SouthAlwaysOnBikeCallback:
	setflag ENGINE_ALWAYS_ON_BIKE
	setflag ENGINE_DOWNHILL
	endcallback

GenericTrainerBikerReilly:
	generictrainer BIKER, REILLY, EVENT_BEAT_BIKER_REILLY, BikerReillySeenText, BikerReillyBeatenText

	text "Werd' nicht frech,"
	line "du Null aus JOHTO!"
	done
BikerReillySeenText:
	text "Heh, du! Bist du"
	line "aus JOHTO?"
	done
BikerReillyBeatenText:
	text "Boah, du legst"
	line "aber los!"
	done
GenericTrainerBikerJoel:
	generictrainer BIKER, JOEL, EVENT_BEAT_BIKER_JOEL, BikerJoelSeenText, BikerJoelBeatenText

	text "Ich sehe zwar cool"
	line "aus, bin aber"
	cont "schwach, also bin"
	cont "ich nicht wirklich"
	cont "cool."
	para "Ich muss härter"
	line "trainieren …"
	done
BikerJoelSeenText:
	text "Toll! Das ist ein"
	line "tolles FAHRRAD!"
	done
BikerJoelBeatenText:
	text "Aber du siehst"
	line "nicht nur cool"
	cont "aus…"
	done
GenericTrainerBikerGlenn:
	generictrainer BIKER, GLENN, EVENT_BEAT_BIKER_GLENN, BikerGlennSeenText, BikerGlennBeatenText

	; GSC-DE Dump
	text "Freihändig fahren"
	line "gilt als cool"
	cont "auf dem RADWEG."
	done
BikerGlennSeenText:
	text "Hey! Wie wäre es"
	line "mit einem"
	cont "Schnellkampf?"
	done
BikerGlennBeatenText:
	text "Ups! Du hast ganz"
	line "schön Kraft!"
	done
GenericTrainerBikerDale:
	generictrainer BIKER, DALE, EVENT_BEAT_BIKER_DALE, BikerDaleSeenText, BikerDaleBeatenText

	text "Du bist so cool!"
	line "Du machst nichts"
	cont "halbherzig!"
	done

BikerDaleSeenText:
	text "Du wirst"
	line "verlieren! Ich"
	cont "habe ein Gefühl!"
	done

BikerDaleBeatenText:
	text "Vielleicht lag"
	line "mein Gefühl"
	cont "falsch…"
	done

GenericTrainerBikerJacob:
	generictrainer BIKER, JACOB, EVENT_BEAT_BIKER_JACOB, BikerJacobSeenText, BikerJacobBeatenText

	text "Chopper? Ach, ich"
	line "meinte mein"
	cont "FAHRRAD!"
	done

BikerJacobSeenText:
	text "Mein FAHRRAD"
	line "aufzupimpen kostet"
	cont "viel Geld!"
	para "Ich brauche einen"
	line "Job!"
	done

BikerJacobBeatenText:
	text "Argh. Verloren!"
	done

GenericTrainerBikerAiden:
	generictrainer BIKER, AIDEN, EVENT_BEAT_BIKER_AIDEN, BikerAidenSeenText, BikerAidenBeatenText

	text "Gaon gaooon!"
	line "Buwaribaribari…!"

	para "Dort, meine"
	line "Motornachahmung"
	cont "hat sich"
	cont "weiterentwickelt!"
	done

BikerAidenSeenText:
	text "Brumm brumm!"
	line "Baribaribaribari!"

	para "Was hältst du von"
	line "meiner"
	cont "Motornachahmung?"
	done

BikerAidenBeatenText:
	text "Hnnff… hnnff… Ich"
	line "bin außer Atem…"
	done

GenericTrainerBikerDan:
	generictrainer BIKER, DAN, EVENT_BEAT_BIKER_DAN, BikerDanSeenText, BikerDanBeatenText

	text "Ich liebe diese"
	line "melancholische"
	cont "Melodie."

	para "Sie passt gut zu"
	line "mir…"
	done

BikerDanSeenText:
	text "Parara parapara"
	line "para-parara!"

	para "Meine Hupe hat"
	line "einen tollen"
	cont "Klang, findest du"
	cont "nicht?"
	done

BikerDanBeatenText:
	text "Paaraaraaaaa…"
	done

GenericTrainerBikerTeddy:
	generictrainer BIKER, TEDDY, EVENT_BEAT_BIKER_TEDDY, BikerTeddySeenText, BikerTeddyBeatenText

	text "Mir gefällt auch,"
	line "wie du kämpfst!"

	cont "Ich bin ein Fan"
	cont "von dir!"
	done

BikerTeddySeenText:
	text "Hey, cooles"
	line "FAHRRAD, das du"
	cont "fährst!"
	done

BikerTeddyBeatenText:
	text "Gute Arbeit."
	done

GenericTrainerRoughneckBrian:
	generictrainer ROUGHNECK, BRIAN, EVENT_BEAT_ROUGHNECK_BRIAN, RoughneckBrianSeenText, RoughneckBrianBeatenText

	text "Bis später! Komm"
	line "jederzeit wieder!"
	done

RoughneckBrianSeenText:
	text "Hey, wer hat dir"
	line "erlaubt, hier zu"
	cont "fahren?"
	done

RoughneckBrianBeatenText:
	text "Krach!"
	done

GenericTrainerRoughneckTheron:
	generictrainer ROUGHNECK, THERON, EVENT_BEAT_ROUGHNECK_THERON, RoughneckTheronSeenText, RoughneckTheronBeatenText

	text "Willst du meinem"
	line "Team beitreten?"
	para "Willst du es nicht"
	line "mal probieren?"
	done

RoughneckTheronSeenText:
	text "Ich mache dich"
	line "härter. Komm, geh"
	cont "mit mir."
	done

RoughneckTheronBeatenText:
	text "Verloren."
	line "Verloren!"
	done

GenericTrainerRoughneckMarkey:
	generictrainer ROUGHNECK, MARKEY, EVENT_BEAT_ROUGHNECK_MARKEY, RoughneckMarkeySeenText, RoughneckMarkeyBeatenText

	text "Gut so!"

	para "Der Kampfschrei"
	line "war toll!"
	done

RoughneckMarkeySeenText:
	text "Hey hey hey! Du"
	line "stehst im Weg!"

	para "IM WEG!"
	done

RoughneckMarkeyBeatenText:
	text "Gut, danke!"
	done

Route17SouthNotice1Text:
	text "Das ist ein"
	line "Hinweis."

	para "Vorsicht vor weg"
	line "geworfenen"
	cont "Gegenständen!"
	done

Route17SouthTrainerTips1Text:
	text "Trainer-Tipps"
	para "Alle #MON sind"
	line "einzigartig."
	para "Zwei #MON"
	line "derselben Art und"
	cont "Stufe können"
	para "anders aussehen,"
	line "sich verhalten und"
	cont "wachsen."
	done

Route17SouthTrainerTips2Text:
	text "Trainer-Tipps"
	para "Öffne das"
	line "START-Menü, um an"
	cont "einer Steigung"
	para "stehen zu bleiben."
	done

Route17SouthNotice2Text:
	text "Das ist ein"
	line "Hinweis."

	para "Wirf nicht das"
	line "Spiel, sondern"
	cont "#BÄLLE!"
	done
