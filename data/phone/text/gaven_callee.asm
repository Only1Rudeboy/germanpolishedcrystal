GavenAnswerPhoneText:
	text "Hallo, hier"
	line "spricht"
	cont ""
	text_ram wStringBuffer3
	text "…"

	para "Hi, <PLAYER>!"
	line "Guten Morgen!"
	done

GavenAnswerPhoneDayText:
	text "Hallo, hier"
	line "spricht"
	cont ""
	text_ram wStringBuffer3
	text "…"

	para "Hi, <PLAYER>!"
	done

GavenAnswerPhoneNiteText:
	text "Hallo, hier"
	line "spricht"
	cont ""
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
	text ". Wie geht's?"
	done

GavenGreetDayText:
	text "Hi, <PLAYER>!"

	para "Ich bin's, "
	text_ram wStringBuffer3
	text ". Wie geht's?"
	done

GavenGreetNiteText:
	text "<PLAYER>, guten"
	line "Abend!"

	para "Ich bin's, "
	text_ram wStringBuffer3
	text ". Wie geht's?"
	done

GavenGenericText:
	text "Wie gehen deine"
	line "#mon?"

	para "Mein"
	line ""
	text_ram wStringBuffer4
	cont "ist topfit wie"
	cont "immer."

	para "Weiter so, bis wir"
	line "#mon-Champs"
	cont "sind!"
	done
