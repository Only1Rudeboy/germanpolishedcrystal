Route8_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 10, ROUTE_8_SAFFRON_GATE, 3
	warp_event  4, 11, ROUTE_8_SAFFRON_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 11,  9, BGEVENT_JUMPTEXT, Route8UndergroundPathSignText
	bg_event 10,  7, BGEVENT_JUMPTEXT, Route8LockedDoorText

	def_object_events
	object_event 10, 10, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerBikerDwayne, EVENT_ROUTE_8_KANTO_POKEMON_FEDERATION
	object_event 10, 11, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerBikerHarris, EVENT_ROUTE_8_KANTO_POKEMON_FEDERATION
	object_event 10, 12, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_DARK_BLUE, OBJECTTYPE_TRAINER, 5, TrainerBikerZeke, EVENT_ROUTE_8_KANTO_POKEMON_FEDERATION
	object_event 17,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSupernerdSam, -1
	object_event 32,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSupernerdTom, -1
	object_event 43, 14, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGentlemanMilton, -1
	object_event 23,  4, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleMoeandlulu1, -1
	object_event 24,  4, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleMoeandlulu2, -1
	object_event 29,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerLassMeadow, -1
	cuttree_event 21, 14, EVENT_ROUTE_8_CUT_TREE_1
	cuttree_event 32, 12, EVENT_ROUTE_8_CUT_TREE_2
	fruittree_event 45,  7, FRUITTREE_ROUTE_8, SALAC_BERRY, PAL_NPC_GREEN
	object_event  6,  9, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route8BikerDwayneProtestText, EVENT_ROUTE_8_PROTESTORS
	object_event  7, 10, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route8BikerHarrisProtestText, EVENT_ROUTE_8_PROTESTORS
	object_event  6, 11, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_DARK_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route8BikerZekeProtestText, EVENT_ROUTE_8_PROTESTORS

TrainerBikerDwayne:
	trainer BIKER, DWAYNE, EVENT_BEAT_BIKER_DWAYNE, BikerDwayneSeenText, BikerDwayneBeatenText, 0, .Script, TRAINERPAL_BIKER_DWAYNE

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Die #mon-"
	line "TRAINERGILDE aus"
	cont "KANTO wird"
	cont "immer existieren!"
	done
TrainerBikerHarris:
	trainer BIKER, HARRIS, EVENT_BEAT_BIKER_HARRIS, BikerHarrisSeenText, BikerHarrisBeatenText, 0, .Script, TRAINERPAL_BIKER_HARRIS

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Vermöbelt von"
	line "einem Rowdy aus"
	cont "JOHTO…"
	done
TrainerBikerZeke:
	trainer BIKER, ZEKE, EVENT_BEAT_BIKER_ZEKE, BikerZekeSeenText, BikerZekeBeatenText, 0, .Script, TRAINERPAL_BIKER_ZEKE

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Wir versuchen,"
	line "ab jetzt"
	cont "niemanden"
	cont "mehr zu stören…"
	done
GenericTrainerSupernerdSam:
	generictrainer SUPER_NERD, SAM, EVENT_BEAT_SUPER_NERD_SAM, SupernerdSamSeenText, SupernerdSamBeatenText

	text "Die Kraft von"
	line "Magneten ist"
	cont "beeindruckend!"
	done
GenericTrainerSupernerdTom:
	generictrainer SUPER_NERD, TOM, EVENT_BEAT_SUPER_NERD_TOM, SupernerdTomSeenText, SupernerdTomBeatenText

	text "ORDEN sind der"
	line "Beweis deiner"
	cont "Stärke im Kampf."
	done

GenericTrainerGentlemanMilton:
	generictrainer GENTLEMAN, MILTON, EVENT_BEAT_GENTLEMAN_MILTON, GentlemanMiltonSeenText, GentlemanMiltonBeatenText

	text "Auf der Straße"
	line "für"
	line "einen Kampf"
	cont "anzuhalten ist"
	cont "nicht unhöflich."

	para "Egal was"
	line "passiert,"
	line "ich bin vor allem"
	cont "ein Gentleman!"
	done

