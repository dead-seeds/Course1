asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------

	ldi r1,x
	ld r1,r1
	ldi r2,0b00010000
	and r1,r2
	shla r2
	shla r2
	ldi r3,0b01000000
	and r1,r3
	sub r3,r2
	bz eq46
	br condfalse
eq46:
	ldi r2,0b00010000
	and r1,r2
	shra r2
	shra r2
	ldi r3,0b00000100
	and r1,r3
	sub r3,r2
	bz condfalse
	br neq42
neq42:
	ldi r2,0b01000100
	and r1,r2
	move r1,r3
	sub r1,r2
	move r2,r1
	not r3
	ldi r2,0b01000100
	and r3,r2
	add r2,r1
	br contin
condfalse:
	#do default actions
	ldi r1,x
	ld r1,r1
contin:
	ldi r0,ans
	st r0,r1
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
x:    dc 0b01101011
ENDINPUTS>

ans:  ds 1     # one byte reserved for the result
end

