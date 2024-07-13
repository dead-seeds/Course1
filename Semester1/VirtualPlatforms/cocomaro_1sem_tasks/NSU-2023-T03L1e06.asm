asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------


	ldi r2,content
	
	ldi r1,length
	ld r1,r1
	ldi r0,0
	f2s:
		push r0
		push r1
		#body of for 2
		
		ld r2,r3
		tst r3
		bz adzer
		blt adneg
		br adpos
		adneg:
			ldi r0,neg
			ld r0,r1
			inc r1
			st r0,r1
			br cont
		adzer:
			ldi r0,zer
			ld r0,r1
			inc r1
			st r0,r1
			br cont	
		adpos:
			ldi r0,pos
			ld r0,r1
			inc r1
			st r0,r1
			br cont
		cont:
		inc r2
			
		#end body of for 2
		pop r1
		pop r0
		inc r0
		cmp r0,r1
		bge f2e
		br f2s
	f2e:

# =================================
# LEAVE THIS PART OF THE FILE ALONE
# Do not change the next two instructions: they must be the last two
# instructions executed by your program.
    ldi r0, pos  # Loads the start address of your result into r0 for the robot
    halt         # Brings execution to a halt

# =================================
# DATA GOES BELOW
# We have set this up for you, but you will need to test your program by
# compiling and running it several times with different input data values
# (different arrays of numbers)
# ---------------------------------------------------------------------

INPUTS>
length:  dc 10          # the length of the array (between 1 and 10)
content: dc 2, 0, -3, 4, -9, 0, 7, 88, -92, 18
ENDINPUTS>
pos: ds 1 # 1 byte each for the three result values
neg: ds 1
zer: ds 1
end

