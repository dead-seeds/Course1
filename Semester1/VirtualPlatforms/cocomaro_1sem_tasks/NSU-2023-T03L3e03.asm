	asect	0x00
	# WRITE YOUR CODE HERE
	
	pushall
	ldi r0,s
	ld r0,r0
f1begin:
		ldi r1,p
		ld r1,r1
		
		pushall
		push r0
	f2begin:
		ld r1,r3
		ld r0,r2
		inc r0
		cmp r2,r3
		bne f2end
			inc r1
			ld r1,r3
			ldi r2,0
			cmp r3,r2
		beq finish
		br f2begin
	f2end:
		pop r0
		popall
	ld r0,r1
	inc r0
	ldi r2,0
	cmp r1,r2
	bne f1begin
	popall
	
wrong:
	# error handling actions here
	ldi r0,res
	ldi r1,-1
	st r0,r1
	br wrend
	
	
finish:
	# r0 contains string shift. Need r0 - s
	pop r0
	dec r0
	dec r0
	ldi r1,s
	sub r0,r1
	ldi r0,res
	st r0,r1

wrend:
	# at this point 'res' has the answer
	ldi   r0,res
	halt
inputs>
s:		dc _s 	# do NOT use labels _s and _p above!
p:		dc _p	# do NOT use labels _s and _p above!

_s:	dc	"cats likemilk",0 # replace that by some string for testing
_p:	dc	"liky",0			   # replace that by some pattern for testing

	ds	40     # reserve more space in case the string from tester is longer than ours
endinputs>
res:	ds	1
	end
