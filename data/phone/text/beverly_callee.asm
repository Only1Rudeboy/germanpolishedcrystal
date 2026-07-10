BeverlyAnswerPhoneText:
	text "Hallo, hier ist"
	line ""
	text_ram wStringBuffer3
	text "."

	para "Oh! Guten Morgen,"
	line "<PLAYER>."
	done

BeverlyAnswerPhoneDayText:
	text "Hallo, hier ist"
	line ""
	text_ram wStringBuffer3
	text "."

	para "Oh! Guten Tag,"
	line "<PLAYER>."
	done

BeverlyAnswerPhoneNiteText:
	text "Hallo, hier ist"
	line ""
	text_ram wStringBuffer3
	text "."

	para "Oh! Guten Abend,"
	line "<PLAYER>."
	done

BeverlyGreetText:
	text "Hallo, <PLAYER>."
	line "Guten Morgen."

	para "Hier ist "
	text_ram wStringBuffer3
	text ". Warst du am"
	line "Schlafen?"
	done

BeverlyGreetDayText:
	text "Hi, <PLAYER>. Hier"
	line "ist "
	text_ram wStringBuffer3
	text "."

	para "Wie geht's dir?"
	done

BeverlyGreetNiteText:
	text "Hi, <PLAYER>. Hier"
	line "ist "
	text_ram wStringBuffer3
	text "."

	para "Warst du wach?"
	done

BeverlyGenericText:
	text "Sind deine #mon"
	line "glücklich?"

	para "Mein "
	text_ram wStringBuffer4
	text " ist gesund. Es"
	line "frisst täglich"
	cont "viel."
	done
