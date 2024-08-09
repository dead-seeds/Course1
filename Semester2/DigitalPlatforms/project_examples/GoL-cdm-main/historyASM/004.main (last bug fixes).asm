asect 0
# Your program starts from 0x00 address

start:
    
# # # setPS 0x80 # enable interrupts
# #push r3
#ldi r3, 0x80
#osix 0x00
# #pop r3


# E--C PSST
# 4003 2110

########################################################
init:
	setsp 0xF0 # reserve 16 bytes 
	
	# i = 1, j = 1:
	ldi r1, 0x00
	ldi r2, 0x01
	
	ldi r0, 0xFC
	st r0, r1 # clear HIGH-byte i-cursor
	inc r0 # ldi r0, 0xFD
	st r0, r2 # set LOW-byte i-cursor equal 1
	ldi r3, 0xF5
	st r3, r2 # set LOW-byte i-cursor in memory equal 1
		
	# ldi r0, 0xFE
	inc r0 # r0 was equal 0xFD and become 0xFE
	st r0, r1 # clear HIGH-byte j-cursor
	inc r0 # ldi r0, 0xFF
	st r0, r2 # set LOW-byte j-cursor equal 1
	ldi r3, 0xF7
	st r3, r2 # set LOW-byte j-cursor in memory equal 1
	
	
	# state (should be equal 0b0000_1000 in start): 
	# 	T torus  = 0
	# 	S state  = 00 (by rules)
	#	P pause  = 1
	# 	C clear  = 0
	#	- nothng = 00
	# 	E enable = 0 (if the field is empty, why should it be updated?)
	ldi r0, 0xFA
	#         E--CPSST
	ldi r1, 0b00001000
	st r0, r1 # 'store' STATE to matrix
	ldi r0, 0xF2
	st r0, r1 # store STATE in memory
	
########################################################

game:	
	while # True
		# like tst r3, but clear r3 too
		clr r3 
	stays z # r3 == 0? 
		# read KeyBoard to r1 and make new state
		ldi r2, 0xF8 # KeyBoard address
		ld r2, r1
		#        PCSS_URDL
		# r1 = 0b0000_0000
		if 	
			tst r1
		is nz # if (KeyBoard > 0)			
			# turn off matrix update
			ldi r3, 0xF2 # }
			ld  r3, r0 	 # } r3 = STATE from memory
			
			ldi r2, 0b01111111 # } r1 = STATE where
			and r0, r2 		   # } enabled = 0 (false)
			
			st r3, r2 # store STATE to memory
			ldi r0, 0xFA
			st r0, r2 # 'store' STATE to matrix
			
			
			if
				ldi r0, 0x0f
				cmp r1, r0
			is ls # 0 < KB-in <= 15 
				if 
					# it is enough to do cmp 1 time — comment
					# cmp r1, r0
				is eq # r1 == 15, i.e. torus keyDowned
					#ldi r3, 0xF2# } 
					ld  r3, r1   # } r1 = load STATE from memory
					
					ldi r0, 0b00000001  # } invert 'torus' value in STATE
					xor r0, r1 			# } and store to R1
					
					st r3, r1 # store STATE to memory
					
					ldi r3, 0xFA # } 'store' STATE to matrix
					st r3, r1    # } 
					#jsr torus
					
				else # 0 < KB-in < 15, i.e. UP, RIGHT, DOWN or LEFT
					if
						ldi r0, 0x04
						cmp r1, r0
					is ge # if UP or RIGHT
						if
							# it is enough to do cmp 1 time — comment
							# cmp r1, r0
						is eq # KB-in == 4, i.e. == RIGHT
							ldi r0, 0xF6 # } store HIGH-byte of J in memory to r0 
							ldi r1, 0xFF # } store LOW-byte  of J in matrix to r1
							jsr right # move the cursor 1 column righter
						else # KB-in == 8, i.e. == UP
							ldi r0, 0xF4 # } store HIGH-byte of I in memory to r0 
							ldi r1, 0xFD							 # } store LOW-byte  of I in matrix to r1
							jsr up # move the cursor 1 line higher
						fi
					else # if DOWN or RIGHT
						if 
							ldi r0, 0x02
							cmp r1, r0
						is eq # KB-in == 2, i.e. == DOWN
							ldi r0, 0xF5 # } store LOW-byte  of I in memory to r0 
							ldi r1, 0xFC # } store HIGH-byte of I in matrix to r1
							jsr down # move the cursor 1 line lower
						else # KB-in == 1, i.e. == LEFT
							ldi r0, 0xF7 # } store LOW-byte  of J in memory to r0 
							ldi r1, 0xFE # } store HIGH-byte of J in matrix to r1
							jsr left # move the cursor 1 column lefter
						fi
						
					fi # end if 0 < KB-in < 15 (if arrows)
							
				fi	# end if KB-in == 15
				
			else # 16 <= KB-in <= 255
				if
					ldi r0, 64
					cmp r1, r0
				is hs # 64 <= KB-in <= 255, i.e. == CLEAR or PAUSE
					if
						# it is enough to do cmp 1 time — comment
						# cmp r1, r0
					is eq # KB-in == 64, i.e. == CLEAR
							ldi r0, 0xF2 # }
							ld r0, r0	 # } r0 = STATE
							
							ldi r1, 0b00010000
							
							or r0, r1 # r1 = STATE, but clear = 1
							ldi r3, 0xFA
							
						st r3, r1 # 'store' new STATE, where clear = 1
						# matrix has a little time to clear
						st r3, r0 # 'store' old STATE, where clear = 0
					else # KB-in == 128, i.e. == PAUSE
						#ldi r3, 0xF2 # }
						ld r3, r0	 # } r0 = STATE from memory
						
						ldi r1, 0b00001000
						xor r1, r0 # r0 = new STATE, where pause was inverted
						
						st r3, r0 # store new STATE to memory
						ldi r1, 0xFA
						st r1, r0 # 'store' new STATE to matrix 
					fi
					
				else # 16 <= KB-in < 63
					if
						ldi r0, 32 # 0b0010_0000
						cmp r1, r0
					is ge # KB-in == 32 or 48, i.e. SET0 or SET1
						if 
							# it is enough to do cmp 1 time — comment
							# cmp r1, r0
						is eq # KB-in == 32 (0b0010_0000), i.e. SET0
							ldi r3, 0b00000100 # state = 10
							jsr set0
						else # KB-in == 48 (0b0011_0000), i.e. SET1
							ldi r3, 0b00000110 # state = 11
							jsr set1
						fi
					else # KB-in == 16 (0b0001_0000), i.e. == INVERT
						ldi r3, 0b00000010 # state = 01
						jsr setInv
					fi
					
				fi # end if 16 <= KB-in <= 255
				
			fi # end if 0 < KB-in <= 15
			
			
			# turn on matrix update
			ldi r0, 0xF2 # }
			ld  r0, r3 	 # } load STATE from memory
			
			ldi r1, 0b10000000 # } r1 = STATE where
			or r3, r1 		   # } enabled = 1 (true)
			
			st r0, r1 # store STATE to memory
			ldi r0, 0xFA
			st r0, r1 # 'store' STATE to matrix
		fi # end if KB-in > 0
		
	wend
