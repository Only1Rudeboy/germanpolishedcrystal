WadeAnswerPhoneText:
	text "Hallo? Hier"
	line "spricht"
	cont ""
	text_ram wStringBuffer3
	text "."

	para "Oh. Hi, <PLAYER>!"
	line "Guten Morgen!"
	done

WadeAnswerPhoneDayText:
	text "Hallo? Hier"
	line "spricht"
	cont ""
	text_ram wStringBuffer3
	text "."

	para "Oh, hi, <PLAYER>!"
	done

WadeAnswerPhoneNiteText:
	text "Hallo? Hier"
	line "spricht"
	cont ""
	text_ram wStringBuffer3
	text "."

	para "Oh, hi, <PLAYER>!"
	line "Guten Abend!"
	done

WadeGreetText:
	text "<PLAYER>, guten"
	line "Morgen!"

	para "Ich bin's, "
	text_ram wStringBuffer3
	text ". Schönes Wetter!"
	done

WadeGreetDayText:
	text "<PLAYER>, hi!"

	para "Ich bin's, "
	text_ram wStringBuffer3
	text ". Schönes Wetter!"
	done

WadeGreetNiteText:
	text "Guten Abend,"
	line "<PLAYER>!"

	para "Ich bin's, "
	text_ram wStringBuffer3
	text ". Warst du wach?"
	done

WadeGenericText:
	text "Wie gehen deine"
	line "#mon?"

	para "Meine haben zu"
	line "viel Energie."

	para "Besonders "
	text_ram wStringBuffer4
	text " ist schwer zu"
	line "handhaben."

	para "Das ist"
	line "anstrengend."
	done
