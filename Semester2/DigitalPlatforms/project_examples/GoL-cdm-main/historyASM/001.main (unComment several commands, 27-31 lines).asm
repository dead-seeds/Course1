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
	setsp 0xE0 # reserve 32 bytes 
	
	# i = 1, j = 1:
	ldi r1, 0x00
	ldi r0, 0xF8
	st r0, r1 # clear high byte i-cursor
	ldi r0, 0xFC
	st r0, r1 # clear high byte j-cursor
	
	ldi r1, 0x01
	ldi r0, 0xF9
	st r0, r1 # set low byte i-cursor equal 1
	ldi r0, 0xFD
	st r0, r1 # set low byte j-cursor equal 1
	
	
	# state (should be equal 0b0000_1000 in start): 
	# 	T torus  = 0
	# 	S state  = 00 (by rules)
	#	P pause  = 1
	# 	C clear  = 0
	#	- nothng = 00
	# 	E enable = 0 (if the field is empty, why should it be updated?)
	ldi r0, 0xF4
	#         E--CPSST
	ldi r1, 0b00001000
	st r0, r1
	ldi r0, 0xE4
	st r0, r1 # copy state in memory
	
########################################################

game:
	while # True
		# like tst r3, but clear r3 too
		clr r3 
	stays z # r3 == 0? 
		# read KeyBoard to r1 and make new state
		ldi r2, 0xF0 # using for read KeyBoard
		ld r2, r1
		#        PCSS_URDL
		# r1 = 0b0000_0000
		if 	
			tst r1
		is nz # if (KeyBoard > 0)
			# turn off matrix update
			ldi r0, 0xE4 # }
			ld  r0, r0 	 # } load STATE from memory
			
			ldi r1, 0b01111111 # } r1 = STATE where
			and r0, r1 		   # } enabled = 0 (false)
			
			
			if
				ldi r0, 0x0F
				cmp r1, r0
			is le # 0 < KB-in <= 15 
				if 
					cmp r1, r0
				is eq # r1 == 15, i.e. torus keyDowned
					jsr torus
					
				else # 0 < KB-in < 15, i.e. UP, RIGHT, DOWN or LEFT
					if
						ldi r0, 0x04
						cmp r1, r0
					is ge # if UP or RIGHT
						if
							cmp r1, r0
						is eq # KB-in == 4, i.e. == RIGHT
							ldi r2, 0xFD # } store J to r2 and r3 
							ldi r3, 0xFC # }
							jsr right # move the cursor 1 column righter
						else # KB-in == 8, i.e. == UP
							ldi r2, 0xF9 # } store I to r2 and r3 
							ldi r3, 0xF8 # }
							jsr up # move the cursor 1 line higher
						fi
					else # if DOWN or RIGHT
						if 
							ldi r0, 0x02
							cmp r1, r0
						is eq # KB-in == 2, i.e. == DOWN
							ldi r2, 0xF9 # } store I to r2 and r3 
							ldi r3, 0xF8 # }
							jsr down # move the cursor 1 line lower
						else # KB-in == 1, i.e. == LEFT
							ldi r2, 0xFD # } store J to r2 and r3 
							ldi r3, 0xFC # }
							jsr left # move the cursor 1 column lefter
						fi
						
					fi # end if 0 < KB-in < 15 (if arrows)
							
				fi	# end if KB-in == 15
				
			else # 16 <= KB-in <= 255
				if
					ldi r0, 0b00000010
					cmp r1, r0
				is ge # 64 <= KB-in <= 255, i.e. == CLEAR or PAUSE
					if
						cmp r1, r0
					is eq # KB-in == 64, i.e. == CLEAR
						jsr clear
					else # KB-in == 128, i.e. == PAUSE
						jsr pause
					fi
					
				else # 16 <= KB-in < 63
					if
						ldi r0, 0b00100000 # 32
						cmp r1, r0
					is ge # KB-in == 32 or 33, i.e. SET0 or SET1
						if 
							cmp r1, r0
						is eq # KB-in == 32, i.e. SET0
							ldi r2, 0b00000100 # state = 10
							jsr set0
						else # KB-in == 33, i.e. SET1
							ldi r2, 0b00000110 # state = 11
							jsr set1
						fi
					else # KB-in == 16, i.e. == INVERT
						ldi r2, 0b00000010 # state = 01
						jsr setInv
					fi
					
				fi # end if 16 <= KB-in <= 255
				
			fi # end if 0 < KB-in <= 15
			
			
			# turn on matrix update
			ldi r0, 0xE4 # }
			ld  r0, r0 	 # } load STATE from memory
			
			ldi r1, 0b10000000 # } r1 = STATE where
			or r0, r1 		   # } enabled = 1 (true)
		fi # end if KB-in > 0
		
	wend
	
halt


# you can use r2 and don't clear this

# never mind: 
#### FOR PROGRAMERS:
#### DON'T USE r2
####   OR do: "ldi r2, 0xF0"
#### I don't want clear r2 every iteration
#### 
#### you can use r3 because I use clr r3 every iteration instead of tst r3


