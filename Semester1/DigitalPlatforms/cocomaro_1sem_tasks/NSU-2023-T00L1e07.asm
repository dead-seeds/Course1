asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------

ldi r1, 16
ldi r2, a
st r2, r1

ldi r1, 0x32
ldi r2, b
st r2, r1

ldi r1, 0b00000011
ldi r2, c
st r2, r1

# =================================
# LEAVE THIS PART OF THE FILE ALONE
# Do not change the next two instructions: they must be the last two
# instructions executed by your program.
    ldi r0, a    # Loads the start address of your result into r0 for the robot
    halt         # Brings execution to a halt

# =================================
# DATA GOES BELOW
# We have set this up for you. You will need to test your program by
# compiling and running it
# ---------------------------------------------------------------------

INPUTS>
ENDINPUTS>

a: ds 1	# This memory cell is where your program's output will end up
b: ds 1	# This memory cell is where your program's output will end up
c: ds 1	# This memory cell is where your program's output will end up
end



