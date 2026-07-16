NonTrainerCallerNames:
; entries correspond to PHONECONTACT_* constants (see constants/trainer_constants.asm)
	table_width 2
	dw EmptyString
	dw .mom
	dw .bikeshop
	dw .bill
	dw .elm
	dw .lyra
	dw .buena
	assert_table_length NUM_NONTRAINER_PHONECONTACTS + 1

.mom:
	text "Mama:"
	done
.bill:
	text "BILL:"
	next1 "   #MANIAC"
	done
.elm:
	text "PROF. LIND:"
	next1 "   #-Prof."
	done
.bikeshop:
	text "Wunder-Radladen:"
	done
.lyra:
	text "LYRA:"
	next1 "   <PK><MN>-Trainer"
	done
.buena:
	text "BUENA:"
	next1 "   Moderatorin"
	done