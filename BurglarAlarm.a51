ORG 0000H
	MOV R2, #00H		;Counter for window door number
	MOV DPTR, #100H		;Address for look up tables
	CLR P1.0
	MOV P3, #00H
	MOV P2, #0FFH		;configure as input port
BACK: MOV A, P2		;read status of all switches
	ANL A, #0FH		;mask upper bits of P2
	JZ BACK		;keep monitoring the status if all switches are closed, else activate buzzer and display number of opened windows
				;	on 7 segment display 
	SETB P1.0		;turn ON buzzer
NXT: RRC A		;Rotate contents of A to determine number of opened windows
	JC DISPLAY
	INC R2		;increment counter
	SJMP NXT		
DISPLAY: MOV A, R2		;place opened window number in A for display
	MOVC A, @A+DPTR		;access corrosponding code from look-up table
	MOV P3, A		;display code on 7 segment module
HERE: SJMP HERE

ORG 100H
	DB 06H, 5BH, 4FH, 66H		;codes for 1 to 4
END