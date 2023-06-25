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
    opciones_m                  DB "=======OPCIONES MENU=======", 0A, "$"
    opciones_producto           DB "====+OPCIONES PRODUCTO+====", 0A, "$"
    productos_m                 DB "(p) Productos", 0A, "$"
    ingreso_prod_m              DB "(c) Crear Producto", 0A, "$"
    eliminar_prod_m             DB "(e) Eliminar Producto", 0A, "$"
    ver_prod_m                  DB "(b) Ver Productos", 0A, "$"
    ventas_m                    DB "(v) Ventas", 0A, "$"
    herramientas_m              DB "(h) Herramientas", 0A, "$"
    salir_m                     DB "(s) Salir", 0A, "$"
    promt_m                     DB "Seleccione una opcion: $"
    msg2                        DB "Opcion incorrecto, intenta de nuevo!", 0A, "$"
    file_acces                  DB "PRA2.CNF",00
    msg_error_open_file_access  DB "Error al abrir el archivo de configuracion", 0A, "Programa terminado!", 0A, "$"
    msg_error_create_file_base  DB 0A,0A, "Error al crear el archivo de productos!", 0A, "$"
    creden_usuario_clave        DB "[credenciales]", "usuario=", 22, "pfrancisco", 22, "clave=", 22, "201700656", 22, 00
    msg_error_creden            DB "Error de autenticacion", 0A, "Programa terminado!", 0A, "$"
    msg_correcto_cred           DB "Credenciales correctas!", 0A, "Presione Enter para continuar: $"
    msg_escape_menu_principal   DB "(Esc) Volver a Menu Principal", 0A, "$"
    msg_codigo_invalido         DB 0A, "Codigo invalido! $"
    file_product                DB "PROD.BIN", 00
    temp_buffer                 DB 040 DUP(0)
    handle_file                 DW ?
    handle_file_prod            DW ?
    buffer_file                 DB 060 DUP(0)
    buffer_teclado              DB 20, 00
                                DB 21 DUP(0)
    prod_codigo_name            DB 0A, "Codigo: $"
    prod_descrip_name           DB 0A, "Descripcion: $"
    prod_precio_name            DB 0A, "Precio: $"
    prod_unidades_name         	DB 0A, "Unidades: $"
    buff_prod_codigo            DB 04 (0)
    buff_prod_descrip           DB 40 (0)
    buff_prod_precio            DB 01(0)
    buff_prod_unidades         	DB 01(0)

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
    ;cierro el buffer
    mov BX, [handle_file]
    mov AH, 3E
    int 21h

    mov SI, offset buffer_file 
    mov DI, offset temp_buffer 

limpiar_cadena:
    mov AL, [SI]
    cmp AL, 20h ; Comparar con un espacio
    je saltar_caracter
    cmp AL, 0A ; Comparar con un salto de línea
    je saltar_caracter
    cmp AL, 024 ;fin de buffer de archivo
    je parsear_credenciales
    mov [DI], AL ; Copiar el carácter al buffer de destino
    inc DI

saltar_caracter:
    inc SI
    jmp limpiar_cadena

;parsear las credenciales si son correctas
parsear_credenciales:
    mov DI, offset creden_usuario_clave
    mov SI, offset temp_buffer
    mov CX, 34 ;contador para decrementar el loop size total de la cadena a comparar

comparar_cadenas:
    mov AL, [SI] 
    mov BL, [DI]   
    cmp AL, BL 
    jne datos_invalidos ; Salto si los bytes son diferentes
    inc SI 
    inc DI 
    loop comparar_cadenas 
    ; Las cadenas son iguales
    jmp credenciales_correctas

credenciales_correctas:
    mov DX, offset msg_correcto_cred
    mov AH, 09
    int 21
    ;leer opcion de usuario
    mov AH, 07 ;sin echo
    int 21

    cmp AL, 0D ;Enter
    je menu_loop
    jmp credenciales_correctas


datos_invalidos:
    mov DX, offset msg_error_creden
    mov AH, 09
    int 21
    jmp fin

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
    je productos
    cmp AL, 062 ;b
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

