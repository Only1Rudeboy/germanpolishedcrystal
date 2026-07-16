DanceTheatre_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5, 15, ECRUTEAK_CITY, 8
	warp_event  6, 15, ECRUTEAK_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  5,  6, BGEVENT_UP, MapDanceTheatreSignpost1Script
	bg_event  6,  6, BGEVENT_UP, MapDanceTheatreSignpost1Script

	def_object_events
	object_event  0,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerKimono_girlNaoko, -1
	object_event  2,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 0, GenericTrainerKimono_girlSayo, -1
	object_event  6,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLACK, OBJECTTYPE_TRAINER, 0, GenericTrainerKimono_girlZuki, -1
	object_event  9,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, GenericTrainerKimono_girlKuni, -1
	object_event 11,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, PAL_NPC_YELLOW, OBJECTTYPE_TRAINER, 0, GenericTrainerKimono_girlMiki, -1
	object_event  7, 12, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheaterSurfGuy, -1
	pokemon_event  6, 10, RHYDON, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, RhydonText, -1
	object_event 10, 12, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, DanceTheatreCooltrainerMText, -1
	object_event  3,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, DanceTheatreGrannyText, -1
	object_event  1, 10, SPRITE_LADY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, DanceTheatreLadyText, -1

GenericTrainerKimono_girlNaoko:
	assert!DEF(TRAINERPAL_NAOKO) ; the default TRAINERPAL_KIMONO_GIRL is hers
	generictrainer KIMONO_GIRL, NAOKO, EVENT_BEAT_KIMONO_GIRL_NAOKO, Kimono_girlNaokoSeenText, Kimono_girlNaokoBeatenText

	; GSC-DE Dump
	text "Das war ein toller"
	line "Kampf. Ich würde"
	cont "dich gerne mal"
	cont "wieder sehen."
	done

GenericTrainerKimono_girlSayo:
	trainer KIMONO_GIRL, SAYO, EVENT_BEAT_KIMONO_GIRL_SAYO, Kimono_girlSayoSeenText, Kimono_girlSayoBeatenText, 0, .Script, TRAINERPAL_SAYO

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "Rhythmus ist nicht"
	line "nur zum Tanzen,"
	para "sondern auch für"
	line "#MON wichtig."
	done

GenericTrainerKimono_girlZuki:
	trainer KIMONO_GIRL, ZUKI, EVENT_BEAT_KIMONO_GIRL_ZUKI, Kimono_girlZukiSeenText, Kimono_girlZukiBeatenText, 0, .Script, TRAINERPAL_ZUKI

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "Jeden Monat stecke"
	line "ich mir eine ande-"
	cont "re Blume in die"
	cont "Spange."
	done

GenericTrainerKimono_girlKuni:
	trainer KIMONO_GIRL, KUNI, EVENT_BEAT_KIMONO_GIRL_KUNI, Kimono_girlKuniSeenText, Kimono_girlKuniBeatenText, 0, .Script, TRAINERPAL_KUNI

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "Ich habe viel"
	line "trainiert. Also"
	para "dachte ich, ich"
	line "wäre gut. Aber ich"
	cont "bin es wohl nicht."
	done

GenericTrainerKimono_girlMiki:
	trainer KIMONO_GIRL, MIKI, EVENT_BEAT_KIMONO_GIRL_MIKI, Kimono_girlMikiSeenText, Kimono_girlMikiBeatenText, 0, .Script, TRAINERPAL_MIKI

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "Ich werde nicht"
	line "aufhören zu tan-"
	cont "zen, solange es"
	cont "Leute gibt, denen"
	para "ich dadurch Freude"
	line "bereite."
	para "Auch meine #MON"
	line "unterstützen mich"
	cont "dabei."
	done

DanceTheaterSurfGuy:
	faceplayer
	opentext
	writetext SurfGuyNeverLeftAScratchText
	promptbutton
	checkevent EVENT_GOT_HM03_SURF
	iftrue_jumpopenedtext SurfGuyElegantKimonoGirlsText
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalsefwd .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalsefwd .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalsefwd .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalsefwd .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalsefwd .KimonoGirlsUndefeated
	writetext SurfGuyLikeADanceText
	promptbutton
	verbosegivetmhm HM_SURF
	setevent EVENT_GOT_HM03_SURF
	jumpthisopenedtext

	; GSC-DE Dump
	text "Das ist SURFER."
	para "Damit können #-"
	line "MON jedes Gewässer"
	cont "überqueren."
	done

.KimonoGirlsUndefeated:
	readvar VAR_PLAYERGENDER
	ifequalfwd PLAYER_FEMALE, .Girl
	jumpthisopenedtext

	; GSC-DE Dump
	text "Junge! Wenn du"
	line "alle KIMONO-GIRLS"
	para "besiegst, gebe ich"
	line "dir ein Geschenk."
	done

