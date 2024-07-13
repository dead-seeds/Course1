asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------

	ldi r0,x
	ld r0,r0
	ldi r1,1
	move r1,r2
	and r0,r2
	bnz incn1
	br cont1
incn1:
	inc r3
cont1:
	shla r1
	
	move r1,r2
	and r0,r2
	bnz incn2
	br cont2
incn2:
	inc r3
cont2:
	shla r1
	
	move r1,r2
	and r0,r2
	bnz incn3
	br cont3
incn3:
	inc r3
cont3:
	shla r1

	move r1,r2
	and r0,r2
	bnz incn4
	br cont4
incn4:
	inc r3
cont4:
	shla r1
	
	move r1,r2
	and r0,r2
	bnz incn5
	br cont5
incn5:
	inc r3
cont5:
	shla r1
	
	move r1,r2
	and r0,r2
	bnz incn6
	br cont6
incn6:
	inc r3
cont6:
	shla r1
	
	move r1,r2
	and r0,r2
	bnz incn7
	br cont7
incn7:
	inc r3
cont7:
	shla r1
	move r1,r2
	and r0,r2
	bnz incn8
	br cont8
incn8:
	inc r3
cont8:
	
	ldi r0,1
	and r3,r0
	
	ldi r1,res
	st r1,r0
# =================================
# LEAVE THIS PART OF THE FILE ALONE
# Do not change the next two instructions: they must be the last two
# instructions executed by your program.
    ldi r0, res  # Loads the start address of your result into r0 for the robot
    halt           # Brings execution to a halt

# =================================
# DATA GOES BELOW
# We have set this up for you, but you will need to test your program by
# compiling and running it several times with different input data values
# (different bit-strings placed at addresses aLo, aHi, bLo and bHi)
# ---------------------------------------------------------------------

INPUTS>
x:     dc  0x9f    # replace 0 by your choice of bit-string for testing
ENDINPUTS>

res:  ds  1    # one byte reserved for the result
end

