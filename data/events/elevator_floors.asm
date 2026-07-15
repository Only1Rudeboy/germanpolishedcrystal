ElevatorFloorNames:
	table_width 1
	dr .B4F
	dr .B3F
	dr .B2F
	dr .B1F
	dr ._1F
	dr ._2F
	dr ._3F
	dr ._4F
	dr ._5F
	dr ._6F
	dr ._7F
	dr ._8F
	dr ._9F
	dr ._10F
	dr ._11F
	dr .Roof
	assert_table_length NUM_FLOORS

.B4F:  db "B4S@"
.B3F:  db "B3S@"
.B2F:  db "B2S@"
.B1F:  db "B1S@"
._1F:  db "1S@"
._2F:  db "2S@"
._3F:  db "3S@"
._4F:  db "4S@"
._5F:  db "5S@"
._6F:  db "6S@"
._7F:  db "7S@"
._8F:  db "8S@"
._9F:  db "9S@"
._10F: db "10S@"
._11F: db "11S@"
.Roof: db "Dach@"
