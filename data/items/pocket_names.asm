ItemPocketNames:
	table_width 1
	dr .Item
	dr .Medicine
	dr .Ball
	dr .TM ; impossible
	dr .Berry
	dr .Key ; impossible
	assert_table_length NUM_POCKETS

; DE-Canon (GSC/Crystal-Stil + Polished-Taschen):
; Items / Medizin / Bälle / TM/VM / Beeren / Basis-Items
.Item:
	db "Items@"
.Medicine:
	db "Medizin@"
.Ball:
	db "Bälle@"
.TM:
	db "TM/VM@"
.Berry:
	db "Beeren@"
.Key:
	db "Basis-Items@"