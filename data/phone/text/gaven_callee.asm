GavenAnswerPhoneText:
	text "Hallo, hier"
	line "spricht"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "Hi, <PLAYER>!"
	line "Guten Morgen!"
	done

GavenAnswerPhoneDayText:
	text "Hallo, hier"
	line "spricht"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "Hi, <PLAYER>!"
	done

GavenAnswerPhoneNiteText:
	text "Hallo, hier"
	line "spricht"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "Hi, <PLAYER>!"
	line "Guten Abend!"
	done

GavenGreetText:
	text "<PLAYER>, guten"
	line "Morgen!"

	para "Ich bin's, "
	text_ram wStringBuffer3
	text "."
	line "Wie geht's?"
	done

GavenGreetDayText:
	text "Hi, <PLAYER>!"

	para "Ich bin's, "
	text_ram wStringBuffer3
	text "."
	line "Wie geht's?"
	done

GavenGreetNiteText:
	text "<PLAYER>, guten"
	line "Abend!"

	para "Ich bin's, "
	text_ram wStringBuffer3
	text "."
	line "Wie geht's?"
	done

GavenGenericText:
	text "Wie gehen deine"
	line "#mon?"

	para "Mein "
	text_ram wStringBuffer4
	text " ist"
	line "topfit wie immer."

	para "Weiter so, bis"
	line "wir"
	line "#mon-Champs sind!"
	done
