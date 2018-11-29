; Double Dabble Algorithm

	JMP main

ones:
	DB 240
tens:
	DB 240
hundreds:
	DB 0
input:
	DB 240

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
	RET

main:
	CALL shift
	CALL dabble
	HLT
