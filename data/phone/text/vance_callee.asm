VanceAnswerPhoneText:
	text "Ja, hallo?"
	line ""
	text_ram wStringBuffer3
	text " hier!"

	para "Morgen, <PLAYER>!"

	para "Nutzt du Vogel-"
	line "#mon?"
	done

VanceAnswerPhoneDayText:
	text "Ja, hallo?"
	line ""
	text_ram wStringBuffer3
	text " hier!"

	para "Hi, <PLAYER>!"

	para "Fliegen deine"
	line "Vogel-#mon?"
	done

VanceAnswerPhoneNiteText:
	text "Ja, hallo?"
	line ""
	text_ram wStringBuffer3
	text " hier!"

	para "Abend, <PLAYER>!"
	line "Lässt du deine"

	para "Vogel-#mon"
	line "fliegen?"
	done

VanceGreetText:
	text "Guten Morgen,"
	line "<PLAYER>!"

	para "Ich bin's, "
	text_ram wStringBuffer3
	text "! Guten Morgen!"
	done

VanceGreetDayText:
	text "Hi, <PLAYER>!"

	para "Ich bin's, "
	text_ram wStringBuffer3
	text "! Erinnerst du"
	line "dich?"
	done

VanceGreetNiteText:
	text "Guten Abend,"
	line "<PLAYER>!"

	para "Ich bin's, "
	text_ram wStringBuffer3
	text "! Hast du Zeit?"
	done

VanceGenericText:
	text "Geht es dir und"
	line "deinen #mon"
	cont "gut?"

	para "Mein"
	line ""
	text_ram wStringBuffer4
	cont "wird stark"
	cont "genug für die"

	para "legendären Vogel-"
	line "#mon!"
	done
