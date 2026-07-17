ElmPhoneStartText:
	text "Hallo, <PLAYER>?"

	para "Übertreib es"
	line "nicht."

	para "Heile deine #-"
	line "MON, falls sie"
	cont "verletzt sind."
	done

ElmPhoneSawMrPokemonText:
	text "Hallo, <PLAYER>?"

	para "Hast du MR. #-"
	line "MON getroffen?"
	cont "Komm heil wieder!"
	done

ElmPhonePokemonStolenText:
	text "<PLAYER>? Ich bin"
	line "sehr verärgert."

	para "Uns wurde ein"
	line "#MON gestohlen."

	para "Wie kann man so"
	line "etwas nur tun?"
	prompt

ElmPhoneCheckingEggText:
	text "Hallo, <PLAYER>?"

	para "Wir überprüfen das"
	line "EI. Es scheint"

	para "ein #MON-EI"
	line "zu sein."
	prompt

ElmPhoneAssistantText:
	text "Hallo, <PLAYER>?"

	para "Hast du meinen"
	line "Assistenten"

	para "getroffen? Er ist"
	line "im #MON-CENTER"
	cont "in VIOLA CITY."
	done

ElmPhoneEggUnhatchedText:
	text "Hallo, <PLAYER>?"

	para "Was macht das EI?"
	line "Hat es sich"
	cont "verändert?"

	para "Ruf an, falls"
	line "etwas passiert."
	prompt

ElmPhoneEggHatchedText:
	text "Hallo, <PLAYER>?"
	line "Was macht das EI?"

	para "Wie? Es ist"
	line "geschlüpft? Wow!"

	para "Was für ein"
	line "#MON ist es?"

	para "Komm und zeige es"
	line "mir bitte!"
	prompt

ElmPhoneDiscovery1Text:
	text "Hallo, <PLAYER>?"

	para "Ich habe soeben"
	line "eine neue Ent-"
	cont "deckung gemacht."

	para "Die Zeit, bis es"
	line "aus dem EI"

	para "schlüpft, hängt"
	line "vom #MON ab."
	prompt

ElmPhoneDiscovery2Text:
	text "Hallo, <PLAYER>?"

	para "Es ist noch nicht"
	line "gelöst, welche"

	para "Attacken junge"
	line "#MON haben."

	para "Das untersuchen"
	line "wir jetzt."
	prompt

ElmPhonePokerusText:
	text "Hallo, <PLAYER>?"

	para "Ich habe etwas"
	line "Seltsames"
	cont "entdeckt."

	para "Scheinbar gibt es"
	line "einen sogenannten"

	para "#RUS, der"
	line "#MON infiziert."

	para "Es ist eine Art"
	line "Virus und wird"

	para "daher #RUS"
	line "genannt."

	para "Es vermehrt sich"
	line "rapide und infi-"
	cont "ziert andere #-"
	cont "MON. Das ist"
	cont "alles."

	para "Es scheint keine"
	line "Auswirkungen zu"

	para "haben und ver-"
	line "schwindet nach"
	cont "einiger Zeit."

	para "Ich denke, man"
	line "braucht sich"

	para "darüber keine"
	line "Sorgen zu machen!"
	done

ElmPhoneDisasterText:
	text "H-hallo? <PLAYER>?"
	line "Welch Unglück!"

	para "Uh, um, es ist"
	line "schrecklich!"

	para "Was soll ich tun?"
	line "Es… oh, nein…"

	para "Bitte komm schnell"
	line "zurück!"
	done

ElmPhoneEggAssistantText:
	text "Hallo, <PLAYER>?"
	line "Wir haben etwas"

	para "über das EI"
	line "herausgefunden!"

	para "Mein Assistent ist"
	line "im #MON-CENTER"

	para "von VIOLA CITY."
	line "Sprich doch bitte"
	cont "mit ihm?"
	done

