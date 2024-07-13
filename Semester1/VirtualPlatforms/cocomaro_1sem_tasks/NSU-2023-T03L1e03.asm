asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------

	ldi r1,n
	ld r1,r1
begin:
	inc r2
	add r2,r3
	bcc nocarry
	br over
nocarry:
	cmp r2,r1
	blo begin
	br cont
over:
	ldi r1,res
	ldi r2,255
	st r1,r2
	ldi r1,oflow
	ldi r2,1
	st r1,r2
	br nonorm
cont:
	ldi r2,res
	st r2,r3
	ldi r2,oflow
	ldi r3,-1
	st r2,r3
nonorm:
	
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
# (different unsigned numbers placed at address n)
# ---------------------------------------------------------------------

INPUTS>
n:     dc 30    # replace this with your choice of unsigned number for testing
ENDINPUTS>

res:   ds 1    # one byte reserved for the (unsigned number) total
oflow: ds 1    # one byte to indicate whether or not an overflow has occurred
end

