; 18W_Trace1.asm

	org     $1000
Data1   db      $55, $19, $35, $08
Data2   db      $00, $FF, $10, $01, $E7, $9E, $8F, $31

        org     $2000
        lds     #$2000          ; SP =? _____$2000______<=example answer

        ldy     #Data1          ; y = ? ________________(1 mark)
        
        ldab    4,y             ; B = ? ________________ (1 mark)
        
        ldaa 	1,y+            ; A = ? ________________ (1 mark)
        
        ldab    0,y             ; B = ? ________________ (1 mark)
        
        ldx     #Data2          ; X = ? ________________ (1 mark)
        
        ldd     6,x+            ; D = ? ________________ (1 mark)
        
        std     2,x+            ; X = ? ________________ (1 mark)
        
        swi
        end