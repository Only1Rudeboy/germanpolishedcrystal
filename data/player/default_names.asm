DefaultPlayerNames:
	table_width NAME_LENGTH
	; GSC-DE-übliche Default-Namen (Länge NAME_LENGTH)
	rawchar "Chris@@@", 0, 0, 0 ; PLAYER_MALE
	rawchar "Kris@@@@", 0, 0, 0 ; PLAYER_FEMALE
	rawchar "Alex@@@@", 0, 0, 0 ; PLAYER_ENBY
	rawchar "Max@@@@@", 0, 0, 0 ; PLAYER_BETA
	assert_table_length NUM_PLAYER_GENDERS