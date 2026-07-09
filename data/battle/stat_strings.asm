StatStrings:
; entries correspond to stat constants
	table_width 1
	dr .health
	dr .attack
	dr .defense
	dr .speed
	dr .sp_atk
	dr .sp_def
	assert_table_length NUM_STATS

.health:  db "KP@"
.attack:  db "Angriff@"
.defense: db "Verteid.@"
.speed:   db "Initiative@"
.sp_atk:  db "Sp.-Ang.@"
.sp_def:  db "Sp.-Vert.@"