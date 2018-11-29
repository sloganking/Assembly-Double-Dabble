; Double Dabble Algorithm

	JMP main

out1:
	DB 0
out2:
	DB 0
out3:
	DB 1
	DB 255
input:
	DB 100d

shift:
	MOV A, [out3]
	SHL A, 1
	MOV [out3], A

	MOV A, [out2]
	SHL A, 1
	MOV [out2], A

	;if, carry
	JNC shift3

shift3:
	MOV A, [out1]
	SHL A, 1
	MOV [out1], A

	RET

dabble:
	

main:
	CALL shift
	CALL dabble
	HLT
