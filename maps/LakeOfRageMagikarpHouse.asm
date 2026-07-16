LakeOfRageMagikarpHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, LAKE_OF_RAGE, 2
	warp_event  3,  7, LAKE_OF_RAGE, 2

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MagikarpLengthRaterScript, -1

MagikarpLengthRaterScript:
	faceplayer
	opentext
	checkevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	iftruefwd .GetReward
	checkevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	iftruefwd .AskedForMagikarp
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftruefwd .ClearedRocketHideout
	checkevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	iftrue_jumpopenedtext MagikarpLengthRaterText_MenInBlack
	writetext MagikarpLengthRaterText_LakeOfRageHistory
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	end

.ClearedRocketHideout:
	writetext MagikarpLengthRaterText_WorldsLargestMagikarp
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	end

.AskedForMagikarp:
	setmonval MAGIKARP
	special Special_FindThatSpecies
	iffalse .ClearedRocketHideout
	writetext MagikarpLengthRaterText_YouHaveAMagikarp
	waitbutton
	special CheckMagikarpLength
	iffalse_jumpopenedtext MagikarpLengthRaterText_NotMagikarp
	ifequalfwd $1, .Refused
	ifequalfwd $2, .TooShort
.GetReward:
	writetext MagikarpLengthRaterText_Memento
	promptbutton
	verbosegiveitem ELIXIR
	iffalsefwd .NoRoom
	writetext MagikarpLengthRaterText_Bonus
	waitbutton
	closetext
	clearevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.NoRoom:
	closetext
	setevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.TooShort:
	jumpthisopenedtext

	; GSC-DE Dump
	text "Wow! Das ist ja"
	line "riesig!"
	para "…Zumindest würde"
	line "ich das gerne sa-"
	cont "gen, aber ich habe"
	para "schon größere ge-"
	line "sehen."
	done
.Refused:
	jumpthisopenedtext

	; GSC-DE Dump
	text "Oh… Du hast also"
	line "keines, das es"
	para "wert wäre, mir zu"
	line "zeigen? Vielleicht"
	cont "beim nächsten Mal."
	done
MagikarpLengthRaterText_LakeOfRageHistory:
	; GSC-DE Dump
	text "Der SEE DES ZORNS"
	line "ist eigentlich ein"
	para "Krater, der durch"
	line "wütende GARADOS"
	cont "erschaffen wurde."
	para "Der Krater füllte"
	line "sich mit Regenwas-"
	cont "ser und so ent-"
	cont "stand der See."
	para "Diese Geschichte"
	line "erzählte schon"
	para "der Ur-Urgroßvater"
	line "meines Großvaters."
	para "Früher konnte man"
	line "hier quicklebendi-"
	cont "ge KARPADOR fan-"
	cont "gen, aber…"
	para "Ich verstehe"
	line "nicht, was hier"
	cont "geschieht."
	done

MagikarpLengthRaterText_MenInBlack:
	; GSC-DE Dump
	text "Der SEE hat sich"
	line "verändert, seit"
	para "diese Männer in"
	line "Schwarz hier sind."
	done

MagikarpLengthRaterText_WorldsLargestMagikarp:
	; GSC-DE Dump
	text "Der SEE DES ZORNS"
	line "ist wieder normal."
	para "Die KARPADOR sind"
	line "wieder zurück."
	para "Vielleicht geht"
	line "nun mein Traum in"
	cont "Erfüllung, das"
	cont "größte KARPADOR"
	cont "der Welt zu sehen!"
	para "Hast du eine"
	line "ANGEL? Wenn ja,"
	cont "dann hilf mir"
	cont "bitte!"
	done

MagikarpLengthRaterText_YouHaveAMagikarp:
	; GSC-DE Dump
	text "Ah, du hast ein"
	line "KARPADOR! Lass uns"
	para "sehen, wie groß"
	line "das Kleine ist."
	done

MagikarpLengthRaterText_Memento:
	; GSC-DE Dump
	text "Wow! Das ist ja"
	line "riesig!"
	para "Ich ziehe meinen"
	line "Hut vor dir!"
	para "Nimm das als An-"
	line "denken!"
	done

MagikarpLengthRaterText_Bonus:
	; GSC-DE Dump
	text "Wichtig ist nur"
	line "die Erinnerung."
	para "Sieh es als eine"
	line "Art Bonus!"
	done

MagikarpLengthRaterText_NotMagikarp:
	; GSC-DE Dump
	text "Was? Das ist kein"
	line "KARPADOR!"
	done



