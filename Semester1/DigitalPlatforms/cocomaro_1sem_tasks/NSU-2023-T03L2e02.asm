	asect 	0x00
	# WRITE YOUR CODE HERE

	ldi r0,s
cnbeg:
	inc r0
	ld r0,r1
	ldi r3,0
	cmp r1,r3
	bne cnbeg
	inc r0
	move r0,r3
	push r3
	ldi r0,s
begin:
	ldi r1,"a"
	ld r0,r2
	inc r0
	
	cmp r2,r1
	blo donothing
	ldi r1,"z"
	cmp r1,r2
	blo donothing
	ldi r1,-32
	add r1,r2
donothing:
	st r3,r2
	inc r3
	add r2,r2
	bz cont 
	br begin
cont:
	
	# at this point 'res' has the answer
	pop r3
	move r3,r0
	halt
inputs>
res:
s:		dc	"bIFe?U4O>^U:lAi",0 	# replace ... by some text for testing
	ds  	17      # reserve more space in case the string from tester is longer than ours
endinputs>
	end
