ElmPhoneStartText:
	text "Hallo, <PLAYER>?"

	para "Übertreib es nicht"
	line "zu sehr."

	para "Heile deine"
	line "#mon, wenn sie"
	cont "verletzt sind."
	done

ElmPhoneSawMrPokemonText:
	text "Hallo, <PLAYER>?"

	para "Hast du Mr.#mon"
	line "getroffen? Toll!"

	para "Komm sicher wieder"
	line "zurück!"
	done

ElmPhonePokemonStolenText:
	text "<PLAYER>? Ich bin"
	line "sehr aufgebracht."

	para "Ein #mon wurde"
	line "von uns gestohlen."

	para "Wie kann jemand so"
	line "etwas tun?"
	prompt

ElmPhoneCheckingEggText:
	text "Hallo, <PLAYER>?"

	para "Wir untersuchen"
	line "das Ei gerade. Es"

	para "scheint wirklich"
	line "ein #mon-Ei zu"
	cont "sein."
	prompt

ElmPhoneAssistantText:
	text "Hallo, <PLAYER>?"

	para "Hast du meinen"
	line "Assistenten"
	cont "gesehen? Er ist im"

	para "#mon-Center in"
	line "Viola City."
	done

ElmPhoneEggUnhatchedText:
	text "Hallo, <PLAYER>?"

	para "Wie geht's dem Ei?"
	line "Hat sich was"
	cont "geändert?"

	para "Wenn was passiert,"
	line "ruf mich an."
	prompt

ElmPhoneEggHatchedText:
	text "Hallo, <PLAYER>?"
	line "Wie geht's dem Ei?"

	para "Was? Es ist"
	line "geschlüpft? Wow!"
	cont "Was"

	para "für ein #mon"
	line "ist es? Komm und"
	cont "zeig es mir!"
	prompt

ElmPhoneDiscovery1Text:
	text "Hallo, <PLAYER>?"

	para "Ich habe gerade"
	line "etwas Neues"
	cont "entdeckt."

	para "Die Zeit, bis ein"
	line "Ei schlüpft,"

	para "hängt vom #mon"
	line "ab."
	prompt

ElmPhoneDiscovery2Text:
	text "Hallo, <PLAYER>?"

	para "Es ist noch ein"
	line "Rätsel, welche"

	para "Attacken"
	line "geschlüpfte"
	cont "#mon haben."

	para "Wir forschen"
	line "gerade daran."
	prompt

ElmPhonePokerusText:
	text "Hallo, <PLAYER>?"

	para "Ich habe etwas"
	line "Seltsames"
	cont "entdeckt."

	para "Anscheinend gibt"
	line "es etwas namens"

	para "#rus, das"
	line "#mon befällt."

	para "Ja, wie ein Virus,"
	line "daher #rus."

	para "Es vermehrt sich"
	line "schnell und"
	cont "befällt"

	para "andere #mon."
	line "Aber das war's"
	cont "auch."

	para "Es scheint nichts"
	line "zu tun und geht"
	cont "mit"

	para "der Zeit wieder"
	line "weg."

	para "Ich denke, man"
	line "muss sich keine"

	para "Sorgen machen."
	line "Tschüss!"
	done

ElmPhoneDisasterText:
	text "H-hallo? <PLAYER>?"
	line "Das ist eine"
	cont "Katastrophe!"

	para "Äh, ähm, es ist"
	line "schrecklich!"

	para "Was soll ich tun?"
	line "Es… Oh nein…"

	para "Komm sofort"
	line "zurück!"
	done

ElmPhoneEggAssistantText:
	text "Hallo, <PLAYER>!"
	line "Wir haben etwas"
	cont "über"

	para "das Ei"
	line "herausgefunden!"

	para "Mein Assistent ist"
	line "im #mon-Center"

	para "in Viola City."
	line "Kannst du mit ihm"
	cont "reden?"
	done

