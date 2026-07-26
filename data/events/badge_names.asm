BadgeNames:
	list_start
	; Johto — volle GSC-DE-Namen (Dump: „PLAYER erhält / XXXORDEN.“)
	; Max ITEM_NAME_LENGTH-1 = 12 Zeichen
	li "FLÜGELORDEN"   ; ZEPHYR
	li "INSEKTORDEN"   ; HIVE
	li "BASISORDEN"    ; PLAIN
	li "PHANTOMORDEN"  ; FOG
	li "STAHLORDEN"    ; MINERAL
	li "FAUSTORDEN"    ; STORM
	li "EISORDEN"      ; GLACIER
	li "DRACHENORDEN"  ; RISING
	; Kanto
	li "FELSORDEN"     ; BOULDER
	li "QUELLORDEN"    ; CASCADE
	li "DONNERORDEN"   ; THUNDER
	li "FARBORDEN"     ; RAINBOW
; Slot-Reihenfolge = MARSHBADGE, SOULBADGE (Konstanten).
; PC-non-FAITHFUL: Fuchsia/Janina gibt MARSH, Saffron/Sabrina gibt SOUL —
; Dialoge sind GSC-DE (Janina=SEELEN, Sabrina=SUMPF).
if DEF(FAITHFUL)
	; Faithful: EN-Badge-Namen Soul/Marsh an den Indexen (wie Upstream-Liste)
	li "SEELENORDEN"
	li "SUMPFORDEN"
else
	li "SEELENORDEN"   ; MARSH → Janina / SEELENORDEN
	li "SUMPFORDEN"    ; SOUL  → Sabrina / SUMPFORDEN
endc
	li "VULKANORDEN"   ; VOLCANO
	li "ERDORDEN"      ; EARTH
	assert_list_length NUM_BADGES
