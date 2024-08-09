asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------

ldi r1,a
ld r1,r1
ldi r2,a
ld r2,r2
add r2, r1
ldi r3,c
st r3,r2


# =================================
# LEAVE THIS PART OF THE FILE ALONE
# Do not change the next two lines: they must be the last two
# instructions executed by your program.
    ldi r0, b    # Loads the address of your result into r0 for the robot
    halt         # Brings execution to a halt

# =================================
# DATA GOES BELOW
# We have set this up for you, but you will need to test your program by
# compiling and running it several times with different input data values
# (different values placed at address a)
# ---------------------------------------------------------------------

INPUTS>
a:
  dc 0b01100110    # Input data (for testing) should be in this memory cell
ENDINPUTS>

b:
  ds 1     # This memory cell is where the output will end up
end

