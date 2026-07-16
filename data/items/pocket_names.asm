ItemPocketNames:
	table_width 1
	dr .Item
	dr .Medicine
	dr .Ball
	dr .TM ; impossible
	dr .Berry
	dr .Key ; impossible
	assert_table_length NUM_POCKETS

; GSC-DE-Stil (Dump: ITEM-TASCHE / BALL-TASCHE / TM-TASCHE)
; + PC-Taschen. Kurz genug für:
;   cont "die " + Name + "."  ≤ 18 Zeichen
; z.B. "die Medizintasche." = 18
.Item:
	db "Itemtasche@"
.Medicine:
	db "Medizintasche@"
.Ball:
	db "Balltasche@"
.TM:
	db "TM-Tasche@"
.Berry:
	db "Beerentasche@"
.Key:
	db "Basistasche@"
