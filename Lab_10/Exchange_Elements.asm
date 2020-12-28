;Exchange_Elemenets.asm
;
; Author:               Aria Gomes
; Student Number:       040-878-659
; Date:                 November 22 2019
; Purpose:              To order the array with Selection Sort

            org $1000  		; Sets the origin of the memory to $1000
Elements    db  033, 110, 117, 070, 032, 115, 105, 032, 101, 103, 097
            db  117, 103, 110, 097, 076, 032, 121, 108, 098, 109, 101
            db  115, 115, 065 	; Array called elements, ends at endelements
EndElements
Len         equ EndElements-Elements ; sizeof() = Length of the array

STACK       equ $2000           ; Gives STACK the Hexadecimal value of $2000
            org STACK           ; Sets the origin of the memory to STACK
            lds #STACK          ; Load stack pointer
            ldx #Elements       ; Assign array to x pointer
            ldy #Elements+Len-1 ; Load Y pointer at found Element address
START       ldab 0,x 		; Load next array value into B with value of X
            ldaa 0,y  		; Load next array value into B with value of Y
            staa 1,x+ 		; Store A at initial Element pointer
            stab 1,y- 		; Store B at found Element address
            clra     		; Clears A accumulator
            clrb      		; Clears B accumulator
CHECK       equ  $100C 		; Gives CHECK the Hexadecimal value of $100C
            cpx #CHECK 		; Branch if X equals final Element pointer
            bne START 		; Branch if not equal to final Element pointer
            end 		; End of program