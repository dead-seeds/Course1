asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------
	
	ldi r0,a
	ld r0,r0
	ldi r1,a
	inc r1
	ld r1,r1
	
	ldi r2,b
	ld r2,r2
	ldi r3,b
	inc r3
	ld r3,r3
	
	cmp r1,r3
	beq cmplows
	bge agb_pos
	br bga_pos
cmplows:
	# r1 and r3 (aHi and bHi) are same
	push r1
	push r3
	ldi r3,0
	cmp r1,r3
	bge cmp_lows_pos #when r1 and r3 > 0 
	br cmp_lows_neg #when r1 and r3 < 0
	cmp_lows_neg:
		pop r3
		pop r1
		cmp r0,r2
		blo agb_neg
		br bga_neg
	cmp_lows_pos:
		pop r3
		pop r1
		cmp r0,r2
		blo bga_pos
		br agb_pos
		agb_neg:
			sub r1,r3
			move r3,r1
			cmp r0,r2
			blo lbgla_neg
			br laglb_neg
			laglb_neg:
				sub r0,r2
				move r2,r0
				br cont
			lbgla_neg:
				sub r0,r2
				move r2,r0
				br cont
		bga_neg:
			add r2,r0
			addc r3,r1
			br cont
		agb_pos:
			sub r1,r3
			move r3,r1
			cmp r0,r2
			blo lbgla_pos
			br laglb_pos
			laglb_pos:
				sub r0,r2
				move r2,r0
				br cont
			lbgla_pos:
				dec r1
				sub r0,r2
				move r2,r0
				br cont
		bga_pos:
			add r2,r0
			addc r3,r1
			br cont

cont:
	ldi r2,ans
	st r2,r0
	inc r2
	st r2,r1

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
# (different bit-strings placed at address x)
# ---------------------------------------------------------------------

INPUTS>
#dc       0x92,0xf5,0x0f,0xf5
a:    dc  0x08,0xe1   # replace two bytes by your choice of bit-srings for testing
b:    dc  0x87,0xe1   # replace two bytes by your choice of bit-srings for testing

ENDINPUTS>

ans:  ds 2      # two byte reserved for the result
end