ElmPhoneRocketText:
	text "<PLAYER>, wie"
	line "läuft es?"

	para "Ich rief an, weil"
	line "etwas Seltsames"
	cont "mit"

	para "den Radioübertra-"
	line "gungen passiert."

	para "Sie sprachen von"
	line "Team Rocket."

	para "<PLAYER>, weißt du"
	line "etwas darüber?"

	para "Vielleicht ist"
	line "Team Rocket"
	cont "zurück. Nein,"

	para "das kann nicht"
	line "stimmen."

	para "Sorry, dass ich"
	line "nervte. Pass auf!"
	done

ElmPhoneGiftText:
	text "Hallo, <PLAYER>?"

	para "Ich habe etwas für"
	line "dich."

	para "Kannst du in mein"
	line "Labor kommen?"

	para "Bis bald!"
	done

ElmPhoneEvolutionQuestionText:
	text "Übrigens,"
	line "<PLAYER>, willst"
	cont "du"

	para "wissen, wie dein"
	line "#mon sich"
	cont "entwickelt?"
	done

ElmPhoneEvoText_None:
	text "Nun, "
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "nicht!"
	prompt

ElmPhoneEvoText_Level:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "auf"
	cont "Level "
	text_decimal wStringBuffer4, 1, 3
	text "."
	prompt

ElmPhoneEvoText_Item:
	text_ram wStringBuffer3
	line "entwickelt sich,"

	para "wenn es einem"
	line ""
	text_ram wStringBuffer4
	text " ausgesetzt wird."
	prompt

ElmPhoneEvoText_TradeNoItem:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "per"
	cont "Tausch oder mit"
	cont ""
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_TradeWithItem:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "per"
	cont "Tausch oder beim"

	para "Levelaufstieg mit"
	line ""
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_Holding:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "beim"
	cont "Levelaufstieg"

	para "mit einem"
	line ""
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_Holding_MornDay:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "beim"
	cont "Levelaufstieg"

	para "mit einem"
	line ""
	text_ram wStringBuffer4
	cont ", aber"

	para "nur morgens oder"
	line "tagsüber."
	prompt

ElmPhoneEvoText_Holding_EveNite:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "beim"
	cont "Levelaufstieg"

	para "mit einem"
	line ""
	text_ram wStringBuffer4
	cont ", aber"

	para "nur abends oder"
	line "nachts."
	prompt

ElmPhoneEvoText_Happiness:
	text_ram wStringBuffer3
	line "entwickelt sich,"
	cont "wenn es sehr"
	cont "glücklich ist!"
	prompt

ElmPhoneEvoText_Happiness_MornDay:
	text_ram wStringBuffer3
	line "entwickelt sich,"
	cont "wenn es sehr"

	para "glücklich ist,"
	line "aber nur morgens"
	cont "oder tagsüber."
	prompt

ElmPhoneEvoText_Happiness_EveNite:
	text_ram wStringBuffer3
	line "entwickelt sich,"
	cont "wenn es sehr"

	para "glücklich ist,"
	line "aber nur abends"
	cont "oder nachts."
	prompt

ElmPhoneEvoText_Stat:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "auf"
	cont "Level "
	text_decimal wStringBuffer4, 1, 3
	cont ", aber"

	para "was daraus wird,"
	line "hängt von Angriff"
	cont "und"

	para "Verteidigung ab."
	prompt

ElmPhoneEvoText_Location:
	text_ram wStringBuffer3
	line "entwickelt sich"

	para "beim Levelaufstieg"
	line "in "
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_Move:
	text_ram wStringBuffer3
	line "entwickelt sich"

	para "beim"
	line "Levelaufstieg,"
	cont "wenn es die"
	cont "Attacke"

	para ""
	text_ram wStringBuffer4
	line "beherrscht."
	prompt

ElmPhoneEvoText_Crit:
	text_ram wStringBuffer3
	line "entwickelt sich,"

	para "nachdem es in"
	line "einem Kampf drei"
	cont "Volltreffer"
	cont "landet."
	prompt

