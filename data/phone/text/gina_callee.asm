GinaAnswerPhoneText:
	text "Hallo? Hier ist"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "Oh, <PLAYER>!"
	line "Guten Morgen!"
	done

GinaAnswerPhoneDayText:
	text "Hallo? Hier ist"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "Oh, <PLAYER>!"
	line "Wie geht es dir?"
	done

GinaAnswerPhoneNiteText:
	text "Hallo? Hier ist"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "Oh, <PLAYER>!"
	line "Guten Abend!"
	done

GinaGreetText:
	text "<PLAYER>?"

	para "Ich, "
	text_ram wStringBuffer3
	text "."
	line "Guten Morgen!"
	done

GinaGreetDayText:
	text "<PLAYER>?"

	para "Ich, "
	text_ram wStringBuffer3
	text "."
	line "Hast du Zeit?"
	done

GinaGreetNiteText:
	text "<PLAYER>?"

	para "Ich, "
	text_ram wStringBuffer3
	text "."
	line "Zeit zum Plaudern?"
	done

GinaGenericText:
	text "Sind deine #MON"
	line "noch immer stark?"

	para "Ich trainiere mein"
	line ""
	text_ram wStringBuffer4
	cont "täglich."
	done
