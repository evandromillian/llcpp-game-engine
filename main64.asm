global  main
extern  puts

section .text
main:
        and   RSP, 0FFFFFFFFFFFFFFF0h                  ; Align the stack to a multiple of 16 bytes
        
        sub     rsp, 20h            ; Reserve the shadow space (minimum 4 bytes -> 20h)
        mov     rcx, message        ; First argument is address of message
        call    puts                ; puts(message)
        add     rsp, 20h            ; Remove shadow space

        xor     rcx, rcx            ; Return 0 from main
        ret

section .data
message:
        db      'Hello World ASM', 0                      ; C strings need a zero byte at the end