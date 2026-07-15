BadEggRLE:
	db UNOWN, 1 ; $c6
	db $00, 1
	db HIDDEN_POWER, 1 ; $ed
	db $00, 17
	db ABILITY_1 | QUIRKY, 1 ; $38
	db MALE | IS_EGG_MASK | UNOWN_QUESTION_FORM, 1 ; $68
	db $00, 9
	db EGG_LEVEL, 1 ; $01
	db $00, 16
	; Canon DE in-game: "Schl. Ei" (PokéWiki: Schlechtes Ei / Schl. Ei)
	; MON_NAME_LENGTH = 11 → 8 Zeichen + 3× "@"
	db "S", 1
	db "c", 1
	db "h", 1
	db "l", 1
	db ".", 1
	db " ", 1
	db "E", 1
	db "i", 1
	db "@", 3
	db "?", 1 ; $9e
	db "@", 7 ; $53
	db $00, 3
	db $ff ; end
