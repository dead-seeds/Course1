asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------


	ldi r0,a
	ld r0,r0
	#for cycle
	ldi r1,9 
	ldi r2,0
	move r0,r3
for1:
	inc r2
	cmp r2,r1
	beq cont1
	add r0,r3
	br for1 
cont1:
	#end for
	ldi r1,b
	ld r1,r1
	add r1,r1
	add r1,r1
	sub r3,r1
	ldi r3,12
	add r1,r3
	ldi r1,res
	st r1,r3
	
# =================================
# LEAVE THIS PART OF THE FILE ALONE
# Do not change the next two instructions: they must be the last two
# instructions executed by your program.
    ldi r0, res  # Loads the address of your result into r0 for the robot
    halt         # Brings execution to a halt

# =================================
# DATA GOES BELOW
# We have set this up for you, but you will need to test your program by
# compiling and running it several times with different input data values
# (different bit-strings placed at addresses a and b)
# ---------------------------------------------------------------------

INPUTS>
a:  dc  2       # replace 0 by your choice of integer for testing
b:  dc  1       # replace 0 by your choice of integer for testing
ENDINPUTS>

res:	ds	1		# one byte reserved for the result
end

