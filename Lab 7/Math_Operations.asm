; Math_Operations.asm
;
; Author:                       Aria Gomes
; Student Number:               040-878-659
; Date:                         1 Nov 2019
;
; Purpose:                      To Gain Experince with Assembly Language instructions

;Program Constants
STACK   equ     $2000

        org     $1000           ; Data starts at $1000
MyArray db      $10,$62         ; Defines two bytes with label MyArray
Result  ds      2               ; Defines storage with label Result

        org     $2000           ; Program Code starts $2000
Start   lds     #STACK          ; Setup the stack

        ldaa    #$26            ; Loads hexadecimal value into accumulator 'a' with immediate addressing mode
        ldab    #26             ; Loads decimal value into accumulator 'b' with immediate addressing mode
        adda    MyArray         ; Adds values from MyArray into acummulator 'a'
        staa    Result          ; Stores accumulator 'a' at label Result
        stab    Result+1        ; Stores accumulator 'b' at label Result incremented by 1
        ldaa    Result+1        ; Loads accumulator 'a' from label Result with an increment of 1
        ldab    Result          ; Loads accumulator 'b' from label Result
        incb                    ; Adds one to the value of accumulator 'b'
        ldaa    #%10101010      ; Loads the binary value 10101010 into accumulator 'a' with immediate addressing mode
        std     Result          ; Stores the content of the double accumulator 'd' in label Result
        swi                     ; Causes an interupt without an external service request
        end                     ; End of Program