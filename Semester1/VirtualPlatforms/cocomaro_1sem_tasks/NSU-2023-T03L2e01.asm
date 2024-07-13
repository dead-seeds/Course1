	asect	0x00
	# WRITE YOUR CODE HERE
	
	ldi r0,s
	ldi r1,n
	ld r1,r1
begin:
	cmp r2,r1
	beq this
	push r1
	push r2
	inc r0
	ld r0,r2
	ldi r1,0
	cmp r2,r1
	beq nonum
	
	pop r2
	pop r1
	
	inc r2
	br begin
this:
	ld r0,r0
	ldi r2,res
	st r2,r0
	br cont
nonum:
	ldi r2,res
	ldi r1,"?"
	st r2,r1
cont:
	
	# at this point 'res' has the answer
	ldi   r0,res
	halt
inputs>

n:	dc	4 		# replace 0 by your choice of n for testing
s:	dc	"fddi",0 	# replace ... by some text for testing
	ds	18 	# reserve more space in case the string from tester is longer than ours
endinputs>
res:	ds	1
	end
