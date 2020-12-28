; Unsigned_Selection_Sort.asm
; Author:       Trung Tang
; S/N:          040874030
; Date:         April 12 2018

; Purpose:      To order the array with Selection Sort

STACK   equ     $2000

        org     $1000

Address ds      2                       ; Address is location of lower found card
Cards   db      $08, $04, $05, $0e, $09, $09, $05, $08, $08, $0d
CardsEnd


        org     $2000
Start   lds     #STACK                  ; Load stack
                
        ldx     #Cards                  ; Assign array to x pointer
LoopOne ldaa    0,x                     ; Load card into A
        tfr     x y                     ; Transfer pointer X to Y

LoopTwo ldab    1,y                     ; Load next array value into B
        cpy     #CardsEnd               ; Compare Y pointer to final card pointer
        beq     Skip                    ; Branch if equal to final card
        cmpa    1,y+                    ; Compare A to next card at Y pointer, and then increment
        blo     LoopTwo                 ; Branch if card is less than at A
        dey                             ; Decrement Y
        sty     Address                 ; Store address of found lower number as pointer
        ldaa    1,y+                    ; Load A with value, then increment
        cpy     #CardsEnd               ; Compare Y to final card pointer
        bne     LoopTwo                 ; Branch if Y equals final card pointer

Skip    ldy     Address                 ; Load Y pointer at found card address
        ldab    0,x                     ; Load B from X, which is initial card
        staa    1,x+                    ; Store A at initial card pointer
        stab    0,y                     ; Store B at found card address
        cpx     #CardsEnd               ; Branch if X equals final card pointer
        bne     LoopOne                 ; Branch if not equal to final card pointer
        end