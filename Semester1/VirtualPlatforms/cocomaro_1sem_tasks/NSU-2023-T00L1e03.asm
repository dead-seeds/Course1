asect  0x00


ldi r0, a
ldi r1, "H"
st r0, r1
inc r0
ldi r1, "e"
st r0, r1
inc r0
ldi r1, "l"
st r0, r1
inc r0
ldi r1, "l"
st r0, r1
inc r0
ldi r1, "o"
st r0, r1
inc r0
ldi r1, " "
st r0, r1
inc r0
ldi r1, "W"
st r0, r1
inc r0
ldi r1, "o"
st r0, r1
inc r0
ldi r1, "r"
st r0, r1
inc r0
ldi r1, "l"
st r0, r1
inc r0
ldi r1, "d"
st r0, r1
inc r0
ldi r1, 0
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
	dc 0
end



