bdos 	equ 0005h
cr 	equ 0dh
lf	equ 0ah
eos	equ	00

	org	100h

	ld hl,mesg
loop:
	ld a,(hl)
	or a
	ret z
	push hl
	call chrout
	pop hl
	inc hl
	jp loop

chrout:
	ld c,2
	ld e,a
	call bdos
	ret

mesg:	
	defb cr,lf
	defm "Good Morning"
	defb cr,lf,eos

	end
