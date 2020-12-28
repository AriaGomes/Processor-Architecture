; Counter_00_99_BCD_HEX_Display.asm

#include C:\68hcs12\registers.inc

; Author: Aria Gomes
; Course: CST8216 Processor Architecture
; S/N:  040878659
; Date: 2019-12-05
;
; Purpose: Count from 0 to 99 and display the value on HEX Display
;
; Program Constants
STACK   equ     $2000       ; Gives STACK the Hexadecimal value of $2000

; Port P (PPT) Display Selection Values  - These values must be filled in
DIGIT3_PP0      equ     %1110        ; MSB of the displayed BCD digits (left-most dislay)
DIGIT2_PP1      equ     %1101        ; LSB of the displayed BCD digits (2nd display from left)

; Delay Subroutine Values
DELAY_VALUE     equ     125     ; Delay value (base 10) 0 - 255 ms
                                ; 125 = 1/8 second, 250 = 1/4 second
        org     $2000           ; Gives STACK the Hexadecimal value of $2000
Start   lds     #STACK          ; Loads stack pointer with memory location of STACK and stores it at start

; Configure the Ports
        jsr     Config_HEX_Displays ; Jump to sub routine

; Continually Count $00 - $99...$00 - $99 BCD, displaying the values on the Hex Displays
Reboot  ldaa    #0            	; Counter start at 0

Again   psha
        jsr     Extract_MSB     ; Jump to sub routine
        ldab    #DIGIT3_PP0     ; Load address of Digit 3
        jsr     Hex_Display     ; Jump to sub routine
        ldaa    #DELAY_VALUE    ; Load address of Delay Value
        jsr     Delay_ms        ; Jump to sub routine
        
        ldaa    0,sp        	; Flash upper nibble
        jsr     Extract_LSB     ; Jump to subroutine
        ldab    #DIGIT2_PP1     ; Load address of Digit 2 to Accumulator B
        jsr     Hex_Display     ; Jump to subroutine
        ldaa    #DELAY_VALUE    ; Loads memory address of Delay Address with accumulator A
        jsr     Delay_ms        ; Jump to subroutine
        
        pula    ;counter need resetting ?
        cmpa    #%10011001   ; Compare accumulator A to decimal address of binary value
        beq     Reboot       ; Branch to Reboot if equal

        adda    #1          ; Add without carry to the value of memory
        daa                 ; Adjusts decimal with A accumulator
        bra     Again       ; Branch to Again
        
        
; Subroutines used by program (DO NOT CHANGE ANY OF THE FOLLOWING LINES OF CODE)
#include C:\68HCS12\Lib\Config_HEX_Displays.asm
#include C:\68HCS12\Lib\Delay_ms.asm
#include Extract_MSB.asm
#include Extract_LSB.asm
#include Hex_Display.asm

        end      ; end of program