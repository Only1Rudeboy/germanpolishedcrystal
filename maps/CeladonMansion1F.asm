CeladonMansion1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6,  9, CELADON_CITY, 2
	warp_event  7,  9, CELADON_CITY, 2
	warp_event  3,  0, CELADON_CITY, 3
	warp_event  0,  0, CELADON_MANSION_2F, 1
	warp_event  7,  0, CELADON_MANSION_2F, 4

	def_coord_events

	def_bg_events
	bg_event  5,  8, BGEVENT_UP, CeladonMansionManagersSuiteSign
	bg_event  0,  3, BGEVENT_JUMPSTD, picturebookshelf
	bg_event  2,  3, BGEVENT_JUMPSTD, picturebookshelf

	def_object_events
	object_event  1,  5, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansionManagerScript, -1
	pokemon_event  2,  6, MEOWTH, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, CeladonMansion1FMeowthText, -1
	pokemon_event  3,  4, CLEFAIRY, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_PINK, CeladonMansion1FClefairyText, -1
	pokemon_event  4,  4, NIDORAN_F, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_TEAL, CeladonMansion1FNidoranFText, -1

CeladonMansionManagersSuiteSign:
	jumpthistext

	text "Prismania-Anlage"
	line "Verwalterbüro"
	done

CeladonMansionManagerScript:
	checkitem MINT_LEAF
	iffalse_jumptextfaceplayer .NoMintLeafText
	faceplayer
	opentext
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .AcceptedText
	promptbutton
	special Special_MintTeaPickMon
	iffalse_jumpopenedtext .RefusedText
	ifequalfwd $1, .Egg
	writetext .LikedFlavorText
	loadmenu .MenuDataHeader
	verticalmenu
	closewindow
	iffalse_jumpopenedtext .RefusedText
	writemem wMintTeaLikedFlavor
	writetext .DislikedFlavorText
	loadmenu .MenuDataHeader
	verticalmenu
	closewindow
	iffalse_jumpopenedtext .RefusedText
	writemem wMintTeaDislikedFlavor
	special Special_MintTeaChangeNature
	iffalsefwd .Neutral
	writetext .TeaIsReadyText
	sjumpfwd .Done
.Neutral
	writetext .NeutralTeaText
.Done
	waitbutton
	closetext
	takeitem MINT_LEAF
	readmem wCurPartySpecies
	pokepic 0
	cry 0
	waitsfx
	closepokepic
	opentext
	writetext .MonLooksDifferentText
	special PlayCurMonCry
	waitbutton
	jumpthisopenedtext

	text "Es geht nichts"
	line "über heißen"
	cont "Minztee."

	para "Er kann die"
	line "Wesensart eines"
	cont "#mon verändern!"
	done

.Egg:
	jumpthisopenedtext

	text "Erwartest du,"
	line "dass ich daraus"
	cont "ein Tee-Ei mache?"
	done

.NoMintLeafText:
	text "Oh, hallo,"
	line "Schätzchen."

	para "Ich trinke Tee mit"
	line "meinem lieben"
	cont "#mon."

	para "Hättest du ein"
	line "Minzblatt,"

	para "lüde ich dich"
	line "ein, mitzumachen."

	para "#mon lieben"
	line "Minze in ihrem"
	cont "Tee."

	para "Sie verändert"
	line "dauerhaft ihre"
	cont "Wesensart!"
	done

.QuestionText:
	text "Oh, hallo,"
	line "Schätzchen."

	para "Ich sehe, du hast"
	line "ein Minzblatt."

	para "Möchtest du, dass"
	line "ich es in Tee für"

	para "dein #mon"
	line "aufgieße?"
	done

.RefusedText:
	text "Füll dich bloß"
	line "nicht mit Limonade"
	cont "und Sprudel ab!"
	done

.AcceptedText:
	text "Welches deiner"
	line "#mon möchte"
	cont "Tee?"
	done

.LikedFlavorText:
	text "Was für einen"
	line "Geschmack mag "
	text_ram wStringBuffer1
	cont "wohl?"
	done

.DislikedFlavorText:
	text "Und welchen mag"
	line "es nicht?"
	done

.NeutralTeaText:
	text "Ein ungewöhn-"
	line "licher Wunsch,"
	cont "aber ich brau ihn!"

	para "Eine Tasse für"
	line "dich, eine für"
	cont ""
	text_ram wStringBuffer1
	text "!"
	done

.TeaIsReadyText:
	text "Okay! Hier ist"
	line "dein Tee."

	para "Eine Tasse für"
	line "dich, eine für"
	cont ""
	text_ram wStringBuffer1
	text "!"
	done

.MonLooksDifferentText:
	text_ram wStringBuffer1
	text " sieht"
	line "irgendwie anders"
	cont "aus!"
	done

.MenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 0, 9, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 5 ; items
	; this order is meaningful to calculate the new nature
	db "Scharf@" ; atk
	db "Sauer@" ; def
	db "Süß@" ; spe
	db "Herb@" ; sat
	db "Bitter@" ; sdf

CeladonMansion1FMeowthText:
	text "Mauzi: Miau!"
	done

CeladonMansion1FClefairyText:
	text "Piepi: Pip"
	line "piep!"
	done

CeladonMansion1FNidoranFText:
	text "Nidoran: Kya"
	line "kyaoo!"
	done
