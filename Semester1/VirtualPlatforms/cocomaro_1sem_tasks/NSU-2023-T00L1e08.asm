asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------


ldi r2, a
ld r2,r2
ldi r1, b
st r1,r2

# =================================
# LEAVE THIS PART OF THE FILE ALONE
# Do not change the next two instructions: they must be the last two
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
  dc 15    # Input data (for testing) should be in this memory cell
ENDINPUTS>

b:
  ds 1     # This memory cell is where your program's output will end up
end



