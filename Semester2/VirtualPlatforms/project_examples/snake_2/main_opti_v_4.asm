	asect 0x00
#---------------------
#start
start:
	setsp 0xaf
	#generating an apple at the beginning
	jsr spawn_apple
	#move head
	jsr move_head
	#start sel reg to 1
	ldi r3, 0xfd
	ldi r2, 1
	st r3, r2
	#change screen to the main game screen
	ldi r3, 0xf9
	ldi r2, 1
	st r3, r2
#-----------------------
#         main
main:
#work with the head
	jsr move_head
#work with the tail
	jsr move_tail
#Go back to the start
	br main
##--------------------------------
#             functions
	move_head: #function to move the head
		#input direction
		ldi r2, 0xee
		ld r2, r2
		#save direction to the memory
		jsr load_direction_to_mem
		#move the coordinates of the head
		ldi r3, 0xfa
		st r3, r2
		#check if the apple is eaten
		if	
			#request to Logisim
			ldi r3, 0xef
			ld r3, r3
			tst r3
		is nz #if the apple is eaten
			jsr spawn_apple
			br move_head #Go back to the start
		else
			#collision check
			ldi r3, 0xff
			ldi r2, 1
			st r3, r2
			ldi r3, 0xff
			ldi r2, 0
			st r3, r2
		fi
		#paint the pixel with the new coordinates
		#start sel reg to 0
		ldi r3, 0xfd
		ldi r2, 0
		st r3, r2
		rts
	move_tail:
		#input direction
		jsr take_direction_from_mem
		#move the coordinates of the tail
		ldi r2, 0xfb
		st r2, r3
		#turn off the pixel with the current tail coordinates
		#start sel reg to 1
		ldi r3, 0xfd
		ldi r2, 1
		st r3, r2
		rts
	spawn_apple: #function for generating an apple
		#request to Logisim to generate new coordinates
		ldi r3, 0xfc
		ldi r2, 1
		st r3, r2
		ldi r3, 0xfc
		ldi r2, 0
		st r3, r2
		#paint the pixel with an apple
		#start sel reg to 2
		ldi r3, 0xfd
		ldi r2, 2
		st r3, r2
		rts
	load_direction_to_mem:
		#r2 - direction
		#save to the stack
		push r2
		#request an address in memory from the Logisim
		ldi r1, 0xe6
		ld r1, r1
		#save coordinates in a memory line
		#delete a direction from a cell
		ldi r3, 0xea
		ld r3, r3
		#invert
		not r3
		#and to delete old direction
		ld r1, r0
		and r3, r0
		#move direction to the correct place
		ldi r2, 0xec
		ld r2, r2
		#save in the data line
		or r2, r0
		#save to RAM
		st r1, r0
		#take from the stack
		pop r2
		rts
	take_direction_from_mem:
		#request an address in memory from the Logisim
		ldi r1, 0xe7
		ld r1, r1
		#take the direction from the data line
		ldi r3, 0xeb
		ld r3, r3
		#with and delete extra data in line
		ld r1, r0
		and r0, r3
		#load the data line to Logisim
		ldi r2, 0xfe
		st r2, r3 
		#load the direction for the Stail
		ldi r3, 0xed
		ld r3, r3
		rts
end
