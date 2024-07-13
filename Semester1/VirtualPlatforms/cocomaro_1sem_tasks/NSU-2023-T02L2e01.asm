asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------

	ldi r1,x
	ld r1,r1
	ldi r0,0
	add r1,r0
	bz zero
	blt negt
	br post 
zero:
	ldi r1,ans
	ldi r2,99
	st r1,r2
	br cont
negt:
	ldi r2,1
	and r1,r2
	bz negchet
	br negncht
post:
	ldi r2,1
	and r1,r2
	bz poschet
	br posncht
negchet:
	ldi r1,ans
	ldi r2,-2
	st r1,r2
	br cont
negncht:
	ldi r1,ans
	ldi r2,-1
	st r1,r2
	br cont
poschet:
	ldi r1,ans
	ldi r2,2
	st r1,r2
	br cont
posncht:
	ldi r1,ans
	ldi r2,1
	st r1,r2
	br cont
cont:

# =================================
# LEAVE THIS PART OF THE FILE ALONE
# Do not change the next two instructions: they must be the last two
# instructions executed by your program.
    ldi r0, ans  # Loads the address of your result into r0 for the robot
    halt         # Brings execution to a halt

# =================================
# DATA GOES BELOW
# We have set this up for you, but you will need to test your program by
# compiling and running it several times with different input data values
# (different bit-strings placed at address x)
# ---------------------------------------------------------------------

INPUTS>
x:    dc  0   # replace -18 by your choice of integers for testing
ENDINPUTS>

ans:  ds 1      # one byte reserved for the result
end


