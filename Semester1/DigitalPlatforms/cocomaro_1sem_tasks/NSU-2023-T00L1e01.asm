asect  0x00

# =================================
# UNCOMMENT THE CODE BELOW
# No need to add any of your own
# Test the program by re-compiling and running with
# different values placed in locations a and b
# Check the result that ends up in loctaion c each time
# ---------------------------------------------------------------------

#    ldi r0, a
#    ld  r0, r0
#    ldi r1, b
#    ld  r1, r1
#    add r0, r1
#    ldi r0, c
#    st  r0, r1

# =================================
# LEAVE THIS PART OF THE FILE ALONE
# Do not change the next two instructions: they must be the last two
# instructions executed by your program.
    ldi r0, c    # Loads the address of your result into r0 for the robot
    halt         # Brings execution to a halt

# =================================
# DATA GOES BELOW
# We have set this up for you, but you will need to test your program by
# compiling and running it several times with different input data values
# (different values placed at addresses a and b)
# ---------------------------------------------------------------------

INPUTS>
a:
  dc 15    # Input data (for testing) should be in this memory cell
b:
  dc 26    # Input data (for testing) should be in this memory cell
ENDINPUTS>

c:
  ds 1     # This memory cell is where the output will end up
end

