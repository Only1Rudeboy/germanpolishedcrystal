ItemFinder:
	farcall CheckForHiddenItems
	jr c, .found_something
	ld hl, .Script_FoundNothingNearby
	jr z, .resume
	ld hl, .Script_FoundNothingAtAll
	jr .resume

.found_something
	ld [wCurMapScriptBank], a
	ld hl, .Script_FoundSomething

.resume
	call QueueScript
	ld a, $1
	ld [wItemEffectSucceeded], a
	ret

.ItemfinderEffect:
	ld a, [wCurMapScriptBank]
	and $f ; taxicab distance, 0-15
	inc a ; 1-16
	cp 9
	jr c, .dist_ok
	ld a, 9 ; cap, 1-9
.dist_ok
	srl a ; 0-4
	cpl
	add 5 + 1 ; 5-1
	ld c, a
.sfx_loop
	push bc
	ld de, SFX_SECOND_PART_OF_ITEMFINDER
	call WaitPlaySFX
	ld de, SFX_TRANSACTION
	call WaitPlaySFX
	pop bc
	dec c
	jr nz, .sfx_loop
	ld d, PLAYER
	ld a, [wCurMapScriptBank]
	and $f
	ldh [hScriptVar], a
	ld a, [wCurMapScriptBank]
	rrca
	rrca
	ld e, a
	farjp ApplyObjectFacing

.Script_FoundSomething:
	special UpdateTimePals
	callasm .ItemfinderEffect
	iffalse_jumpopenedtext .UnderfootText
	jumpthisopenedtext

	text "Ja! Der Detektor"
	line "reagiert!"
	done

.UnderfootText:
	text "Oh! Der Detektor"
	line "zittert stark!"
	done

.Script_FoundNothingNearby:
	special UpdateTimePals
	jumpthisopenedtext

	text "…Nö! Der Detektor"
	line "reagiert nicht."
	done

.Script_FoundNothingAtAll:
	special UpdateTimePals
	jumpthisopenedtext

	text "Nö! Hier ist nichts"
	line "versteckt."
	done
