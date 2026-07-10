ItemPocketNames:
	table_width 1
	dr .Item
	dr .Medicine
	dr .Ball
	dr .TM ; impossible
	dr .Berry
	dr .Key ; impossible
	assert_table_length NUM_POCKETS

.Item:
	db "Item-Tasche@"
.Medicine:
	db "Medizin@"
.Ball:
	db "Bälle@"
.TM:
	db "TM-Tasche@"
.Berry:
	db "Beeren@"
.Key:
	db "Schlüssel@"