GenericTrainerCoupleMoeandlulu1:
	generictrainer COUPLE, MOEANDLULU1, EVENT_BEAT_COUPLE_MOE_AND_LULU, CoupleMoeandlulu1SeenText, CoupleMoeandlulu1BeatenText

	text "Moe: Kurz gesagt,"
	line "du bist einfach"
	cont "zu stark…"
	done

GenericTrainerCoupleMoeandlulu2:
	generictrainer COUPLE, MOEANDLULU2, EVENT_BEAT_COUPLE_MOE_AND_LULU, CoupleMoeandlulu2SeenText, CoupleMoeandlulu2BeatenText

	text "Lulu: Nicht dass"
	line "Moe schwach"
	line "wäre, du bist"

	para "einfach zu"
	line "stark!"
	done

GenericTrainerLassMeadow:
	generictrainer LASS, MEADOW, EVENT_BEAT_LASS_MEADOW, LassMeadowSeenText, LassMeadowBeatenText

	text "Na ja, mir ist"
	line "Spaß wichtiger"
	cont "als"
	cont "Wettbewerb."
	done

Route8BikerDwayneProtestText:
	text "Wir sind die"
	line "#mon-TRAINER-"
	cont "GILDE aus KANTO."

	para "Wir protestieren!"
	done

Route8BikerZekeProtestText:
	text "Wir sind die"
	line "#mon-TRAINER-"
	cont "GILDE aus KANTO!"

	para "Die Polizei kann"
	line "uns nicht vom"

	para "TUNNELPFAD"
	line "abhalten!"
	done

BikerDwayneSeenText:
	text "Wir"
	line "repräsentieren"
	line "die #mon-"
	cont "TRAINERGILDE aus"
	cont "KANTO."

	para "Hier kommst du"
	line "unter die Räder!"
	done





BikerDwayneBeatenText:
	text "En-entschuldigu-"
	line "ng!"
	done





Route8BikerHarrisProtestText:
BikerHarrisSeenText:
	text "Das ORDNUNGSAMT"
	line "hat unseren"

	para "TUNNELPFAD zu-"
	line "schütten lassen."
	cont "Das ängstigt"
	cont "mich!"
	done





BikerHarrisBeatenText:
	text "V-vergib mir!"
	done





BikerZekeSeenText:
	text "Wir sind die"
	line "#mon-TRAINER-"
	cont "GILDE aus KANTO!"
	cont "Nimm dich in"
	cont "Acht!"
	done





BikerZekeBeatenText:
	text "Uah!"
	line "Entschuldige!"
	done





SupernerdSamSeenText:
	text "Wie funktioniert"
	line "der MAGNETZUG?"
	done





SupernerdSamBeatenText:
	text "Ich möchte nur"
	line "den"
	line "MAGNETZUG sehen…"
	done





SupernerdTomSeenText:
	text "Hm… Du hast"
	line "viele ORDEN."
	done





SupernerdTomBeatenText:
	text "Wie ich dachte…"
	line "Du bist stark!"
	done





GentlemanMiltonSeenText:
	text "Möchtest du mit"
	line "mir"
	line "einen schnellen"
	cont "Wettkampf?"
	done

GentlemanMiltonBeatenText:
	text "Du warst sehr"
	line "geschickt."
	done

CoupleMoeandlulu1SeenText:
	text "Moe: Sehe ich"
	line "schwach aus? Lach"
	cont "mich nicht aus!"

	para "Wenn ich bei Lulu"
	line "bin, hab ich"
	line "hundertmal mehr"
	cont "Mut!"
	done

CoupleMoeandlulu1BeatenText:
	text "Moe: Uwaaaahhh…"
	done

CoupleMoeandlulu2SeenText:
	text "Lulu: Moe und ich"
	line "sind ein tolles"
	cont "Paar!"

	para "Mach dich besser"
	line "bereit!"
	done

CoupleMoeandlulu2BeatenText:
	text "Lulu: Eeek!"
	done

LassMeadowSeenText:
	text "Ich mag Röcke!"
	line "Sie sind süß und"
	cont "bequem!"
	done

LassMeadowBeatenText:
	text "Ach du meine!"
	done

Route8LockedDoorText:
	text "Es ist"
	line "verriegelt…"
	done





Route8UndergroundPathSignText:
	text "Das Flugblatt ist"
	line "zerrissen."

	para "Es ist nicht mehr"
	line "lesbar…"
	done