.Girl:
	jumpthisopenedtext

	; GSC-DE Dump
	text "Kleine! Wenn du"
	line "alle KIMONO-GIRLS"
	para "besiegst, gebe ich"
	line "dir ein Geschenk."
	done

MapDanceTheatreSignpost1Script:
	jumpthistext

	; GSC-DE Dump
	text "Eine hübsche, mit"
	line "Blumen dekorierte"
	cont "Tafel."
	done

Kimono_girlNaokoSeenText:
	; GSC-DE Dump
	text "Du hast hübsche"
	line "#MON. Darf ich"
	cont "sehen, wie sie"
	cont "kämpfen?"
	done

Kimono_girlNaokoBeatenText:
	; GSC-DE Dump
	text "Oh, du bist sehr"
	line "stark."
	done

Kimono_girlSayoSeenText:
	; GSC-DE Dump
	text "Ich tanze immer"
	line "mit meinen #-"
	cont "MON. Natürlich"
	para "trainiere ich sie"
	line "auch."
	done

Kimono_girlSayoBeatenText:
	; GSC-DE Dump
	text "Oh, beinahe!"
	line "Fast hätte ich"
	cont "dich gehabt."
	done

Kimono_girlZukiSeenText:
	; GSC-DE Dump
	text "Ist meine Haar-"
	line "spange nicht"
	cont "hübsch?"
	para "Oh, ein #MON-"
	line "Kampf?"
	done

Kimono_girlZukiBeatenText:
	; GSC-DE Dump
	text "Ich habe keine"
	line "#MON mehr"
	cont "übrig…"
	done

Kimono_girlKuniSeenText:
	; GSC-DE Dump
	text "Oh, du scheinst"
	line "nett zu sein."
	cont "Willst du kämpfen?"
	done

Kimono_girlKuniBeatenText:
	; GSC-DE Dump
	text "Du bist stärker"
	line "als du aussiehst."
	done

Kimono_girlMikiSeenText:
	; GSC-DE Dump
	text "Gefällt dir mein"
	line "Tanz? Ich kenne"
	cont "mich auch gut mit"
	cont "#MON aus."
	done

Kimono_girlMikiBeatenText:
	; GSC-DE Dump
	text "Ooh, du kennst"
	line "dich auch gut mit"
	cont "#MON aus."
	done

SurfGuyNeverLeftAScratchText:
	; GSC-DE Dump
	text "Die KIMONO-GIRLS"
	line "sind nicht nur"
	para "großartige Tänzer,"
	line "sie sind auch gute"
	cont "#MON-Trainer."
	para "Ich fordere sie"
	line "ständig heraus,"
	para "konnte sie aber"
	line "noch nie besiegen…"
	done

SurfGuyLikeADanceText:
	; GSC-DE Dump
	text "Die Art wie du"
	line "kämpfst, ist wie"
	cont "ein Tanz."
	para "So etwas sieht man"
	line "nicht oft!"
	para "Ich möchte dir et-"
	line "was geben. Nur zu!"
	cont "Nimm es ruhig!"
	done

SurfGuyElegantKimonoGirlsText:
	; GSC-DE Dump
	text "Ich wünschte, mei-"
	line "ne #MON wären"
	cont "so elegant wie die"
	cont "KIMONO-GIRLS…"
	done

RhydonText:
	; GSC-DE Dump
	text "RIZEROS: Gugooh"
	line "gugogooh!"
	done

DanceTheatreCooltrainerMText:
	; GSC-DE Dump
	text "Dieser Mann hat"
	line "immer sein RIZEROS"
	cont "dabei."
	para "Er sagt, dass er"
	line "ein #MON haben"
	cont "will, das SURFEN"
	cont "und tanzen kann."
	para "Versucht er etwa,"
	line "ein Mono-Synchron-"
	cont "Schwimm-#MON zu"
	cont "besitzen?"
	done

DanceTheatreGrannyText:
	; GSC-DE Dump
	text "Die KIMONO-GIRLS"
	line "sind so hübsch…"
	para "Aber sie müssen"
	line "hart trainieren."
	para "Und sie müssen"
	line "so viele Dinge"
	para "lernen, bevor sie"
	line "öffentlich auftre-"
	cont "ten."
	para "Aber wenn du etwas"
	line "liebst, ist alles"
	cont "möglich."
	done

DanceTheatreLadyText:
	; PC-only (neue Evoli-Formen)
	text "EVOLI kann sich zu"
	line "FOLIPURBA,"
	para "GLAZIOLA oder"
	line "FEELINARA ent-"
	cont "wickeln,"
	para "aber ich sehe"
	line "keines von ihnen"
	para "hier. Ob die"
	line "KIMONO-GIRLS, die"
	para "sie nutzen, wohl"
	line "woanders sind?"
	done
