asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------

	ldi r1,a
	ld r1,r1
	ldi r2,0
	cmp r1,r2
	beq s0
	ldi r2,1
	cmp r1,r2
	beq s1
	br s2
s0:
	ldi r0,x
	ld r0,r0
	neg r0
	br cont
s1:
	ldi r0,x
	ld r0,r0
	ldi r1,y
	ld r1,r1
	add r1,r0
	br cont
s2:
	ldi r0,z
	ld r0,r0
	ldi r1,y
	ld r1,r1
	sub r1,r0
	br cont
cont:
	ldi r1,ans
	st r1,r0
	


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
a:    dc 1   # replace these three numbers
x:    dc 5     # by your choice of integers
y:    dc 3     #  for testing purposes
z:    dc 7
ENDINPUTS>

ans:  ds 1     # one byte reserved for the result
end

