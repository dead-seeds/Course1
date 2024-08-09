	asect 	0x00
	# WRITE YOUR CODE HERE

wasc:
	ds 1
cnt:
	ds 1

	ldi r2,sum
	push r2
	ldi r0,x
	ldi r1,y
cycle:
	ld r0,r2
	ld r1,r3
	inc r0
	inc r1
	push r1
	push r2
		ldi r1,wasc
		ld r1,r1
		add r1,r3
		ldi r2,0
		ldi r1,wasc
		st r1,r2
	pop r2
	pop r1
	add r2,r3
	bcc cont
	push r1
	push r2
		ldi r1,wasc
		ldi r2,1
		st r1,r2
	pop r2
	pop r1
	
	
cont:
	pop r2
	st r2,r3
	inc r2
	push r2
	push r1
	push r2
		ldi r1,cnt
		ld r1,r1
		inc r1
		ldi r2,cnt
		st r2,r1
		ldi r2,8
		cmp r1,r2
		bge ended
	pop r2
	pop r1
	br cycle 
ended:
	
	
	
	# at this point 'res' has the answer
	ldi   r0,sum
	halt
inputs>
x:	dc	0xef,0x76,0x76,0x10,0x34,0x15,0x4f,0xe0 # choose your data
y:	dc	0xd1,0x98,0x5c,0xf3,0x17,0xa7,0x03,0xc1 # choose your data
endinputs>
sum:	ds	8
	end