ElmPhoneEvoText_Party:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "beim"
	cont "Levelaufstieg,"

	para "wenn du ein"
	line ""
	text_ram wStringBuffer4
	text " im Team hast."
	prompt

ElmPhoneEvoText_Egg:
	text "Eier entwickeln"
	line "sich nicht, sie"
	cont "schlüpfen!"
	prompt

ElmPhoneEvoText_Pikachu:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "mit"

	para "einem ThunderStone"
	line "oder einem Odd"
	cont "Souvenir."
	prompt

ElmPhoneEvoText_Gloom:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "mit"

	para "einem Leaf Stone"
	line "oder einem Sun"
	cont "Stone."
	prompt

ElmPhoneEvoText_Poliwhirl:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "mit"

	para "einem Water Stone"
	line "oder mit King's"

	para "Rock beim Tausch"
	line "oder"
	cont "Levelaufstieg."
	prompt

ElmPhoneEvoText_SlowpokePlain:
ElmPhoneEvoText_SlowpokeGalarian:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "auf"
	cont "Level 37 oder mit"

	para "King's Rock beim"
	line "Tausch oder"
	cont "Levelaufstieg."
	prompt

ElmPhoneEvoText_Magneton:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "mit"

	para "einem ThunderStone"
	line "oder beim Level-"

	para "aufstieg in einem"
	line "magnetischen Feld."

	para "Magnettunnel und"
	line "Dunkelgrotte haben"
	cont "so etwas."
	prompt

ElmPhoneEvoText_Exeggcute:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "mit"

	para "einem Leaf Stone"
	line "oder einem Odd"
	cont "Souvenir."
	prompt

ElmPhoneEvoText_Koffing:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "auf"
	cont "Level 35 oder mit"

	para "Charcoal beim"
	line "Tausch oder"
	cont "Levelaufstieg."
	prompt

ElmPhoneEvoText_Cubone:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "auf"
	cont "Level 28 oder mit"

	para "einem Odd"
	line "Souvenir."
	prompt

ElmPhoneEvoText_Scyther:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "beim"
	cont "Levelaufstieg"

	para "mit Metal Coat"
	line "oder Hard Stone."

	para "Metal Coat geht"
	line "auch beim Tausch."
	prompt

ElmPhoneEvoText_Eevee:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "auf"
	cont "so viele Arten!"

	para "Mit acht"
	line "verschiedenen"
	cont "Steinen oder"

	para "beim Levelaufstieg"
	line "bei einem Moss"
	cont "Rock"

	para "oder Ice Rock. Im"
	line "Steineichenwald"
	cont "und"

	para "Eispfad soll es"
	line "die geben. Aber"
	cont "Eevee"

	para "entwickelt sich"
	line "auch bei Sonne"
	cont "oder"

	para "Mond, wenn es sehr"
	line "glücklich ist!"
	prompt

ElmPhoneEvoText_MimeJr:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "mit"

	para "einem Ice Stone"
	line "oder beim Level-"

	para "aufstieg bei einem"
	line "Ice Rock."

	para "Im Eispfad soll es"
	line "einen geben."
	prompt

ElmPhoneEvoText_Stantler:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "bei"

	para "hartem Hagel oder"
	line "Sand."

	para "Holprige Straße"
	line "und Schneegipfel"
	cont "haben so ein"
	cont "Wetter."
	prompt

ElmPhoneEvoText_AncientSinnoh:
	text "Aber laut seiner"
	line "Abstammung könnte"

	para "es sich auch"
	line "entwickeln, wenn"
	cont "es"

	para "an altes Sinnoh"
	line "erinnert wird…"
	cont "irgendwie…"
	prompt

ElmPhoneEvoText_DunsparceSegments:
	text "Manche werden"
	line "länger als andere."

	para "Das liegt einfach"
	line "in ihren Genen."
	prompt

ElmPhoneEvolutionRefusedText:
	text "Sorry, dass ich"
	line "nervte."
	prompt

ElmPhoneEndText:
	text "Pass auf dich auf!"
	done
