asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------

	ldi r0,a
	ld r0,r0
	ldi r1,0b00001111
	and r0,r1
	ldi r2,10
	cmp r1,r2
	blo nums
	br chrs
nums:
	ldi r3,"0"
	add r1,r3
	br cont
chrs:
	ldi r3,10
	ldi r2,"A"
	sub r2,r3
	add r1,r3
	br cont
cont:
	
	ldi r1,res
	inc r1
	st r1,r3
	
	shra r0
	shra r0
	shra r0
	shra r0
	ldi r1,0b00001111
	and r0,r1
	ldi r2,10
	cmp r1,r2
	blo nums2
	br chrs2
nums2:
	ldi r3,"0"
	add r1,r3
	br cont2
chrs2:
	ldi r3,10
	ldi r2,"A"
	sub r2,r3
	add r1,r3
	br cont2
cont2:

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
# (different bit-strings placed at address a)
# ---------------------------------------------------------------------

INPUTS>
a:    dc  0x54   # The output for this bit-string should be "E7"
ENDINPUTS>

res:  ds 2             # Two bytes reserved for the result
end


