	asect 	0x00
	# WRITE YOUR CODE HERE
	
	
	#for started, 8 times
	ldi r0,0
	ldi r1,7
f1s:
	push r0
	push r1
	
	ldi r3,array
	
	ldi r0,0
	ldi r1,8
	f2s:
		push r0
		push r1
		#body of for 2
	
		ld r3,r1
		inc r3
		ld r3,r2
		dec r3
		
		
		tst r1
		blt donothing
		br cond_1_true
		cond_1_true:
			tst r2
			blt cond_2_true
			br donothing
			cond_2_true:
				st r3,r2
				inc r3
				st r3,r1
				dec r3
		
		
		donothing:
		inc r3
		
		#end body of for 2
		pop r1
		pop r0
		inc r0
		cmp r0,r1
		bge f2e
		br f2s
	f2e:
	#body of for 1
	
	inc r3
	
	#end body of for 1
	pop r1
	pop r0
	inc r0
	cmp r0,r1
	bge f1e
	br f1s
f1e:
	#for ended
	
	
	
	
	# at this point 'res' has the answer
	ldi   r0,array
	halt
inputs>
array:	dc	 5,-1,-3,7,4,2,2,-8 # choose some numbers for testing
endinputs>
res:	ds	8
	end
