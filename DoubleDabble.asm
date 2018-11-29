; Double Dabble Algorithm

	JMP main

ones:
	DB 0xf0
tens:
	DB 0xf0
hundreds:
	DB 0xf0
input:
	DB 0xf0

shift:
	MOV A, [hundreds]	;shift nibble
	SHL A, 1
	MOV [hundreds], A
shtens:
	MOV A, [tens]		;shift nibble
	SHL A, 1
	MOV [tens], A

	JNC shones	;carry bit
	MOV A, 16
	ADD A, [hundreds]
	MOV [hundreds], A

shones:
	MOV A, [ones]		;shift nibble
	SHL A, 1
	MOV [ones], A

	JNC shinput	;carry bit
	MOV A, 16
	ADD A, [tens]
	MOV [tens], A

shinput:
	MOV A, [input]		;shift byte
	SHL A, 1
	MOV [input], A

	JNC shend	;carry bit
	MOV A, 16
	ADD A, [ones]
	MOV [ones], A
shend:
	RET

dabble:
	MOV B, ones
.dabbleloop:
	MOV A, [B]
	SUB A, 0x40	;if(nibble > 4) add 3
	JNA incb
	MOV A, [B]
	ADD A, 0x30
	MOV [B], A
incb:		
	INC B
	CMP B, 5
	JNZ .dabbleloop
	RET

main:
	MOV C, 0
.mainloop:
	CALL shift
	CALL dabble
	CMP C, 7
	JNZ mainloop

	HLT
