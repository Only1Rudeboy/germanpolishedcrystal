BethAnswerPhoneText:
	text "Hallo, hier ist"
	line ""
	text_ram wStringBuffer3
	text "."

	para "Oh, <PLAYER>."
	line "Guten Morgen."
	done

BethAnswerPhoneDayText:
	text "Hallo, hier ist"
	line ""
	text_ram wStringBuffer3
	text "."

	para "Oh. Hi, <PLAYER>."
	done

BethAnswerPhoneNiteText:
	text "Hallo, hier ist"
	line ""
	text_ram wStringBuffer3
	text "."

	para "Oh, <PLAYER>."
	line "Guten Abend."
	done

BethGreetText:
	text "Guten Morgen,"
	line "<PLAYER>!"

	para "Hier ist "
	text_ram wStringBuffer3
	text "."
	line "Warst du am"
	cont "Schlafen?"
	done

BethGreetDayText:
	text "<PLAYER>, hi!"
	line "Hier ist "
	text_ram wStringBuffer3
	text "."

	para "Hast du Zeit?"
	done

BethGreetNiteText:
	text "Hi, <PLAYER>."
	line "Guten Abend."

	para "Hier ist "
	text_ram wStringBuffer3
	text "."

	para "Hoffentlich warst"
	line "du wach."
	done

BethGenericText:
	text "Gehst du oft in"
	line "#mon-Center?"

	para "Ich gehe täglich."
	line "Auf die"
	cont "Gesundheit"

	para "deiner #mon zu"
	line "achten ist Grund-"
	cont "lage eines"
	cont "Trainers."
	done
