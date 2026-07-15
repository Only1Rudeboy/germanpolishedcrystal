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

	text "Toll! Das ist ja"
	line "riesig!"

	para "…Zumindest würde"
	line "ich das gerne"
	cont "sagen, aber ich"
	cont "habe"

	para "schon größere"
	line "gesehen."
	done
.Refused:
	jumpthisopenedtext

	text "Oh … Du hast also"
	line "keines, das es"
	para "wert wäre, mir zu"
	line "zeigen? Vielleicht"
	cont "beim nächsten Mal."
	done
MagikarpLengthRaterText_LakeOfRageHistory:
	text "Der SEE DES ZORNS"
	line "ist eigentlich ein"
	para "Krater, der durch"
	line "wütende GARADOS"
	cont "erschaffen wurde."
	para "Der Krater füllte"
	line "sich mit"
	cont "Regenwas-ser und"
	cont "so entstand der"
	cont "See."
	para "Diese Geschichte"
	line "erzählte schon"
	para "der Ur-Urgroßvater"
	line "meines Großvaters."
	para "Früher konnte man"
	line "hier"
	cont "quicklebendige"
	cont "KARPADOR fangen,"
	cont "aber …"
	para "Ich verstehe"
	line "nicht, was hier"
	cont "geschieht."
	done



MagikarpLengthRaterText_MenInBlack:
	text "Der SEE hat sich"
	line "verändert, seit"
	para "diese Männer in"
	line "Schwarz hier sind."
	done



MagikarpLengthRaterText_WorldsLargestMagikarp:
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
	text "Ah, du hast ein"
	line "KARPADOR! Lass uns"
	para "sehen, wie groß"
	line "das Kleine ist."
	done



MagikarpLengthRaterText_Memento:
	text "Toll! Das ist ja"
	line "riesig!"
	para "Ich ziehe meinen"
	line "Hut vor dir!"
	para "Nimm das als"
	line "Andenken!"
	done



MagikarpLengthRaterText_Bonus:
	text "Wichtig ist nur"
	line "die Erinnerung."

	para "Sieh es als eine"
	line "Art Bonus!"
	done



MagikarpLengthRaterText_NotMagikarp:
	text "Was? Das ist kein"
	line "KARPADOR!"
	done