productos:
    ;salto antes de imprimir
    mov DX, offset salto
    mov AH, 09
    int 21
    mov DX, offset salto
    mov AH, 09
    int 21

    mov DX, offset opciones_producto
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
    ;tecla escape para el menu principal
    mov DX, offset msg_escape_menu_principal
    mov AH, 09
    int 21
    
    ;solicitar una opcion al usuario
    mov DX, offset promt_m
    mov AH, 09
    int 21

    ;abrir archivo de productos
    mov AL, 02 ;archivo lectura escritura
    mov DX, offset file_product
    mov AH, 3D
    int 21
    ;mensaje de error del archivo
    jc crear_archivo ;  se crea el archivo si no existe
    mov [handle_file_prod], AX ;handle cuando se crea o se habre el archivo 

    ;leer opcion de usuario
    mov AH, 07
    int 21

    cmp AL, 063 ;c
    je crear_producto
    cmp AL, 065 ;e
    ;je teclado_correcto
    cmp AL, 076 ;v
    ;je teclado_correcto
    cmp AL, 1B ;escape
    je menu_loop
    jmp productos

crear_archivo:
    mov DX, offset file_product
    mov CX, 00
    mov AH, 3C
    int 21
    jc error_crear_archivo
    jmp productos

error_crear_archivo:
    mov DX, offset msg_error_create_file_base
    mov AH, 09
    int 21
    jmp menu_loop

crear_producto:
    mov DX, offset salto
    mov AH, 09
    int 21
pedir_codigo:    
    mov DX, offset prod_codigo_name
    mov AH,09
    int 21
    ;entrada en teclado!
    mov DX, offset buffer_teclado
    mov AH, 0A
    int 21
    ;comprobar la cantidad de caracteres >= 4
    mov DI, offset buffer_teclado
    inc DI
    mov AL, [DI]
    cmp AL, 00 ;buffer es igual cero volver a pedir
    je pedir_codigo
    cmp AL, 05
    jb validar_caracteres_codigo ;condigo aceptado
    jmp pedir_codigo

validar_caracteres_codigo:
    mov SI, offset buffer_teclado
    inc SI
    mov CH, 00
    mov CL, [SI] ;copiar cantidad de cadenas en el buffer teclado
    inc SI ;incrementar SI para poscionarse a la primera cadena a validar

;validar los caracteres [A-Z0-9]
validar_cadena_codigo:
    mov AL, [SI]
    cmp AL, 41 ; 'A'
    jb validar_numeros_cod ;caracteres menores a A para buscar numeros
    cmp AL, 5A ; 'Z'
    ja print_caracter_invalido_codigo ;saltar msg caracter invalido mayor que Z
    jmp siguiente_caracter_codigo

validar_numeros_cod:
    cmp AL, 30 ;'0'
    jb  print_caracter_invalido_codigo
    cmp AL, 3A ;':'
    je  print_caracter_invalido_codigo
    cmp AL, 3B ;';'
    je  print_caracter_invalido_codigo
    cmp AL, 3C ;'<'
    je  print_caracter_invalido_codigo
    cmp AL, 3D ;'='
    je  print_caracter_invalido_codigo
    cmp AL, 3E ;'>'
    je  print_caracter_invalido_codigo
    cmp AL, 3F ;'?'
    je  print_caracter_invalido_codigo
    cmp AL, 40 ;'@'
    je  print_caracter_invalido_codigo
    cmp AL, 41 ;'A'
    ja validar_cadena_codigo
    jmp siguiente_caracter_codigo

siguiente_caracter_codigo:
    inc SI
    loop validar_cadena_codigo
    jmp copiar_a_buf_codigo

print_caracter_invalido_codigo:
    mov DX, offset msg_codigo_invalido
    mov AH, 09
    int 21
    jmp pedir_codigo

copiar_a_buf_codigo:
    mov DI, offset buff_prod_codigo
    mov SI, offset buffer_teclado
    inc SI
    mov CH, 00
    mov CL, [SI]
    inc SI
    mov AH, 00    
ciclo_copiar_codigo:
    mov AL, [SI]
    mov [DI], AL
    inc SI
    loop ciclo_copiar_codigo






    ; mov DX, offset prod_descrip_name
    ; mov AH,09
    ; int 21    
    ; mov DX, offset prod_precio_name
    ; mov AH,09
    ; int 21
    ; mov DX, offset prod_unidades_name
    ; mov AH,09
    ; int 21    
    jmp productos
; pedir_codigo:
;     mov 
    


fin:
.EXIT
END    

