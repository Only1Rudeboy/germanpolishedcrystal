; siehe engine/naming_screen.asm
; Umlaute nutzen die in constants/charmap.asm umbelegten Zeichen.
; Umlaut-Glyphen: gfx/font/*.png (tools/draw_umlaut_glyphs.py)

NameInputLower:
	table_width 1
	rawchar "abcdefghi"
	rawchar "jklmnopqr"
	rawchar "s"
	rawchar "tuvwxyz-"
	rawchar "äöüß'"
	rawchar "l"
	rawchar "0  "
	rawchar "123456789"
	assert_table_length 9 * 5

NameInputUpper:
	table_width 1
	rawchar "ABCDEFGHI"
	rawchar "JKLMNOPQR"
	rawchar "STUVWXYZ "
	rawchar "ÄÜ¥/<PK><MN>★♥♪"
	rawchar "?!♂♀.,:&%"
	assert_table_length 9 * 5

MailEntry_Uppercase:
	table_width 1
	rawchar "ABCDEFGHIJ"
	rawchar "KLMNOPQRST"
	rawchar "UVWXYZ?!…:"
	rawchar "1234567890"
	rawchar "<PK><MN><PO><KE>&♂♀¥×/"
	assert_table_length 10 * 5

MailEntry_Lowercase:
	table_width 1
	rawchar "abcdefghij"
	rawchar "klmnopqr"
	rawchar "s"
	rawchar "t"
	rawchar "uvwxyz -.,"
	rawchar "äöüß()    "
	rawchar "'''%↑↓№★♥♪"
	assert_table_length 10 * 5

; German QWERTZ (Y/Z swapped vs US QWERTY)
NameInputLowerQwerty:
	table_width 1
	rawchar "qwertzuio"
	rawchar "asdfghjkl"
	rawchar "yxcvbnmp-"
	rawchar "äöüß'"
	rawchar "l"
	rawchar "0  "
	rawchar "123456789"
	assert_table_length 9 * 5

NameInputUpperQwerty:
	table_width 1
	rawchar "QWERTZUIO"
	rawchar "ASDFGHJKL"
	rawchar "YXCVBNMP "
	rawchar "ÄÜ¥/<PK><MN>★♥♪"
	rawchar "?!♂♀.,:&%"
	assert_table_length 9 * 5

MailEntryQwerty_Uppercase:
	table_width 1
	rawchar "QWERTZUIOP"
	rawchar "ASDFGHJKL:"
	rawchar "YXCVBNM?!…"
	rawchar "1234567890"
	rawchar "<PK><MN><PO><KE>&♂♀¥×/"
	assert_table_length 10 * 5

MailEntryQwerty_Lowercase:
	table_width 1
	rawchar "qwertzuiop"
	rawchar "asdfghjkl-"
	rawchar "yxcvbnm,. "
	rawchar "äöüß()    "
	rawchar "'''%↑↓№★♥♪"
	assert_table_length 10 * 5
