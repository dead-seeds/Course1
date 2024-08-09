asect	0x00
	# WRITE YOUR CODE HERE

	
	ldi r0,S
	ldi r1,"}"
begin:   #count length
	ld r0,r2
	inc r0
	cmp r2,r1
	beq cont
	inc r3
	br begin
cont:


	ldi r2,S
	
	#for r3 times
	#every chetniy call function 
	#in r1 place cycle count
	move r3,r1
	ldi r3,0
	#for started
	ldi r0,0
	f2s:
		push r0
		push r1
		#body of for 2
		inc r3
		push r3
		
		ldi r1,1
		and r3,r1
		bz call
		br nocall
		call:
			
			ld r2,r1
			#push r3
			push r2
			push r1
			br func_wrlet
			call_wrlet:
			pop r2
			#pop r3
			push r3
            br endnocall
		nocall:
			
            ldi r1,","
			push r3
			ld r2,r3
			cmp r3,r1
			beq endnocall
			ldi r1,"{"
			cmp r3,r1
			beq endnocall
			br kapec
        endnocall:
		pop r3
		inc r2
		pop r3
		#end body of for 2
		pop r1
		pop r0
		inc r0
		cmp r0,r1
		bge f2e  
		br f2s
	f2e:	
	
	
	br progend

#functions block
func_wrlet:
	pop r0 #parameter
	
	ldi r2,"y"
	cmp r0,r2
	bne ycont
	ldi r2,result
	inc r2
	inc r2
	inc r2
	ldi r1,0b10000000
	st r2,r1
	br fend
ycont:
	ldi r2,"z"
	cmp r0,r2
	bne zcont
	ldi r2,result
	inc r2
	inc r2
	inc r2
	ldi r1,0b01000000
	st r2,r1
zcont:	
	ldi r2,S
	ldi r1,"h"
	cmp r1,r0
	blo ai_cont
	ldi r1,"a"
	cmp r0,r1
	blo ai_cont
	sub r0,r1
	ldi r0,0
	ldi r2,0b10000000
ai_beg:
	inc r0
	cmp r1,r0
	blo ai_cycont
	move r2,r3 #strange place
	shr r2
	br ai_beg
ai_cycont:
	ldi r1,result
	ld r1,r3
	or r3,r2
	st r1,r2
	br fend
ai_cont:

	ldi r1,"p"
	cmp r1,r0
	blo jp_cont
	ldi r1,"i"
	cmp r0,r1
	blo jp_cont
	sub r0,r1
	ldi r0,0
	ldi r2,0b10000000
jp_beg:
	inc r0
	cmp r1,r0
	blo jp_cycont
	move r2,r3 #strange place
	shr r2
	br jp_beg
jp_cycont:
	ldi r1,result
	inc r1
	ld r1,r3
	or r3,r2
	st r1,r2
	br fend
	
	
jp_cont:
	ldi r1,"x"
	cmp r1,r0
	blo qx_cont
	ldi r1,"q"
	cmp r0,r1
	blo qx_cont
	sub r0,r1
	ldi r0,0
	ldi r2,0b10000000
qx_beg:
	inc r0
	cmp r1,r0
	blo qx_cycont
	move r2,r3 #strange place
	shr r2
	br qx_beg
qx_cycont:
	ldi r1,result
	inc r1
	inc r1
	ld r1,r3
	or r3,r2
	st r1,r2
	br fend
qx_cont:
	
	
	
	
fend:
	br call_wrlet
	
	
	
kapec:
	ldi r1,result
	ldi r3,0
	ldi r2,0x3f
	st r1,r3
	inc r1
	st r1,r3
	inc r1
	st r1,r3
	inc r1
	st r1,r2
	
	
	#0x28,0x18,0x63,0x80
	
progend:

		

        # at this point 'result' has the answer
        ldi   r0,result
        halt
inputs>
S:	 dc       "",00		# replace by your choice of S for testing
	ds	34	# reserve more space in case the string from tester is longer than ours
endinputs>
result: ds	4
        end