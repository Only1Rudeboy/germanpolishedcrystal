WadeAnswerPhoneText:
	text "Hallo? Hier ist"
	line ""
	text_ram wStringBuffer3
	text "."

	para "Oh. Hi, <PLAYER>!"
	line "Guten Morgen!"
	done

WadeAnswerPhoneDayText:
	text "Hallo? Hier ist"
	line ""
	text_ram wStringBuffer3
	text "."

	para "Oh, hi, <PLAYER>!"
	done

WadeAnswerPhoneNiteText:
	text "Hallo? Hier ist"
	line ""
	text_ram wStringBuffer3
	text "."

	para "Oh, hi, <PLAYER>!"
	line "Guten Abend!"
	done

WadeGreetText:
	text "<PLAYER>,"
	line "guten Morgen!"

	para ""
	text_ram wStringBuffer3
	text ", hallo!"
	line "Schön heute, oder?"
	done

WadeGreetDayText:
	text "<PLAYER>,"
	line "alles senkrecht?"

	para ""
	text_ram wStringBuffer3
	text "."
	line "Schön heute, oder?"
	done

WadeGreetNiteText:
	text "Guten Abend,"
	line "<PLAYER>!"

	para "Ich, "
	text_ram wStringBuffer3
	text "."
	line "Bist du wach?"
	done

WadeGenericText:
	text "Wie geht es deinen"
	line "#MON?"

	para "Meine #MON"
	line "haben zu viel"

	para "Energie. Das ist"
	line "ein Problem."

	para "Von all meinen"
	line "#MON ist"
	cont ""
	text_ram wStringBuffer4
	text " am"
	cont "schwierigsten."

	para "Mit ihm zu arbei-"
	line "ten ist ermüdend."
	done
