.model small
.stack 100h

.data
    menu db 'Menu Pemesanan Lapangan Badminton', 0x0A, 0x0D, '$'
    prompt_waktu db 'Masukkan waktu (08:00 - 10:00, 10:00 - 12:00, 12:00 - 14:00, 14:00 - 16:00): $'
    prompt_lapangan db 'Masukkan lapangan (1 atau 2): $'
    konfirmasi db 'Pemesanan berhasil! Terima kasih.$'
    newline db 0x0A, 0x0D, '$'
    invalid_msg db 'Input tidak valid!$'

    waktu db 20, ?, 19 dup(0) 
    lapangan db 0             

.code
main:
   
    mov ax, @data
    mov ds, ax

    
    mov ah, 09h
    lea dx, menu
    int 21h

prompt_waktu_input:
    
    lea dx, prompt_waktu
    mov ah, 09h
    int 21h

    
    lea dx, waktu
    mov ah, 0Ah
    int 21h

   
    mov al, waktu[1]      
    cmp al, 0
    je invalid_input      

    
    lea dx, prompt_lapangan
    mov ah, 09h
    int 21h

    
    mov ah, 01h
    int 21h
    sub al, '0'           
    cmp al, 1
    jl invalid_input      
    cmp al, 2
    jg invalid_input     
    mov [lapangan], al   

    
    lea dx, konfirmasi
    mov ah, 09h
    int 21h

    
    lea dx, newline
    mov ah, 09h
    int 21h

    
    mov ah, 4Ch
    int 21h

invalid_input:
    
    lea dx, invalid_msg
    mov ah, 09h
    int 21h

    
    lea dx, newline
    mov ah, 09h
    int 21h

    
    jmp prompt_waktu_input

end main