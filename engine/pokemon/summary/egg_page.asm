SummaryScreen_Egg:
	ld a, SUMMARY_TILE_OAM_EGG_TITLE
	call SummaryScreen_UpdateTabTitle

	ld a, ' '
	hlcoord 11, 0
	ld [hl], a
	hlcoord 19, 0
	ld [hl], a

	ld a, 240
	ld hl, wSummaryScreenOAMSprite00YCoord
	ld [hl], a
	ld hl, wSummaryScreenOAMSprite01YCoord
	ld [hl], a
	ld hl, wSummaryScreenOAMSprite02YCoord
	ld [hl], a
	ld hl, wSummaryScreenOAMSprite03YCoord
	ld [hl], a

	ld de, .NoString
	hlbgcoord 0, 0, wSummaryScreenWindowBuffer
	rst PlaceString
	ld de, .EggString
	hlbgcoord 0, 1, wSummaryScreenWindowBuffer
	rst PlaceString
	ld de, .OTString
	hlbgcoord 0, 4, wSummaryScreenWindowBuffer
	rst PlaceString
	ld de, .IDString
	hlbgcoord 2, 5, wSummaryScreenWindowBuffer
	rst PlaceString

	ld a, [wTempMonHappiness] ; egg status
	ld de, .SoonString
	cp $6
	jr c, .picked
	ld de, .CloseString
	cp $b
	jr c, .picked
	ld de, .MoreTimeString
	cp $29
	jr c, .picked
	ld de, .ALotMoreTimeString
.picked
	hlcoord 1, 13
	rst PlaceString

	ld hl, .EggPalettes
	ld bc, 1 palettes
	ld de, wSummaryScreenPals palette SUMMARY_PAL_LOWER_WINDOW
	rst CopyBytes
	ld bc, 1 palettes
	ld de, wSummaryScreenPals palette SUMMARY_PAL_SIDE_WINDOW
	rst CopyBytes
	ld bc, 1 palettes
	ld de, wSummaryScreenPals palette SUMMARY_PAL_SHINY_POKERUS
	rst CopyBytes

	ld a, [wCurPartySpecies]
	push af
	ld a, EGG
	ld [wCurPartySpecies], a
	hlcoord 0, 1
	call PrepMonFrontpic
	call .AnimateEgg
	pop af
	ld [wCurPartySpecies], a

	ld a, [wTempMonHappiness]
	cp 6
	ret nc
	ld de, SFX_2_BOOPS
	jmp PlaySFX

.EggPalettes:
INCLUDE "gfx/stats/egg_page.pal"

.NoString:
	text "№.???"
	done

.EggString:
	text "Ei"
	done

.OTString:
	text "OT/?????"
	done

.IDString:
	text "<ID>№.?????"
	done

.SoonString:
	text "Es macht Geräusche."
	next "Es wird bald"
	next "schlüpfen!"
	done

.CloseString:
	text "Es bewegt sich"
	next "manchmal. Bald"
	next "schlüpft es."
	done

.MoreTimeString:
	text "Was wohl drin ist?"
	next "Es braucht aber"
	next "noch mehr Zeit."
	done

.ALotMoreTimeString:
	text "Dieses Ei braucht"
	next "noch viel Zeit zum"
	next "Schlüpfen."
	done

.AnimateEgg:
	call SummaryScreen_GetAnimationParam
	ret nc
	ld a, [wTempMonHappiness]
	ld e, $7
	cp 6
	jr c, .animate
	ld e, $8
	cp 11
	ret nc
.animate
	push de
	ld a, $1
	ld [wBoxAlignment], a
	call SummaryScreen_LoadTextboxSpaceGFX
	ld de, vTiles2 tile $00
	farcall PrepareAnimatedFrontpic
	pop de
	hlcoord 0, 1
	ld d, $0
	farcall LoadMonAnimation
	ld hl, wSummaryScreenFlags
	set SUMMARY_FLAGS_DO_ANIM_F, [hl]
	ret
