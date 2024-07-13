asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------


ldi r1, a
ld r1,r1
ldi r2, b
ld r2,r2

# =================================
# LEAVE THIS PART OF THE FILE ALONE
# Do not change the next four instructions: they must be the last four
# instructions executed by your program.
    push r2
    push r1
    ldsa r0,0 # load the address of the current stack pointer into r0 for the robot
    halt      # Brings execution to a halt

# =================================
# DATA GOES BELOW
# We have set this up for you, but you will need to test your program by
# compiling and running it several times with different input data values
# (different values placed at addresses a and b)
# ---------------------------------------------------------------------

INPUTS>
# Input data (for testing) should be in the following memory cells:
a: dc 15
b: dc 14
ENDINPUTS>

end



