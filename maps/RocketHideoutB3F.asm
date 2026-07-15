RocketHideoutB3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 17,  2, ROCKET_HIDEOUT_B2F, 2
	warp_event 11, 14, ROCKET_HIDEOUT_B4F, 1

	def_coord_events

	def_bg_events
	bg_event 19, 13, BGEVENT_ITEM + FULL_HEAL, EVENT_ROCKET_HIDEOUT_B3F_HIDDEN_FULL_HEAL

	def_object_events
	object_event 18,  8, SPRITE_COSPLAYER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, RocketHideoutB3FCosplayerLyric, -1
	object_event  2, 18, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, RocketHideoutB3FCoolDudeDaric, -1
	itemball_event 12, 10, CARBOS, 1, EVENT_ROCKET_HIDEOUT_B3F_CARBOS
	itemball_event 18, 13, ELIXIR, 1, EVENT_ROCKET_HIDEOUT_B3F_ELIXIR

RocketHideoutB3FCosplayerLyric:
	generictrainer COSPLAYER, LYRIC, EVENT_BEAT_COSPLAYER_LYRIC, .SeenText, .BeatenText

	text "Anführer Sparks"
	line "Energie ist hoch!"

	para "Hoffentlich bist"
	line "du bereit für"
	cont "einen Schock!"
	done

.SeenText:
	text "Instinkt braucht"
	line "keine Berechnung."

	para "Wir schlagen nur"
	line "schnell und hart"
	cont "zu."
	done

.BeatenText:
	text "Kann nicht"
	line "mithalten!"
	done

RocketHideoutB3FCoolDudeDaric:
	generictrainer COOLTRAINERM, DARIC, EVENT_BEAT_COOL_DUDE_DARIC, .SeenText, .BeatenText

	text "Anführerin Blanche"
	line "erwartet nichts"
	para "weniger als volle"
	line "Einsatzbereitscha-"
	cont "ft!"
	done

.SeenText:
	text "Emotionen trüben"
	line "das Urteil."
	para "Mal sehen, ob dein"
	line "Fokus gut ist."
	done

.BeatenText:
	text "Mein Urteil war"
	line "falsch…"
	done
