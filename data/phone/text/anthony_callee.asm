AnthonyAnswerPhoneText:
	text "Ja, "
	text_ram wStringBuffer3
	text ", der Wanderer."

	para "Ah, <PLAYER>!"
	done

AnthonyAnswerPhoneDayText:
	text "Ja, "
	text_ram wStringBuffer3
	text ", der Wanderer."

	para "Ah, <PLAYER>,"
	line "stimmt's?"
	done

AnthonyAnswerPhoneNiteText:
	text "Ja, "
	text_ram wStringBuffer3
	text ", der Wanderer."

	para "Ah, <PLAYER>,"
	line "oder?"
	done

AnthonyGreetText:
	text "Yo, <PLAYER>?"

	para "Hier ist "
	text_ram wStringBuffer3
	text ", der Wanderer!"
	done

AnthonyGreetDayText:
	text "Hey, bist du"
	line "<PLAYER>?"

	para "Hier ist "
	text_ram wStringBuffer3
	text ", der Wanderer!"
	done

AnthonyGreetNiteText:
	text "<PLAYER>, bist du"
	line "noch wach?"

	para "Hier ist "
	text_ram wStringBuffer3
	text ", der Wanderer!"
	done

AnthonyGenericText:
	text "Sind deine #mon"
	line "so munter wie"
	cont "immer?"

	para "Mein "
	text_ram wStringBuffer4
	text " und ich - wir"
	line "haben"

	para "Energie im"
	line "Überfluss. Wir"
	cont "wandern"

	para "täglich auf"
	line "Bergen, um uns"
	cont "auszupowern."
	done
