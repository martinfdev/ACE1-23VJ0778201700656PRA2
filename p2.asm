.MODEL SMALL
.RADIX 16
.stack

;segmento de datos
.data
    usac                        DB "Universidad de San Carlos de Guatemala", 0A, "$"
    facultad                    DB "Facultad de Ingenieria", 0A, "$" 
    vacaciones                  DB "Escuela de Vacaciones", 0A, "$"
    curso                       DB "Arquitectura de Computadoras y Ensambladores 1", 0A, "$"
    nombre                      DB "Pedro Martin Francisco", 0A, "$"
    carne                       DB "201700656", 0A, "$"
    salto                       DB 0A, "$" ;salto a siguente linea
    opciones_m                  DB "=======OPCIONES=======", 0A, "$"
    productos_m                 DB "(p) Productos", 0A, "$"
    ingreso_prod_m              DB "(i) Ingresar Productos", 0A, "$"
    eliminar_prod_m             DB "(e) Eliminar Productos", 0A, "$"
    ver_prod_m                  DB "(b) Ver Productos", 0A, "$"
    ventas_m                    DB "(v) Ventas", 0A, "$"
    herramientas_m              DB "(h) Herramientas", 0A, "$"
    salir_m                     DB "(s) Salir", 0A, "$"
    promt_m                     DB "Seleccione una opcion: $"
    msg2                        DB "Opcion incorrecto, intenta de nuevo!", 0A, "$"
    file_acces                  DB "PRA2.CNF",00
    msg_error_open_file_access  DB "Error al abrir el archivo de configuracion", 0A, "Programa terminado!", 0A, "$"
    ; creden_usuario_clave        DB "[credenciales]", 0A, "usuario="pmartin"", 0A, "clave="201700656"", 0A
    handle_file                 DW ?
    buffer_teclado              DB 20, 00
                                DB 100h DUP(?)
    buffer_file                 DB 0FF DUP("$")

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

acceso_sistema:
    ;abrir archivo
    mov AL, 00 ;archivo de solo lectura
    mov DX, offset file_acces
    mov AH, 3D
    int 21
    ;mensaje de error del archivo
    jc error_abrir_archivo
    mov [handle_file], AX
    
    ;leer contedio del archivo
    mov BX, [handle_file]
    mov DX, offset buffer_file
    mov CX, 0FF
    mov AH, 03F
    int 21
        
    ; Cerrar el archivo
    mov BX, [handle_file]
    mov AH, 3E
    int 21h
    int 03

;parsear las credenciales si son correctas
parsear_credenciales:
    mov CX, 00
    mov DX, 00





    jmp menu_loop


error_abrir_archivo:
    mov DX, offset msg_error_open_file_access
    mov AH, 09
    int 21
    jmp fin

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

    cmp AL, 070 ;p
    ;je teclado_correcto
    cmp AL, 069 ;i
    ;je teclado_correcto
    cmp AL, 065 ;e
    ;je teclado_correcto
    cmp AL, 062 ;b
    ;je teclado_correcto
    cmp AL, 076 ;v
    ;je teclado_correcto
    cmp AL, 068 ;h
    ;je teclado_correcto
    cmp AL, 073 ;s
    je fin
    jmp opcion_incorrecta

opcion_incorrecta:
    ;salto
    mov DX, offset salto
    mov AH, 09
    int 21
    ;impresion de mensaje de error
    mov DX, offset msg2
    mov AH, 09
    int 21
    jmp menu_loop
fin:
.EXIT
END    

