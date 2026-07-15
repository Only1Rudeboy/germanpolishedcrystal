RockyBeach_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 25, 20, ROCKY_BEACH_HOUSE, 1
	warp_event 29, 10, NOISY_FOREST, 1
	warp_event 29, 11, NOISY_FOREST, 2

	def_coord_events

	def_bg_events
	bg_event 22, 24, BGEVENT_JUMPTEXT, RockyBeachSign1Text
	bg_event 24, 10, BGEVENT_JUMPTEXT, RockyBeachSign2Text

	def_object_events
	object_event 21, 21, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSightseermBlaise, -1
	object_event 11, 22, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBeautyIoana, -1
	object_event  2, 21, SPRITE_LADY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSightseerfKamila, -1
	object_event 15, 18, SPRITE_AROMA_LADY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerAromaLadyHeather, -1
	object_event 15, 13, SPRITE_BREEDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBreederBrenda, -1
	object_event 14,  7, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSwimmermEzra, -1
	object_event 23, 10, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 1, RockyBeachWilhomenaScript, EVENT_NOISY_FOREST_PIKABLU
	itemball_event 21,  5, FULL_HEAL, 1, EVENT_ROCKY_BEACH_FULL_HEAL
	itemball_event 32,  3, PEARL_STRING, 1, EVENT_ROCKY_BEACH_PEARL_STRING
	object_event 20, 32, SPRITE_FAT_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, (1 << DAY), PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, ShamoutiIslandFisherText, -1
	object_event 23, 32, SPRITE_FAT_GUY, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, (1 << DAY), PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, ShamoutiIslandFisherText, -1

RockyBeachSign1Text:
	text "Felsstrand"
	done

RockyBeachSign2Text:
	text "Lauter Wald voraus"
	para "Weg zu den"
	line "Schreinruinen"
	done

GenericTrainerSightseermBlaise:
	generictrainer SIGHTSEERM, BLAISE, EVENT_BEAT_SIGHTSEERM_BLAISE, .SeenText, .BeatenText

	text "Je fais le tour du"
	line "monde avec mon"
	cont "#mon."
	done

.SeenText:
	text "Allons-y!"
	done

.BeatenText:
	text "Sacre bleu!"
	done

GenericTrainerBeautyIoana:
	generictrainer BEAUTY, IOANA, EVENT_BEAT_BEAUTY_IOANA, .SeenText, .BeatenText

	text "Ich habe von Natur"
	line "aus eine blasse"
	cont "Haut,"
	para "deshalb muss ich"
	line "in der Sonne"
	cont "vorsichtig sein."
	done

.SeenText:
	text "Ich komme jedes"
	line "Jahr hierher, um"
	cont "braun zu werden."
	done

.BeatenText:
	text "Ich habe mich"
	line "verbrannt!"
	done

GenericTrainerSightseerfKamila:
	generictrainer SIGHTSEERF, KAMILA, EVENT_BEAT_SIGHTSEERF_KAMILA, .SeenText, .BeatenText

	text "Alola ist ein"
	line "Archipel weit von"
	cont "hier entfernt."
	para "Du solltest es mal"
	line "besuchen!"
	done

.SeenText:
	text "Alola!"

	para "So grüßen wir uns"
	line "in meiner"
	cont "Heimatregion."
	done

.BeatenText:
	text "Cheehoo! Du bist"
	line "ziemlich gut!"
	done

GenericTrainerAromaLadyHeather:
	generictrainer AROMA_LADY, HEATHER, EVENT_BEAT_AROMA_LADY_HEATHER, .SeenText, .BeatenText

	text "Ich studierte"
	line "Blumenarrangement"
	cont "bei ERIKA"
	para "an der Universität"
	line "von PRISMANIA."
	para "Sie lobte diese"
	line "Insel wegen ihrer"
	cont "einheimischen"
	cont "Flora."
	done

.SeenText:
	text "Eine tiefrote"
	line "Blume wächst"
	cont "überall auf dieser"
	cont "Insel."
	para "Hast du es"
	line "bemerkt?"
	done

.BeatenText:
	text "Ein schöner Kampf,"
	line "aber was ist mit"
	cont "den Blumen?"
	done

GenericTrainerBreederBrenda:
	generictrainer BREEDER, BRENDA, EVENT_BEAT_BREEDER_BRENDA, .SeenText, .BeatenText

	text "Um ein Ei"
	line "schlüpfen zu"
	cont "lassen, muss man"

	para "viel laufen."

	para "Wo besser als auf"
	line "sonniger"
	cont "Shamouti-Insel?"
	done

.SeenText:
	text "Der Schlüssel zur"
	line "guten"
	cont "#mon-Zucht"
	para "ist eine gute"
	line "Umgebung."
	para "Besser als hier"
	line "gibt es keinen"
	cont "Ort!"
	done

.BeatenText:
	text "Deine #mon sind"
	line "gut gezüchtet."
	done

GenericTrainerSwimmermEzra:
	generictrainer SWIMMERM, EZRA, EVENT_BEAT_SWIMMERM_EZRA, .SeenText, .BeatenText

	text "Ich tauche hier"
	line "gerne."
	para "Es ist toll, unter"
	line "Wasser atmen zu"
	cont "können!"
	done

.SeenText:
	text "Hast du dich je"
	line "gefragt, wie es"
	cont "ist, unter"

	para "Wasser zu atmen?"
	done

.BeatenText:
	text "Mir ging die Luft"
	line "aus!"
	done

RockyBeachWilhomenaScript:
	generictrainer 0, 0, EVENT_TOLD_ABOUT_PIKABLU, .Text1, 0

.Text1
	text "Ach nein. Ach nein"
	line "…"
	para "Mein armes Pikablu"
	line "ist verschwunden."
	para "Nein … Es kann"
	line "nicht in den"
	cont "Lauten Wald"
	cont "gelaufen sein."
	para "Ich finde es nie"
	line "in den Bäumen …"
	para "Ach, was soll ich"
	line "nur tun …?"
	done
