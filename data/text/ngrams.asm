NgramStrings:
	table_width 1
	dr .un
	dr .ch
	dr .in
	dr .t_
	dr .er
	dr .s_
	dr .an
	dr .on
	dr .te_
	dr .d_
	dr .ei
	dr .u_
	dr .en
	dr .or
	dr .at
	dr .$_
	dr .ll
	dr .D_
	dr .ar
	dr .it
	dr .st
	dr .au
	dr .ha
	dr .a_
	dr .om
	dr .le
	dr .vo_
	dr .se
	dr .re
	dr .zu
	dr .ng_
	dr .Da
	dr .is
	dr .ra
	dr .sc
	dr .Ich_
	dr .o_
	dr .ge
	dr .es
	dr .wa
	dr .e@
	dr .oo
	dr .ck
	dr .r_
	dr .l_
	dr .be
	dr .li
	dr .te
	dr .us
	dr .ti
	dr ._du
	dr .ung_
	dr .der_
	dr .du
	dr .ung
	dr .ist_
	dr .die
	dr .Du_
	dr .er_
	dr .mit
	dr .kaem
	dr .fuer
	dr .ge_
	dr .nd_
	dr .Es_
	dr .das_
	dr .e_
	dr .Poke
	dr .Pokemon
	assert_table_length NGRAMS_VAR_START - NGRAMS_START
	dr .Player
	dr .Rival
	dr .Trendy
	assert_table_length NGRAMS_END - NGRAMS_START + 1

.Player:  dw wPlayerName
.Rival:   dw wRivalName
.Trendy:  dw wTrendyPhrase
.e_:      rawchar "e @"
.un:      rawchar "un@"
.ch:      rawchar "ch@"
.in:      rawchar "in@"
.t_:      rawchar "t @"
.er:      rawchar "er@"
.s_:      rawchar "s @"
.an:      rawchar "an@"
.on:      rawchar "on@"
.te_:     rawchar "te @"
.d_:      rawchar "d @"
.ei:      rawchar "ei@"
.u_:      rawchar "u @"
.en:      rawchar "en@"
.or:      rawchar "or@"
.at:      rawchar "at@"
.$_:      rawchar ", @"
.ll:      rawchar "ll@"
.D_:      rawchar "D @"
.ar:      rawchar "ar@"
.it:      rawchar "it@"
.st:      rawchar "st@"
.au:      rawchar "au@"
.ha:      rawchar "ha@"
.a_:      rawchar "a @"
.om:      rawchar "om@"
.le:      rawchar "le@"
.vo_:     rawchar "vo @"
.se:      rawchar "se@"
.re:      rawchar "re@"
.zu:      rawchar "zu@"
.ng_:     rawchar "ng @"
.Da:      rawchar "Da@"
.is:      rawchar "is@"
.ra:      rawchar "ra@"
.sc:      rawchar "sc@"
.Ich_:    rawchar "Ich @"
.o_:      rawchar "o @"
.ge:      rawchar "ge@"
.es:      rawchar "es@"
.wa:      rawchar "wa@"
.e@:      rawchar "e.@"
.oo:      rawchar "oo@"
.ck:      rawchar "ck@"
.r_:      rawchar "r @"
.l_:      rawchar "l @"
.be:      rawchar "be@"
.li:      rawchar "li@"
.te:      rawchar "te@"
.us:      rawchar "us@"
.ti:      rawchar "ti@"
._du:     rawchar " du@"
.ung_:    rawchar "ung @"
.der_:    rawchar "der @"
.du:      rawchar "du@"
.ung:     rawchar "ung@"
.ist_:    rawchar "ist @"
.die:     rawchar "die@"
.Du_:     rawchar "Du @"
.er_:     rawchar "er @"
.mit:     rawchar "mit@"
.kaem:    rawchar "kaem@"
.fuer:    rawchar "fuer@"
.ge_:     rawchar "ge @"
.nd_:     rawchar "nd @"
.Es_:     rawchar "Es @"
.das_:    rawchar "das @"
.Poke:    rawchar "Poké@"
.Pokemon: rawchar "Pokémon@"