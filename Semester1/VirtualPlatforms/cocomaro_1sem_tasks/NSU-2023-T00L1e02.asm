asect  0x00



ldi r0, a
ldi r1, 13
st r0, r1
inc r0
ldi r1, 0x45
st r0, r1
inc r0
ldi r1, 0b11001101 
st r0, r1
inc r0
ldi r1, "A"
st r0, r1

# =================================
# LEAVE THIS PART OF THE FILE ALONE
# Do not change the next two instructions: they must be the last two
# instructions executed by your program.
    ldi r0, a    # Loads the address of your result into r0 for the robot
    halt         # Brings execution to a halt

# =================================
# DATA GOES BELOW
# Just add here the data definitions as instructed.
# (different values, starting with address a)
# ---------------------------------------------------------------------
INPUTS>
ENDINPUTS>
a:
	dc 13
end



