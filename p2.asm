.MODEL SMALL
.RADIX 16
.stack

;segmento de datos
.data
    usac                db "Universidad de San Carlos de Guatemala", 0A, "$"
    facultad            db "Facultad de Ingenieria", 0A, "$" 
    vacaciones          db "Escuela de Vacaciones", 0A, "$"
    curso               db "Arquitectura de Computadoras y Ensambladores 1", 0A, "$"
    nombre              db "Pedro Martin Francisco", 0A, "$"
    carne               db "201700656", 0A, "$"
    salto               db 0A, "$" ;salto a siguente linea
    opciones_m          db "=======OPCIONES=======", 0A, "$"
    productos_m         db "(p) Productos", 0A, "$"
    ingreso_prod_m      db "(i) Ingresar Productos", 0A, "$"
    eliminar_prod_m     db "(e) Eliminar Productos", 0A, "$"
    ver_prod_m          db "(b) Ver Productos", 0A, "$"
    ventas_m            db "(v) Ventas", 0A, "$"
    herramientas_m      db "(h) Herramientas", 0A, "$"
    salir_m             db "(s) Salir", 0A, "$"
    promt_m             db "Selecciones una opcion: $"


;segmento de codigo
.code
.STARTUP
inicio:
    ;encabezado
    mov DX, offset usac
    mov AH, 09
    int 21  
    mov DX, offset facultad
    mov AH, 09
    int 21
    mov DX, offset vacaciones
    mov AH, 09
    int 21
    mov DX, offset curso
    mov AH, 09
    int 21
    mov DX, offset salto
    mov AH, 09
    int 21
    mov DX, offset nombre
    mov AH, 09
    int 21
    mov DX, offset carne
    mov AH, 09
    int 21

menu_loop:
    ;salto antes de imprimir
    mov DX, offset salto
    mov AH, 09
    int 21
    mov DX, offset salto
    mov AH, 09
    int 21

    ;menu opciones
    mov DX, offset opciones_m
    mov AH, 09
    int 21
    ;productos
    mov DX, offset productos_m
    mov AH, 09
    int 21

    ;ingreso productos
    mov DX, offset ingreso_prod_m
    mov AH, 09
    int 21

    ;eliminar productos
    mov DX, offset eliminar_prod_m
    mov AH, 09
    int 21

    ;ver productos
    mov DX, offset ver_prod_m
    mov AH, 09
    int 21

    ;ventas
    mov DX, offset Ventas_m
    mov AH, 09
    int 21

    ;herramientas
    mov DX, offset herramientas_m
    mov AH, 09
    int 21

    ;salir
    mov DX, offset salir_m
    mov AH, 09
    int 21

    ;solicitar una opcion al usuario
    mov DX, offset promt_m
    mov AH, 09
    int 21

    ;leer opcion de usuario
    mov AH, 07
    int 21

    cmp AL, 070 ;a
    cmp AL, 
    je fin
    jmp menu_loop


fin:
.EXIT
END    

