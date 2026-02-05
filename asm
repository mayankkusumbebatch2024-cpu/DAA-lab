; Q4: Generate Mobile Digits (Example 9876 -> 2694 Hex)
; Using Logical Instructions (ORL, ANL, CLR)

ORG 0000H

    ; --- Generate High Byte (26H) ---
    CLR A           ; Clear A (00H)
    ORL A, #20H     ; A = 20H
    ORL A, #06H     ; A = 26H (20H | 06H)
    MOV R2, A       ; Store High Byte

    ; --- Generate Low Byte (94H) ---
    CLR A           ; Reset A
    ORL A, #0F0H    ; A = F0H
    ANL A, #9FH     ; F0 & 9F = 90H (Masking)
    ORL A, #04H     ; 90 | 04 = 94H
    
    ; --- Final Result ---
    MOV B, R2       ; Load High Byte to B
    ; A already has Low Byte (94H)
    ; Result B:A = 2694H (9876 Decimal)

END
