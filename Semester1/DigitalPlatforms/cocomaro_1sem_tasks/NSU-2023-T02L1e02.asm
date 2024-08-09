asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------

	ldi r0,a
	ld r0,r0
	ldi r1,b
	ld r1,r1
	cmp r1,r0
	ble bm
	br cont
bm:
	move r0,r1
cont:
	ldi r0,c
	ld r0,r0
	
	cmp r1,r0
	ble bm2
	br cont2
bm2:
	move r0,r1
cont2:
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
# (different bit-strings placed at addresses a, b and c)
# ---------------------------------------------------------------------

INPUTS>
a:    dc 12   # replace these three numbers
b:    dc 3     # by your choice of integers
c:    dc 15     #  for testing purposes
ENDINPUTS>

ans:  ds 1     # one byte reserved for the result
end

