ElmPhoneStartText:
	text "Hallo, <PLAYER>?"

	para "Übertreib es"
	line "nicht"
	line "zu sehr."

	para "Heile deine #mon,"
	line "wenn sie verletzt"
	cont "sind."
	done

ElmPhoneSawMrPokemonText:
	text "Hallo, <PLAYER>?"

	para "Hast du Mr.#mon"
	line "getroffen? Toll!"

	para "Komm sicher"
	line "wieder"
	line "zurück!"
	done

ElmPhonePokemonStolenText:
	text "<PLAYER>? Ich bin"
	line "sehr aufgebracht."

	para "Ein #mon wurde"
	line "von uns"
	cont "gestohlen."

	para "Wie kann jemand"
	line "so etwas tun?"
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
	line "Assistenten gese-"
	cont "hen? Er ist im"

	para "#mon-Center in"
	line "Viola City."
	done

ElmPhoneEggUnhatchedText:
	text "Hallo, <PLAYER>?"

	para "Wie geht's dem"
	line "Ei?"
	line "Hat sich was ge-"
	cont "ändert?"

	para "Wenn was"
	line "passiert,"
	line "ruf mich an."
	prompt

ElmPhoneEggHatchedText:
	text "Hallo, <PLAYER>?"
	line "Wie geht's dem"
	cont "Ei?"

	para "Was? Es ist ge-"
	line "schlüpft? Wow!"
	cont "Was"

	para "für ein #mon ist"
	line "es? Komm und zeig"
	cont "es mir!"
	prompt

ElmPhoneDiscovery1Text:
	text "Hallo, <PLAYER>?"

	para "Ich habe gerade"
	line "etwas Neues ent-"
	cont "deckt."

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
	line "geschlüpf-"
	line "te #mon haben."

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

	para "#rus, das #mon"
	line "befällt."

	para "Ja, wie ein"
	line "Virus,"
	line "daher #rus."

	para "Es vermehrt sich"
	line "schnell und"
	cont "befällt"

	para "andere #mon. Aber"
	line "das war's auch."

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
	text "H-hallo?"
	line "<PLAYER>?"
	line "Das ist eine"
	cont "Kata-"
	cont "strophe!"

	para "Äh, ähm, es ist"
	line "schrecklich!"

	para "Was soll ich tun?"
	line "Es… Oh nein…"

	para "Komm sofort"
	line "zurück!"
	done

ElmPhoneEggAssistantText:
	text "Hallo, <PLAYER>!"
	line "Wir"
	line "haben etwas über"

	para "das Ei heraus-"
	line "gefunden!"

	para "Mein Assistent"
	line "ist"
	line "im #mon-Center"

	para "in Viola City."
	line "Kannst du mit ihm"
	cont "reden?"
	done

ElmPhoneRocketText:
	text "<PLAYER>, wie"
	line "läuft"
	line "es?"

	para "Ich rief an, weil"
	line "etwas Seltsames"
	cont "mit"

	para "den Radioübertra-"
	line "gungen passiert."

	para "Sie sprachen von"
	line "Team Rocket."

	para "<PLAYER>, weißt"
	line "du"
	line "etwas darüber?"

	para "Vielleicht ist"
	line "Team"
	line "Rocket zurück."
	cont "Nein,"

	para "das kann nicht"
	line "stimmen."

	para "Sorry, dass ich"
	line "nervte. Pass auf!"
	done

ElmPhoneGiftText:
	text "Hallo, <PLAYER>?"

	para "Ich habe etwas"
	line "für dich."

	para "Kannst du in mein"
	line "Labor kommen?"

	para "Bis bald!"
	done

ElmPhoneEvolutionQuestionText:
	text "Übrigens,"
	line "<PLAYER>, willst"
	cont "du"

	para "wissen, wie dein"
	line "#mon sich ent-"
	cont "wickelt?"
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
	text " aus-"
	cont "gesetzt wird."
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
	text ", aber"

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
	text ", aber"

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
	line "aber"
	line "nur morgens oder"
	cont "tagsüber."
	prompt

ElmPhoneEvoText_Happiness_EveNite:
	text_ram wStringBuffer3
	line "entwickelt sich,"
	cont "wenn es sehr"

	para "glücklich ist,"
	line "aber"
	line "nur abends oder"
	cont "nachts."
	prompt

ElmPhoneEvoText_Stat:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "auf"
	cont "Level "
	text_decimal wStringBuffer4, 1, 3
	text ", aber was"

	para "daraus wird,"
	line "hängt"
	line "von Angriff und"

	para "Verteidigung ab."
	prompt

ElmPhoneEvoText_Location:
	text_ram wStringBuffer3
	line "entwickelt sich"

	para "beim"
	line "Levelaufstieg"
	line "in "
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_Move:
	text_ram wStringBuffer3
	line "entwickelt sich"

	para "beim"
	line "Levelaufstieg,"
	line "wenn es die"
	cont "Attacke"

	para ""
	text_ram wStringBuffer4
	text " beherrscht."
	prompt

ElmPhoneEvoText_Crit:
	text_ram wStringBuffer3
	line "entwickelt sich,"

	para "nachdem es in"
	line "einem"
	line "Kampf drei Voll-"
	cont "treffer landet."
	prompt

ElmPhoneEvoText_Party:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "beim"
	cont "Levelaufstieg,"

	para "wenn du ein"
	line ""
	text_ram wStringBuffer4
	text " im"
	cont "Team hast."
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

	para "einem"
	line "ThunderStone"
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
	cont "Level-"
	cont "aufstieg."
	prompt

ElmPhoneEvoText_Magneton:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "mit"

	para "einem"
	line "ThunderStone"
	line "oder beim Level-"

	para "aufstieg in einem"
	line "magnetischen"
	cont "Feld."

	para "Magnettunnel und"
	line "Dunkelgrotte"
	cont "haben"
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
	cont "Level-"
	cont "aufstieg."
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
	line "oder"
	line "Hard Stone."

	para "Metal Coat geht"
	line "auch beim Tausch."
	prompt

ElmPhoneEvoText_Eevee:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "auf"
	cont "so viele Arten!"

	para "Mit acht"
	line "verschie-"
	line "denen Steinen"
	cont "oder"

	para "beim"
	line "Levelaufstieg"
	line "bei einem Moss"
	cont "Rock"

	para "oder Ice Rock. Im"
	line "Steineichenwald"
	cont "und"

	para "Eispfad soll es"
	line "die"
	line "geben. Aber Eevee"

	para "entwickelt sich"
	line "auch bei Sonne"
	cont "oder"

	para "Mond, wenn es"
	line "sehr"
	line "glücklich ist!"
	prompt

ElmPhoneEvoText_MimeJr:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "mit"

	para "einem Ice Stone"
	line "oder beim Level-"

	para "aufstieg bei"
	line "einem"
	line "Ice Rock."

	para "Im Eispfad soll"
	line "es"
	line "einen geben."
	prompt

ElmPhoneEvoText_Stantler:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "bei"

	para "hartem Hagel oder"
	line "Sand."

	para "Holprige Straße"
	line "und"
	line "Schneegipfel"
	cont "haben"
	cont "so ein Wetter."
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
	line "länger als"
	cont "andere."

	para "Das liegt einfach"
	line "in ihren Genen."
	prompt

ElmPhoneEvolutionRefusedText:
	text "Sorry, dass ich"
	line "nervte."
	prompt

ElmPhoneEndText:
	text "Pass auf dich"
	line "auf!"
	done
