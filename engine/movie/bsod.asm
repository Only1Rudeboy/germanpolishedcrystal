BSOD:
	ldh a, [hCGB]
	and a
	ret nz

	ld e, MUSIC_NONE
	call PlayMusic

	call ClearTileMap

	ldh a, [rWBK]
	push af
	ld a, 5
	ldh [rWBK], a
	ld hl, BSODPalette
	ld de, wBGPals2
	ld bc, 1 palettes
	rst CopyBytes
	pop af
	ldh [rWBK], a

	ld a, 1
	ldh [hCGBPalUpdate], a

	xor a
	ldh [hBGMapHalf], a
	call DelayFrame

	ld de, FontNormal
	ld hl, vTiles1
	lb bc, BANK(FontNormal), 111
	call Get1bpp

	ld de, BSODMessage
	call CheckVBA
	jr z, .message
	ld de, VBABSODMessage
.message
	hlcoord 1, 1
	rst PlaceString

	ldh a, [hCrashCode]
	call PrintNum_NoHRAM

	cp NUM_ERR_CODES
	jr c, .valid
	ld a, NUM_ERR_CODES
.valid
	ld e, a
	ld d, 0
	ld hl, BSODErrorStrings
	add hl, de
	ld e, [hl]
	add hl, de
	ld e, l
	ld d, h
	hlcoord 1, 14
	rst PlaceString

	call ApplyTilemapInVBlank

.infinite_loop
	call DelayFrame
	jr .infinite_loop

PrintNum_NoHRAM:
; reimplementation of PrintNum without touching hram
	ld b, 100
	hlcoord 8, 12
	push af
	call .print_digit
	ld b, 10
	call .print_digit
	add '0'
	ld [hl], a
	pop af
	ret

.print_digit:
	ld [hl], '0' - 1
.loop
	inc [hl]
	sub b
	jr nc, .loop
	add b
	inc hl
	ret

BSODPalette:
INCLUDE "gfx/splash/bsod.pal"

BSODMessage:
	text "      #mon"
	next1 " Polished Crystal"
	next  "       FEHLER"
	next1 "------------------"
	next  "Bitte melde"
	next1 "diesen Absturz an"
	next1 "Rangi42, Dev, bei:"
	next1 "tinyurl.com/pkpc3."
	next  "Fehler:"
	done

VBABSODMessage:
	text "      #mon"
	next1 " Polished Crystal"
	next  "       FEHLER"
	next1 "------------------"
	next  "Bitte nutze"
	next1 "genaueren Emulator"
	next1 "BGB, mGBA oder"
	next1 "Gambatte."
	next  "Fehler:"
	done

BSODErrorStrings:
	table_width 1
	dr .Rst0             ; ERR_RST_0
	dr .Rst38            ; ERR_RST_38
	dr .DivZero          ; ERR_DIV_ZERO
	dr .EggSpecies       ; ERR_EGG_SPECIES
	dr .ExecutingRAM     ; ERR_EXECUTING_RAM
	dr .StackOverflow    ; ERR_STACK_OVERFLOW
	dr .StackUnderflow   ; ERR_STACK_UNDERFLOW
	dr .OldBTState       ; ERR_BT_STATE
	dr .ChecksumMismatch ; ERR_CHECKSUM_MISMATCH
	dr .PCBoxOld         ; ERR_PC_BOX_OLD
	dr .PCBoxZero        ; ERR_PC_BOX_ZERO
	dr .PCBoxCollision   ; ERR_PC_BOX_COLLISION
	dr .WindowOverflow   ; ERR_WINDOW_OVERFLOW
	dr .WindowUnderflow  ; ERR_WINDOW_UNDERFLOW
	dr .SRAMMismatch     ; ERR_SRAM_MISMATCH
	dr .PEBKAC           ; ERR_PEBKAC
	dr .UnknownError     ; unknown
	assert_table_length NUM_ERR_CODES + 1

.Rst0:             text "rst 00h@"
.Rst38:            text "rst 38h@"
.DivZero:          text "Division durch 0@"
.EggSpecies:       text "<PK><MN>-Art ist Ei@"
.ExecutingRAM:     text "RAM ausgeführt@"
.StackOverflow:    text "Stack-Überlauf@"
.StackUnderflow:   text "Stack-Unterlauf@"
.OldBTState:       text "Alter Kampfturm@"
.ChecksumMismatch: text "Prüfsummenfehler@"
.PCBoxOld:         text "Alte PC-Box@"
.PCBoxZero:        text "PC-Box 0 genutzt@"
.PCBoxCollision:   text "PC-Box-Kollision@"
.WindowOverflow:   text "Fenster-Überlauf@"
.WindowUnderflow:  text "Fenster-Unterlauf@"
.SRAMMismatch:     text "SRAM/WRAM-Fehler@"
.PEBKAC:           text "PEBKAC@"
.UnknownError:     text "Unbekannt@"