ElmPhoneRocketText:
	text "<PLAYER>, wie"
	line "stehen die Dinge?"

	para "Ich rufe an, weil"
	line "etwas Merkwürdiges"

	para "mit den Radiosen-"
	line "dungen geschieht."

	para "Sie redeten über"
	line "TEAM ROCKET."

	para "<PLAYER>, weißt"
	line "du etwas darüber?"

	para "Vielleicht feiert"
	line "TEAM ROCKET ein"

	para "Comeback. Nein,"
	line "das ist nicht"
	cont "wahr."

	para "Sorry für die"
	line "Belästigung. Pass"
	cont "auf dich auf!"
	done

ElmPhoneGiftText:
	text "Hallo, <PLAYER>?"

	para "Ich habe hier"
	line "etwas für dich."

	para "Schaust du mal in"
	line "meinem LABOR"
	cont "vorbei?"

	para "Bis später!"
	done

ElmPhoneEvolutionQuestionText:
	text "Übrigens,"
	line "<PLAYER>, willst"
	cont "du"

	para "wissen, wie dein"
	line "#MON sich"
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

	para "beim"
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

	para "einem Donnerstein"
	line "oder einem"
	cont "Kuriosum."
	prompt

ElmPhoneEvoText_Gloom:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "mit"

	para "einem Blattstein"
	line "oder einem"
	cont "Sonnenstein."
	prompt

ElmPhoneEvoText_Poliwhirl:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "mit"

	para "einem Wasserstein"
	line "oder mit King-"
	cont "Stein beim Tausch"

	para "oder"
	line "Levelaufstieg."
	prompt

ElmPhoneEvoText_SlowpokePlain:
ElmPhoneEvoText_SlowpokeGalarian:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "auf"
	cont "Level 37 oder mit"

	para "King-Stein beim"
	line "Tausch oder"
	cont "Levelaufstieg."
	prompt

ElmPhoneEvoText_Magneton:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "mit"

	para "einem Donnerstein"
	line "oder beim Level-"

	para "aufstieg an einem"
	line "magnetischen Ort."

	para "Magnettunnel und"
	line "Dunkelgrotte"
	cont "haben so etwas."
	prompt

ElmPhoneEvoText_Exeggcute:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "mit"

	para "einem Blattstein"
	line "oder einem"
	cont "Kuriosum."
	prompt

ElmPhoneEvoText_Koffing:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "auf"
	cont "Level 35 oder mit"

	para "Holzkohle beim"
	line "Tausch oder"
	cont "Levelaufstieg."
	prompt

ElmPhoneEvoText_Cubone:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "auf"
	cont "Level 28 oder mit"

	para "einem Kuriosum."
	prompt

ElmPhoneEvoText_Scyther:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "beim"
	cont "Levelaufstieg"

	para "mit Metallmantel"
	line "oder Granitstein."

	para "Metallmantel geht"
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

	para "bei einem"
	line "Moosfelsen oder"

	para "Eisfelsen. Im"
	line "Steineichenwald"
	cont "und"

	para "Eispfad soll es"
	line "die geben. Aber"
	cont "EVOLI"

	para "entwickelt sich"
	line "auch bei Sonne"
	cont "oder"

	para "Mond, wenn es"
	line "glücklich ist!"
	prompt

ElmPhoneEvoText_MimeJr:
	text_ram wStringBuffer3
	line "entwickelt sich"
	cont "mit"

	para "einem Eisstein"
	line "oder beim Level-"

	para "aufstieg bei"
	line "Eisfelsen."

	para "Im Eispfad soll"
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
	line "länger als"
	cont "andere."

	para "Das liegt einfach"
	line "in ihren Genen."
	prompt

ElmPhoneEvolutionRefusedText:
	text "Tut mir leid, dass"
	line "ich nervte."
	prompt

ElmPhoneEndText:
	text "Pass auf dich"
	line "auf!"
	done
