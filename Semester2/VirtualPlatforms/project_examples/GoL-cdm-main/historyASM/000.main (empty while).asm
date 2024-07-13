asect 0
# Your program starts from 0x00 address

start:
    
# # setPS 0x80 # enable interrupts
#push r3
ldi r3, 0x80
osix 0x0
# pop r3

clr r3
	
while # True
	tst r3
stays z # r3 == 0? 
	# catch interrupts	
wend
	
halt

end.
