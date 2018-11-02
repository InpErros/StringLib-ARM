@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Overwrites a string in memory @
@ with a string that is an      @
@ uppercased version            @
@====================@@@@@@@@@@@@
@ Pre-Condition      @
@ R1: String pointer @
@====================@
@ Post-Condition     @
@ R1: No Change      @
@@@@@@@@@@@@@@@@@@@@@@
.global	string_toLowerCase
string_toLowerCase:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
char   .req R0   @
strPtr .req R1   @
@@@@@@@@@@@@@@@@@@
	push	{R0,R1}

loop:
	ldrb	char,[strPtr]
	
	cmp	char,#0x0	@check if the character is \0
	beq	exit

	cmp	char,#'A'	
	blt	storing_char
	cmp	char,#'Z'
	bgt	storing_char
	add	char,#0x20	@capital and lowercased letters
				@are offsetted by 0x20

storing_char:
	strb	char,[strPtr]
	add	strPtr,#1
	b	loop

exit:
	pop	{R0,R1}
	bx	LR
.end

