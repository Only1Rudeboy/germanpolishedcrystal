NatureNames:
	table_width 1
	dr .Hardy
	dr .Lonely
	dr .Brave
	dr .Adamant
	dr .Naughty
	dr .Bold
	dr .Docile
	dr .Relaxed
	dr .Impish
	dr .Lax
	dr .Timid
	dr .Hasty
	dr .Serious
	dr .Jolly
	dr .Naive
	dr .Modest
	dr .Mild
	dr .Quiet
	dr .Bashful
	dr .Rash
	dr .Calm
	dr .Gentle
	dr .Sassy
	dr .Careful
	dr .Quirky
	dr .NoNature
	assert_table_length NUM_NATURES + 1

.Hardy:    db "Robust@"
.Lonely:   db "Solo@"
.Brave:    db "Mutig@"
.Adamant:  db "Hart@"
.Naughty:  db "Frech@"
.Bold:     db "Kühn@"
.Docile:   db "Sanft@"
.Relaxed:  db "Locker@"
.Impish:   db "Pfiffig@"
.Lax:      db "Lasch@"
.Timid:    db "Scheu@"
.Hasty:    db "Hastig@"
.Serious:  db "Ernst@"
.Jolly:    db "Froh@"
.Naive:    db "Naiv@"
.Modest:   db "Mäßig@"
.Mild:     db "Mild@"
.Quiet:    db "Still@"
.Bashful:  db "Zaghaft@"
.Rash:     db "Hitzig@"
.Calm:     db "Ruhig@"
.Gentle:   db "Zart@"
.Sassy:    db "Forsch@"
.Careful:  db "Sorgfalt@"
.Quirky:   db "Kauzig@"
.NoNature: db "---@"

NatureIndicators:
	table_width 1
	dr .HardyInd
	dr .LonelyInd
	dr .BraveInd
	dr .AdamantInd
	dr .NaughtyInd
	dr .BoldInd
	dr .DocileInd
	dr .RelaxedInd
	dr .ImpishInd
	dr .LaxInd
	dr .TimidInd
	dr .HastyInd
	dr .SeriousInd
	dr .JollyInd
	dr .NaiveInd
	dr .ModestInd
	dr .MildInd
	dr .QuietInd
	dr .BashfulInd
	dr .RashInd
	dr .CalmInd
	dr .GentleInd
	dr .SassyInd
	dr .CarefulInd
	dr .QuirkyInd
	dr .NoNatureInd
	assert_table_length NUM_NATURES + 1

.SassyInd:   db "<NEXT>" ; fallthrough
.RashInd:    db "<NEXT>" ; fallthrough
.ImpishInd:  db "<NEXT>" ; fallthrough
.LonelyInd:  db "↑<NEXT>↓@"
.NaiveInd:   db "<NEXT>" ; fallthrough
.CarefulInd: db "<NEXT>" ; fallthrough
.MildInd:    db "<NEXT>" ; fallthrough
.BoldInd:    db "↓<NEXT>↑@"
.QuietInd:   db "<NEXT>" ; fallthrough
.LaxInd:     db "<NEXT>" ; fallthrough
.AdamantInd: db "↑<NEXT><NEXT>↓@"
.JollyInd:   db "<NEXT>" ; fallthrough
.GentleInd:  db "<NEXT>" ; fallthrough
.ModestInd:  db "↓<NEXT><NEXT>↑@"
.RelaxedInd: db "<NEXT>" ; fallthrough
.NaughtyInd: db "↑<NEXT><NEXT><NEXT>↓@"
.HastyInd:   db "<NEXT>" ; fallthrough
.CalmInd:    db "↓<NEXT><NEXT><NEXT>↑@"
.BraveInd:   db "↑<NEXT><NEXT><NEXT><NEXT>↓@"
.TimidInd:   db "↓<NEXT><NEXT><NEXT><NEXT>↑" ; fallthrough
.HardyInd:
.DocileInd:
.SeriousInd:
.BashfulInd:
.QuirkyInd:
.NoNatureInd: db "@"