# DONE
torus:
	ldi r3, 0xE4 # } r1 = load STATE from memory
	ld  r3, r1   # } 
	
	ldi r0, 0b00000001  # } invert 'torus' value in state
	xor r0, r1 			# } and store to R1
	
	st r3, r1 # store STATE to memory
	
	ldi r3, 0xF4 # } 'store' STATE to matrix
	st r3, r1    # } 
	
	rts # go back


# DONE
up: # shla i
right: # shra j
	#ldi r1, 0xF8 # } HIGH-byte
	#ld r1, r1	 # } I
	
	ld r3, r1 # I if up, J if right
	
	# if
		# ldi r0, 0b10000000
		# cmp r1, r0
	# is eq
	if
		tst r1
	is ne # if can't move the cursor up
		rts # go back
	fi
	
	
	#ldi r0, 0xF9 # } LOW-byte
	#ld r0, r0	 # } I
	
	ld r2, r0 # I if up, J if right
	
	if
		cmp r1, r0
	is gt # if HIGH-byte > LOW-byte
		shla r1 # I can't do shla 1000_0000 because rts worked
		
	else  # if HIGH-byte < LOW-byte
		shla r0
		addc r1, r1 # r1 = 0+0 + C-bit
	fi
	
	rts # go back


# #DONE
#right: # shra j 
#	ldi r1, 0xFC # } HIGH-byte
#	ld r1, r1	 # } J
#	
#	# if
#		# ldi r0, 0b10000000
#		# cmp r1, r0
#	# is eq
#	if
#		tst r1
#	is ne # if can't move the cursor right
#		rts # go back
#	fi
#	
#	
#	ldi r0, 0xFD # } LOW-byte
#	ld r0, r0	 # } J
#	if
#		cmp r1, r0
#	is gt # if HIGH-byte > LOW-byte
#		shla r1 # I can't do shla 1000_0000 because rts worked
#		
#	else  # if HIGH-byte < LOW-byte
#		shla r0
#		addc r1, r1 # r1 = 0+0 + C-bit
#	fi
#	
#	rts # go back


# DONE
down: # shra i
left: # shr j
	#ldi r1, 0xF9 # } LOW-byte
	#ld r0, r0	 # } I
	
	ld r2, r0 # I if down, J if left
	
	if
		ldi r1, 0x01
		cmp r0, r1
	is eq # if can't move the cursor down
		rts # go back
	fi
	
	
	#ldi r1, 0xF8 # } HIGH-byte
	#ld r1, r1	 # } I
	
	ld r3, r1 # I if down, J if left
	
	if
		cmp r1, r0
	is gt # if HIGH-byte > LOW-byte
		if
			shr r1
		is z # if HIGH-byte was 0x01 and became 0x00
			 ldi r0, 0b10000000
		fi
		
	else  # if HIGH-byte < LOW-byte
		shr r0 # I can't do shr 0000_0001 because rts worked
	fi
	
	rts # go back
	
	
	
#left: #shr j 
#	ldi r0, 0xFD # } LOW-byte
#	ld r0, r0	 # } J
#	
#	if
#		ldi r1, 0x01
#		cmp r0, r1
#	is eq # if can't move the cursor down
#		rts # go back
#	fi
#	
#	
#	ldi r1, 0xFC # } HIGH-byte
#	ld r1, r1	 # } J
#	
#	if
#		cmp r1, r0
#	is gt # if HIGH-byte > LOW-byte
#		if
#			shr r1
#		is z # if HIGH-byte was 0x01 and became 0x00
#			 ldi r0, 0b10000000
#		fi
#		
#	else  # if HIGH-byte < LOW-byte
#		shr r0 # I can't do shr 0000_0001 because rts worked
#	fi
#	
#	rts # go back
	

clear:
	ldi r3, 0xE4 # }
	ld r3, r0	 # } r0 = STATE
	
	ldi r1, 0b00010000
	
	or r0, r1 # r1 = STATE, but clear = 1
	ldi r3, 0xF4
	st r3, r1 # 'store' new STATE, where clear = 1
	
	# matrix has a little time to clear
	
	st r3, r0 # 'store' old STATE, where clear = 0
	
	rts # go back

pause:
	ldi r3, 0xE4 # }
	ld r3, r0	 # } r0 = STATE
	
	ldi r1, 0b00001000
	xor r1, r0 # r0 = new STATE, where pause was inverted
	
	st r3, r0 # store new STATE to memory
	ldi r3, 0xF4
	st r3, r0 # 'store' new STATE to matrix 
	
	rts # go back

set0:
set1:
setInv:
	# r3 is state (01, 10 or 11)
	ldi r3, 0xE4
	ld r3, r0
	
	ldi r1, 0b11111001 # state's bits = 0
	and r1, r0 # r0 = STATE where state = 00
	or r3, r0  # r0 = STATE where state = new state
	
	st r3, r0
	ldi r3, 0xF4
	st r3, r0
	
	rts # go back



end.