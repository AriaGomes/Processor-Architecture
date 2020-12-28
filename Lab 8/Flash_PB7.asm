Flash_PB7.asm

#include C:\68HCS12\registers.inc

; Author:       D. Haley
; Course:       CST8216 Fall 2019
; S/N:          Faculty
; Date:         28 Oct 2019

; Purpose       To Flash PB7 LED on Dragon 12+ Trainer

; Program Constants
STACK    equ     $2000
PB7ON    equ     %10000000       ; 1 turns on LED, 0 turns off LED
PB7OFF   equ     %00000000       ; 1 turns on LED, 0 turns off LED

        org     $2000           ; program code
Start   lds     #STACK  ; stack location

; Configure the Ports
	jsr     Config_SWs_and_LEDs

; Continually Flash LED
Back    ldaa    #PB7ON
	staa    portb            ; PB7 ON
        ldaa    #250            ; 250 ms delay
        jsr     Delay_ms
        ldaa    #PB7OFF
        staa    portb                   ; PB7 OFF
        ldaa    #250            ; 250 ms delay
        jsr     Delay_ms        ; call 250ms delay routine
	bra     Back                    ; endless loop

; Library Files
#include C:\68HCS12\Lib\Config_SWs_and_LEDs.asm
#include C:\68HCS12\Lib\Delay_ms.asm
        end