halt


up: # shla i
right: # shla j

	# input:
	# r0 - HIGH-byte address in memory
	# r1 - LOW-byte  adrress in matrix
	
	ld r0, r3 # r3 = HIGH-byte from memory
	if
		tst r3
	is mi # if (r3 == 0b1000_0000); if can't move the cursor up/right
		rts # go back
	fi
	
	inc r0
	ld r0, r2 # r2 = LOW-byte of I if up, of J if right
	if
		cmp r3, r2
	is hi # if HIGH-byte > LOW-byte (unsigned)
		shla r3 # I can't do shla 1000_0000 because rts worked
		
	else  # if HIGH-byte < LOW-byte
		shla r2
		addc r3, r3 # r1 = 0+0 + C-bit (if r2 was 0b1000_0000, it become 0x00 and r3 will equal 0x01)
	fi
	
	st r0, r2 # store LOW-byte to memory
	dec r0 # r1 is HIGH-byte address in memory now
	st r0, r3 # 'store' HIGH-byte to memory
	
	st r1, r2 # store LOW-byte to matrix
	dec r1 # r0 is HIGH-byte address in matrix now
	st r1, r3 # 'store' HIGH-byte to matrix 
	
	rts # go back
	
	

down: # shr i
left: # shr j

	# input:
	# r0 - LOW-byte  address in memory
	# r1 - HIGH-byte adrress in matrix
	
	ld r0, r2 # r2 = LOW-byte of I if down, of J if left
	if
		ldi r3, 0x01
		cmp r2, r3
	is eq # if (cursor == 0x0001), i.e. can't move the cursor down/left
		rts # go back
	fi
	
	dec r0
	ld r0, r3 # r3 = HIGH-byte of I if down, of J if left
	if
		cmp r3, r2
	is hi # if HIGH-byte > LOW-byte (unsigned)
		if
			cmp r2, r3 # if the HIGH byte > LOW byte Carry bit is set, but it must be clear. cmp r2,r3 makes it clear
			shr r3 
		is z # if HIGH-byte was 0x0001 and became 0x00
			ldi r2, 0b10000000
		fi
		
	else  # if HIGH-byte < LOW-byte (Carry bit is clear. It's fine)
		shr r2 # I can't do shr 0000_0001 because rts worked
	fi
	
	st r0, r3 # store HIGH-byte to memory
	inc r0 # r0 is LOW-byte address in memory now
	st r0, r2 # store LOW-byte to memory
	
	st r1, r3 # 'store' HIGH-byte to matrix
	inc r1 # r1 is LOW-byte address in matrix now 
	st r1, r2 # 'store' LOW-byte to matrix 
	
	rts # go back
	
	

set0:
set1:
setInv:
	# input:
	# r3 is state (01, 10 or 11)
	
	ldi r2, 0xF2
	ld r2, r0 # r0 = STATE from memory
	
	ldi r1, 0b11111001 # state's bits = 0
	and r0, r1 # r0 = STATE where state = 00
	or r3, r1  # r0 = STATE where state = new state
	
	ldi r2, 0xFA
	st r2, r1 # 'store' STATE to matrix
	st r2, r0 # 'store' old STATE to matrix
	
	rts # go back


end.