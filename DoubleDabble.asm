; Double Dabble Algorithm

	JMP main

output:
	DB 0
	DB 0
	DB 0
	DB 255
input:
	DB 100

shift:
	SHL A, 20
	RET

dabble:
	

main:
	CALL shift
	CALL dabble
	HLT
