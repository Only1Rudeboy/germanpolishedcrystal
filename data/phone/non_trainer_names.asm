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
	; GSC-DE Dump: MAMA
	text "MAMA:"
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
	; GSC-DE Dump: FAHRRADLADEN
	text "FAHRRADLADEN:"
	done
.lyra:
	text "LYRA:"
	next1 "   <PK><MN>-Trainer"
	done
.buena:
	text "BUENA:"
	; GSC-DE Dump: DISC JOCKEY (loanword)
	next1 "   DISC JOCKEY"
	done