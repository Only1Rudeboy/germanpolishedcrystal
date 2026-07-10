ShamoutiHotelRestaurant_MapScriptHeader:
	def_scene_scripts
	scene_script ShamoutiHotelRestaurantMeetScene, SCENE_SHAMOUTIHOTELRESTAURANT_MEET
	scene_const SCENE_SHAMOUTIHOTELRESTAURANT_NOOP

	def_callbacks

	def_warp_events
	warp_event 16,  7, SHAMOUTI_HOTEL_1F, 4
	warp_event 17,  7, SHAMOUTI_HOTEL_1F, 4

	def_coord_events
	coord_event 16,  6, SCENE_SHAMOUTIHOTELRESTAURANT_NOOP, ShamoutiHotelRestaurantLeavingTrigger1
	coord_event 16,  7, SCENE_SHAMOUTIHOTELRESTAURANT_NOOP, ShamoutiHotelRestaurantLeavingTrigger2

	def_bg_events

	def_object_events
	object_event 16,  4, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, ShamoutiHotelRestaurantReceptionistText, -1

	object_const_def
	const SHAMOUTIHOTELRESTAURANT_RECEPTIONIST

ShamoutiHotelRestaurantMeetScene:
	sdefer ShamoutiHotelRestaurantChallengeScript
	end

ShamoutiHotelRestaurantChallengeScript:
	applyonemovement PLAYER, step_up
	opentext
	checkflag ENGINE_SHAMOUTI_RESTAURANT_CHALLENGE
	iftruefwd .AlreadyAte
	writetext .GreetingText
	special PlaceMoneyTopRight
	yesorno
	iffalsefwd .NeverMind
	checkmoney YOUR_MONEY, 5000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	setflag ENGINE_SHAMOUTI_RESTAURANT_CHALLENGE
	waitsfx
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, 5000
	special PlaceMoneyTopRight
	writetext ShamoutiHotelRestaurantReceptionistText
	waitbutton
	closetext
	applyonemovement PLAYER, step_left
	setscene SCENE_SHAMOUTIHOTELRESTAURANT_NOOP
	end

.AlreadyAte:
	writetext .AlreadyAteText
	sjump ShamoutiHotelRestaurantLeaveScript

.NeverMind:
	writetext .NeverMindText
	sjump ShamoutiHotelRestaurantLeaveScript

.NotEnoughMoney:
	writetext .NotEnoughMoneyText
	sjump ShamoutiHotelRestaurantLeaveScript

.GreetingText:
	text "Willkommen im"
	line "Oasis Restaurant."

	para "Hier kannst du"
	line "nicht nur essen,"

	para "sondern auch"
	line "#mon-Kämpfe"
	cont "bestreiten."

	para "Jeden Tag gibt es"
	line "ein neues Menü."

	para "Der Preis ist"
	line "¥5000. Möchtest du"
	cont "reinkommen?"
	done

.AlreadyAteText:
	text "Tut mir leid, du"
	line "warst heute schon"
	cont "hier."

	para "Komm morgen"
	line "wieder!"
	done

.NeverMindText:
	text "Verstehe. Schönen"
	line "Tag noch!"
	done

.NotEnoughMoneyText:
	text "Tut mir leid, du"
	line "hast nicht genug"
	cont "Geld."
	done

ShamoutiHotelRestaurantLeavingTrigger2:
	applyonemovement PLAYER, step_up
ShamoutiHotelRestaurantLeavingTrigger1:
	turnobject PLAYER, UP
	turnobject SHAMOUTIHOTELRESTAURANT_RECEPTIONIST, DOWN
	opentext
	writetext .LeavingText
	yesorno
	iffalsefwd .Staying
	writetext .GoodbyeText
	sjumpfwd ShamoutiHotelRestaurantLeaveScript

.Staying:
	writetext ShamoutiHotelRestaurantReceptionistText
	waitbutton
	closetext
	applyonemovement PLAYER, step_left
	end

.LeavingText:
	text "Willst du schon"
	line "gehen?"
	done

.GoodbyeText:
	text "Danke für deinen"
	line "Besuch."

	para "Komm morgen wieder"
	line "vorbei!"
	done

ShamoutiHotelRestaurantLeaveScript:
	waitbutton
	closetext
	applyonemovement PLAYER, step_down
	special FadeOutPalettes
	playsound SFX_ENTER_DOOR
	waitsfx
	warp SHAMOUTI_HOTEL_1F, 14, 0
	end

ShamoutiHotelRestaurantReceptionistText:
	text "Genieße ein Essen"
	line "und einen Kampf."
	done
