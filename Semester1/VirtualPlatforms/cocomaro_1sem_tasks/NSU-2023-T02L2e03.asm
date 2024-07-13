asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------

	ldi r1,x
	ld r1,r1
	move r1,r2
	ldi r3,0b01010101
	and r3,r2
	ldi r3,0b10101010
	and r3,r1
	shla r2
	sub r1,r2
	bz tru
	br fal
tru:
	ldi r1,ans
	ldi r2,x
	ld r2,r2
	st r1,r2
	br cont
fal:
	ldi r1,ans
	ldi r2,0
	st r1,r2
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
# (different bit-strings placed at addresses a, x, y and z)
# ---------------------------------------------------------------------

INPUTS>
x:    dc 0b11001110
ENDINPUTS>

ans:  ds 1     # one byte reserved for the result
end

