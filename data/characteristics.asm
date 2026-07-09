Characteristics:
	table_width 2
	dw .Chara_HP0
	dw .Chara_HP1
	dw .Chara_HP2
	dw .Chara_HP3
	dw .Chara_HP4
	dw .Chara_Atk0
	dw .Chara_Atk1
	dw .Chara_Atk2
	dw .Chara_Atk3
	dw .Chara_Atk4
	dw .Chara_Def0
	dw .Chara_Def1
	dw .Chara_Def2
	dw .Chara_Def3
	dw .Chara_Def4
	dw .Chara_SAt0
	dw .Chara_SAt1
	dw .Chara_SAt2
	dw .Chara_SAt3
	dw .Chara_SAt4
	dw .Chara_SDf0
	dw .Chara_SDf1
	dw .Chara_SDf2
	dw .Chara_SDf3
	dw .Chara_SDf4
	dw .Chara_Spe0
	dw .Chara_Spe1
	dw .Chara_Spe2
	dw .Chara_Spe3
	dw .Chara_Spe4
	assert_table_length NUM_STATS * 5

.Chara_HP0:
	text  "Liebt es"
	next1 "zu essen"
	done
.Chara_HP1:
	text  "Macht gern"
	next1 "ein Nickerchen"
	done
.Chara_HP2:
	text  "Nickt gern"
	next1 "ein"
	done
.Chara_HP3:
	text  "Streut oft"
	next1 "Dinge herum"
	done
.Chara_HP4:
	text  "Liebt es zu"
	next1 "entspannen"
	done

.Chara_Atk0:
	text  "Stolz auf"
	next1 "seine Stärke"
	done
.Chara_Atk1:
	text  "Prügelt sich"
	next1 "gern"
	done
.Chara_Atk2:
	text  "Erzürnt sich"
	next1 "schnell"
	done
.Chara_Atk3:
	text  "Liebt"
	next1 "Kämpfe"
	done
.Chara_Atk4:
	text  "Impulsiv"
	done

.Chara_Def0:
	text  "Robuster"
	next1 "Körper"
	done
.Chara_Def1:
	text  "Kann Treffer"
	next1 "gut wegstecken"
	done
.Chara_Def2:
	text  "Sehr"
	next1 "ausdauernd"
	done
.Chara_Def3:
	text  "Gute"
	next1 "Ausdauer"
	done
.Chara_Def4:
	text  "Beharrlich"
	done

.Chara_SAt0:
	text  "Sehr"
	next1 "neugierig"
	done
.Chara_SAt1:
	text  "Hinterhältig"
	done
.Chara_SAt2:
	text  "Raffiniert"
	done
.Chara_SAt3:
	text  "Versponnen"
	done
.Chara_SAt4:
	text  "Müffelt gern"
	done

.Chara_SDf0:
	text  "Willensstark"
	done
.Chara_SDf1:
	text  "Etwas eitel"
	done
.Chara_SDf2:
	text  "Sehr trotzig"
	done
.Chara_SDf3:
	text  "Hasst"
	next1 "Niederlagen"
	done
.Chara_SDf4:
	text  "Etwas stur"
	done

.Chara_Spe0:
	text  "Rennt gern"
	done
.Chara_Spe1:
	text  "Hört auf"
	next1 "Geräusche"
	done
.Chara_Spe2:
	text  "Unüberlegt"
	next1 "und albern"
	done
.Chara_Spe3:
	text  "Etwas albern"
	done
.Chara_Spe4:
	text  "Flüchtet"
	next1 "schnell"
	done