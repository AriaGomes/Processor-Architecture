; Copys 8 bit values



           org        $1000
Source     db       $12,$34

           org        $1020
Dest       ds         2

           org        $2000
           ldaa       Source
           staa       Dest
           ldaa       Source+1
           staa       Dest+1
           swi
           end