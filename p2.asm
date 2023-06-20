.MODEL SMALL
.RADIX 16
.stack

;segmento de datos
.data
    usac        db "Universidad de San Carlos de Guatemala", 0A, "$"
    facultad    db "Facultad de Ingenieria", 0A, "$" 
    vacaciones  db "Escuela de Vacaciones", 0A, "$"
    curso       db "Arquitectura de Computadoras y Ensambladores 1", 0A, "$"
    nombre      db "Pedro Martin Francisco", 0A, "$"
    carne       db "201700656", 0A, "$"
    salto       db 0A, "$" ;salto a siguente linea

;segmento de codigo
.code
.STARTUP
inicio:
    ;encabezado
    mov dx, offset usac
    mov ah, 09
    int 21  
    mov dx, offset facultad
    mov ah, 09
    int 21
    mov dx, offset vacaciones
    mov ah, 09
    int 21
    mov dx, offset curso
    mov ah, 09
    int 21
    mov dx, offset salto
    mov ah, 09
    int 21
    mov dx, offset nombre
    mov ah, 09
    int 21
    mov dx, offset carne
    mov ah, 09
    int 21

    
fin:
.EXIT
END    

