BillPhoneMornGreetingText:
	text "Guten Morgen!"

	para "Dies ist der VER-"
	line "WALTUNGSSERVICE"

	para "DES #MON-LAGE-"
	line "RUNGS-SYSTEMs."
	done

BillPhoneDayGreetingText:
	text "Guten Tag!"

	para "Dies ist der VER-"
	line "WALTUNGSSERVICE"

	para "DES #MON-LAGE-"
	line "RUNGS-SYSTEMs."
	done

BillPhoneNiteGreetingText:
	text "Guten Abend!"

	para "Dies ist der VER-"
	line "WALTUNGSSERVICE"

	para "DES #MON-LAGE-"
	line "RUNGS-SYSTEMs."
	done

BillPhoneGenericText:
	text "Wer ist dran?"

	para "<PLAYER>, oder?"
	line "Moment noch…"

	para "……"
	line "……"
	done

BillPhoneNotFullText:
	text "Danke, dass du"
	line "gewartet hast!"

	para "<PLAYER>, in der"
	line "BOX ist noch Platz"
	cont "für "
	text_ram wStringBuffer3
	text " #MON."

	para "Schwing die Hufe"
	line "und mach sie voll!"
	done

BillPhoneNearlyFullText:
	text "Danke, dass du"
	line "gewartet hast!"

	para "<PLAYER>, in der"
	line "BOX ist noch Platz"
	cont "für "
	text_ram wStringBuffer3
	text " #MON."

	para "Wechsle doch die"
	line "BOX."
	done

BillPhoneFullText:
	text "Danke, dass du"
	line "gewartet hast!"

	para "<PLAYER>, deine"
	line "BOX ist voll!"

	para "Wenn du mehr #-"
	line "MON fangen möch-"
	cont "test, musst du die"
	cont "BOX wechseln."
	prompt

BillPhoneNewlyFullText:
	text "Hi, <PLAYER>? Ich"
	line "bin's, BILL!"

	para "Danke, dass du das"
	line "LAGERUNGS-SYSTEM"
	cont "benutzt."

	para "Deine aktuelle BOX"
	line "ist voll und kann"

	para "keine #MON"
	line "mehr aufnehmen."

	para "Du musst die BOX"
	line "wechseln, wenn du"

	para "mehr #MON fan-"
	line "gen willst."

	para "Bis dann!"
	prompt

BillWholePCFullText:
	text "Wow, du hast"
	line "einen ganzen"
	cont "PC voll."

	para "Du musst #MON"
	line "freilassen, um"
	cont "Platz zu"
	cont "schaffen."
	done

BillFlushBySaving:
	text "Es muss erst"
	line "aufgeräumt"
	cont "werden,"

	para "bevor du den PC"
	line "weiter nutzen"
	cont "kannst."

	para "Speichere das"
	line "Spiel, um den PC"
	cont "weiter zu nutzen."

	para "Willst du jetzt"
	line "speichern?"
	done

BillThankYouText:
	text "Danke, dass du"
	line "das"
	cont "LAGERUNGS-SYSTEM"
	cont "benutzt!"
	done

BillCallMeToSwitch:
	text "O.K., ich lass es"
	line "so."

	para "Speichere, falls"
	line "du es dir anders"
	cont "überlegst."
	prompt

BillPhoneSecondBadgeText:
	text "Hey, Trainer! Ich"
	line "bin's, BILL!"

	para "Ich rufe an, um"
	line "euch vor dem"
	cont "Wunder-Tausch zu"
	cont "warnen."

	para "Die Maschine war"
	line "in letzter Zeit"
	cont "instabil, und"
	cont "meine"

	para "Reparaturen sind"
	line "noch nicht"
	cont "fertig."

	para "Wenn du in"
	line "DUKATIA CITY"
	cont "bist,"

	para "sei vorsichtig"
	line "mit dem Wunder-"
	cont "Tausch."

	para "Du könntest ein"
	line "seltsames #MON"
	cont "bekommen."

	para "Das war's."
	line "Tschüss!"
	done
