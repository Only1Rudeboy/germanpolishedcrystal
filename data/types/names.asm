TypeNames:
; entries correspond to types (see constants/type_constants.asm)
	table_width 1
	dr Normal
	dr Fighting
	dr Flying
	dr Poison
	dr Ground
	dr Rock
	dr Bug
	dr Ghost
	dr Steel
	assert_table_length SPECIAL_TYPES
	dr Fire
	dr Water
	dr Grass
	dr Electric
	dr Psychic
	dr Ice
	dr Dragon
	dr Dark
	dr Fairy
	dr UnknownType
	assert_table_length NUM_TYPES

EggGroupNames:
; entries correspond to egg groups (see constants/pokemon_data_constants.asm)
; placed here because several egg groups use the same string as a type
	table_width 1
	dr Monster
	dr Water1
	dr Bug
	dr Flying
	dr Field
	dr Fairy
	dr Grass
	dr Humanlike
	dr Water3
	dr Mineral
	dr Amorphous
	dr Water2
	dr Ditto
	dr Dragon
	dr Undiscovered
	assert_table_length NUM_EGG_GROUPS

Normal:      db "Normal@"
Fighting:    db "Kampf@"
Flying:      db "Flug@"
Poison:      db "Gift@"
Ground:      db "Boden@"
Rock:        db "Gestein@"
Bug:         db "Käfer@"
Ghost:       db "Geist@"
Steel:       db "Stahl@"
Fire:        db "Feuer@"
Water:       db "Wasser@"
Grass:       db "Pflanze@"
Electric:    db "Elektro@"
Psychic:     db "Psycho@"
Ice:         db "Eis@"
Dragon:      db "Drache@"
Dark:        db "Unlicht@"
Fairy:       db "Fee@"
UnknownType: db "???@"

Monster:      db "Monster@"
Field:        db "Feld@"
Humanlike:    db "Menschenähnlich@"
Mineral:      db "Mineral@"
Amorphous:    db "Amorph@"
Ditto:        db "Ditto@"
Undiscovered: db "Unbekannt@"
if !DEF(FAITHFUL)
Water1:       db "Amphibie@"
Water2:       db "Fisch@"
Water3:       db "Wirbellos@"
else
Water1:       db "Wasser 1@"
Water2:       db "Wasser 2@"
Water3:       db "Wasser 3@"
endc