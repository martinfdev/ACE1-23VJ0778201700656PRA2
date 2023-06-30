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
    titulo_ventas               DB 0A,0A, "====+Ventas+====", "$"
    titulo_herramientas         DB 0A,0A, "====+HERRAMIENTAS+====", "$"
    productos_m                 DB "(p) Productos", 0A, "$"
    ingreso_prod_m              DB "(c) Crear Producto", 0A, "$"
    eliminar_prod_m             DB "(e) Eliminar Producto", 0A, "$"
    ver_prod_m                  DB "(v) Ver Productos", 0A, "$"
    ventas_m                    DB "(v) Ventas", 0A, "$"
    herramientas_m              DB "(h) Herramientas", 0A, "$"
    salir_m                     DB "(s) Salir", 0A, "$"
    promt_m                     DB "Seleccione una opcion: $"
    msg2                        DB "Opcion incorrecto, intenta de nuevo!", 0A, "$"
    file_acces                  DB 'PRA2.CNF',00
    msg_error_open_file_access  DB "Error al abrir el archivo de configuracion", 0A, "Programa terminado!", 0A, "$"
    msg_error_create_file_base  DB 0A,0A, "Error al crear el archivo de productos!", 0A, "$"
    creden_usuario_clave        DB "[credenciales]", "usuario=", 22, "pfrancisco", 22, "clave=", 22, "201700656", 22, 00
    msg_error_creden            DB "Error de autenticacion", 0A, "Programa terminado!", 0A, "$"
    msg_correcto_cred           DB "Credenciales correctas!", 0A, "Presione Enter para continuar: $"
    msg_escape_menu_principal   DB "(Esc) Volver a Menu Principal", 0A, "$"
    msg_codigo_invalido         DB 0A, "Ingrese un codigo valido! $"
    msg_descrip_invalido        DB 0A, "Ingrese una descripcion valida! $"
    msg_numero_cant_invalido    DB 0A, "Ingrese un precio valido!: $"
    msg_numero_unid_invalido    DB 0A, "Ingrese unidades validas!: $"
    msg_error_escribir_archivo  DB 0A, "Error al escribir el archivo!$"
    file_product                DB "PROD.BIN", 00
    temp_buffer                 DB 040 DUP(0)
    handle_file                 DW 0000
    handle_file_prod            DW 0000
    buffer_file                 DB 060 DUP(0)
    buffer_teclado              DB 25, 00
                                DB 21 DUP(0)
    prod_codigo_name            DB 0A, "Codigo: $"
    prod_descrip_name           DB 0A, "Descripcion: $"
    prod_precio_name            DB 0A, "Precio: $"
    prod_unidades_name         	DB 0A, "Unidades: $"
    buff_prod_codigo            DB 05 DUP (0)
    buff_prod_descrip           DB 21 DUP (0)
    buff_prod_precio            DB 02 DUP (0)
    buff_prod_unidades         	DB 02 DUP (0)
    num_price               	DW 0000
    num_units                   DW 0000
    tmp_num_units               DB 00
    msg_sub_totales             DB 0A, "Subtotal: $"
    tmp_total_ventas            DW 0000
    puntero_temp                DW 0000
    cod_prod_temp               DB 05 dup (0)
    ceros                   	DB 2B dup(0)
    buff_tmp_prod_codigo        DB 05 DUP (0), "$"
    buff_tmp_prod_descrip       DB 21 DUP (0), "$"
    op_mostrar_continuar        DB 0A, "(Enter) Continuar $"
    op_mostrar_salir            DB 0A, "(q) Salir $"
    esperando_op_mostrar        DB 0A, "Ingrese una opcion: $"
    file_ventas                 DB "VENTAS.BIN", 00
    msg_no_existe_producto      DB 0A, "El producto no existe!$"
    msg_insuficiente_cantidad   DB 0A, "Cantidad de producto insuficiente!$"
    fin_venta_palabra           DB "fin"
    contador_de_items           DW 0000
    numero_ascii                DB 05 dup (30), "$"
    msg_terminar_venta          DB 0A, "Items maximos 10 "
                                DB 0A, "(Enter) Continuar comprando"   
                                DB 0A, "(f) Menu principal "
                                DB 0A, "Esperando opcion: $"
    handle_file_ventas          DW 0000
    dia                         DB 00
    mes                         DB 00
    ano                         DW 00
    hora                        DB 00
    minuto                      DB 00
    ; segundos                    DB 00
    op_genera_catalogo          DB 0A, "(g) Generar Catalogo Completo$"
    op_report_alfa              DB 0A, "(r) Reporte Alfabetico de productos$"
    op_rep_ventas               DB 0A, "(v) Reporte Ventas$"
    op_rep_producto_sin_existe  DB 0A, "(n) Reporte de productos sin existencia$"
    file_catalog_htm            DB "CATALG.HTM", 00
    handle_catalog_htm          DW 0000
    encabezado_html             DB "<html><body>"
    tam_inicializacion_tabla    DB 3e
    inicializacion_tabla        DB '<table border="1"><tr><td>codigo</td><td>descripcion</td></tr>'
    tam_cierre_tabla            DB 8
    cierre_tabla                DB "</table>"
    tam_footer_html             DB 0e
    footer_html                 DB "</body></html>"
    td_html                     DB "<td>"
    tdc_html                    DB "</td>"
    tr_html                     DB "<tr>"
    trc_html                    DB "</tr>"
    file_rep_ventas             DB "REP.TXT"
    handle_rep_txt              DW 0000
    linea_doble_rep_ventas      DB "================================", 0A ;33 bytes ;21H
    linea_simple_rep_ventas     DB "--------------------------------", 0A ;33 bytes ;21H
    fecha_report_venta          DB "Fecha: " ;07
    nueva_linea_report_venta    DB 0A
    slash_venta                 DB 2F
    dos_puntos                  DB 3A
    hora_report_venta           DB "Hora: " ;06 
    monto_rep                   DB "Monto: " ;07
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
    cmp BX, 0000 ;lo estoy mandando de leer archivo de productos.bin para eliminar
    je productos
    cmp BX, 0001 ;lo estoy mandando desde mostrar productos
    je productos
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
    cmp AL, 076 ;v
    je ventas
    cmp AL, 068 ;h
    je herramientas
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

    ;leer opcion de usuario
    mov AH, 07
    int 21

    cmp AL, 063 ;c
    je crear_producto
    cmp AL, 065 ;e
    je eliminar_producto_de_archivo
    cmp AL, 076 ;v
    je mostrar_productos
    cmp AL, 1B ;escape
    je menu_loop
    jmp productos

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
    inc DI
    loop ciclo_copiar_codigo
pedir_descrip:
    mov DX, offset prod_descrip_name
    mov AH,09
    int 21
    ;entrada en teclado!
    mov DX, offset buffer_teclado
    mov AH, 0A
    int 21
    ;comprobar la cantidad de caracteres >= 32 = hex 20+1 
    mov DI, offset buffer_teclado
    inc DI
    mov AL, [DI]
    cmp AL, 00 ;buffer es igual cero volver a pedir
    je pedir_descrip
    cmp AL, 21
    jb validar_caracteres_descrip ;tamanio aceptado
    jmp pedir_descrip
;validar caracteres aceptados en descripcion
validar_caracteres_descrip:
    mov SI, offset buffer_teclado
    inc SI
    mov CH, 00
    mov CL, [SI] ;copiar cantidad de cadenas en el buffer teclado
    inc SI ;incrementar SI para poscionarse a la primera cadena a validar

validar_cadena_descrip:
    mov AL, [SI]
    cmp AL, 41 ; 'A'
    jb validar_numeros_descrip ;caracteres menores a A para buscar numeros
    cmp AL, 5B ; '['
    je print_caracter_invalido_descrip
    cmp AL, 5C ; '\'
    je print_caracter_invalido_descrip
    cmp AL, 5D ; ']'
    je print_caracter_invalido_descrip
    cmp AL, 5E ; '^'
    je print_caracter_invalido_descrip
    cmp AL, 5F ; '_'
    je print_caracter_invalido_descrip
    cmp AL, 60 ; '`'
    je print_caracter_invalido_descrip
    cmp AL, 7A ; 'z'
    ja print_caracter_invalido_descrip ;saltar msg caracter invalido mayor que z
    jmp siguiente_caracter_descrip

validar_numeros_descrip:
    cmp AL, 2C ; ','
    je siguiente_caracter_descrip
    cmp AL, 2E ; '.'
    je siguiente_caracter_descrip
    cmp AL, 21 ; '!'
    je siguiente_caracter_descrip
    cmp AL, 30 ;'0'
    je siguiente_caracter_descrip
    cmp AL, 31 ;'1'
    je siguiente_caracter_descrip
    cmp AL, 32 ;'2'
    je siguiente_caracter_descrip
    cmp AL, 33 ;'3'
    je siguiente_caracter_descrip
    cmp AL, 34 ;'4'
    je siguiente_caracter_descrip
    cmp AL, 35 ;'5'
    je siguiente_caracter_descrip
    cmp AL, 36 ;'6'
    je siguiente_caracter_descrip
    cmp AL, 37 ;'7'
    je siguiente_caracter_descrip
    cmp AL, 38 ;'8'
    je siguiente_caracter_descrip
    cmp AL, 39 ;'9'
    je siguiente_caracter_descrip
    cmp AL, 41 ;'A'
    ja validar_cadena_descrip
    jmp print_caracter_invalido_descrip

siguiente_caracter_descrip:
    inc SI
    loop validar_cadena_descrip
    jmp copiar_a_buf_descrip ;temporal

print_caracter_invalido_descrip:
    mov DX, offset msg_descrip_invalido
    mov AH, 09
    int 21
    jmp pedir_descrip

copiar_a_buf_descrip:
    mov DI, offset buff_prod_descrip
    mov SI, offset buffer_teclado
    inc SI
    mov CH, 00
    mov CL, [SI]
    inc SI
    mov AH, 00
    jmp ciclo_copiar_descrip    
ciclo_copiar_descrip:
    mov AL, [SI]
    mov [DI], AL
    inc SI
    inc DI
    loop ciclo_copiar_descrip
    jmp pedir_precio

pedir_precio:    
    mov DX, offset prod_precio_name
    mov AH,09
    int 21
    ;entrada en teclado!
    mov DX, offset buffer_teclado
    mov AH, 0A
    int 21
    ;comprobar la cantidad de caracteres >= 2 = hex 02
    mov DI, offset buffer_teclado
    inc DI
    mov AL, [DI]
    cmp AL, 00 ;buffer es igual cero volver a pedir
    je pedir_precio
    cmp AL, 03
    jb salto_es_numero_precio ;tamanio aceptado
    jmp pedir_precio
; procedimeinto para verificar is es numero
es_numero PROC
    push SI
    push AX
    mov SI, offset buffer_teclado
    inc SI
    mov CH, 00
    mov CL, [SI] ; copiar cantidad de cadenas en el buffer teclado
    inc SI ; incrementar SI para poscionarse a la primera cadena a validar
    validar_es_numero:
        mov AL, [SI] 
        cmp AL, 30 
        jb error_numero_invalido ; menor a '0', inválido
        cmp AL, 39 
        ja error_numero_invalido ; mayor a '9', inválido
        inc SI ; avanzar al siguiente carácter
        loop validar_es_numero ; repetir hasta que CX llegue a cero
    pop AX
    pop SI
    ret
es_numero ENDP

error_numero_invalido:
    cmp BX, 0000; se llamo cuando se pide precio crear producto
    je print_cantidad_invalida
    cmp BX, 0001 ; se llamo cuando se pide cantidad crear producto
    je print_unidades_invalida
    cmp BX, 0002 ; se llama cuando se pide cantidad en ventas
    je pedir_cantidad_venta

print_cantidad_invalida:
    mov DX, offset msg_numero_cant_invalido
    mov AH, 09
    int 21
    jmp pedir_precio

salto_es_numero_precio:
    mov BX, 0000 ;bandera para saber si el proc lo llama precio o cantidad
    call es_numero
    call convertir_a_numero
    ;copiar cantidad a buffer de cantidad que esta en el registro AX
    mov DI, offset num_price
    mov [DI], AX
    jmp pedir_unidades

convertir_a_numero PROC
    mov SI, offset buffer_teclado
    inc SI
    mov CL, [SI] ; Cargar la cantidad de caracteres en CL
    inc SI
    mov AX, 00
    mov BX, 00
    convertir_loop:
        mov BL, [SI] ; Cargar el carácter actual en BL
        sub BL, 30
        mov DX, 00A
        mul DX 
        mov BH, 00
        add AX, BX ; Sumar el resultado de la multiplicación al acumulador
        inc SI ; Avanzar al siguiente carácter
        loop convertir_loop ; Repetir hasta que CL llegue a cero
    ret
convertir_a_numero ENDP

pedir_unidades:
    mov DX, offset prod_unidades_name
    mov AH,09
    int 21    
    ;entrada en teclado!
    mov DX, offset buffer_teclado
    mov AH, 0A
    int 21
    ;comprobar la cantidad de caracteres >= 2 = hex 02
    mov DI, offset buffer_teclado
    inc DI
    mov AL, [DI]
    cmp AL, 00 ;buffer es igual cero volver a pedir
    je pedir_unidades
    cmp AL, 03
    jb salto_es_numero_unidades ;tamanio aceptado
    jmp pedir_unidades   

print_unidades_invalida:
    mov DX, offset msg_numero_unid_invalido
    mov AH, 9
    int 21
    jmp pedir_unidades

salto_es_numero_unidades:
    mov BX, 0001
    call es_numero    
    call convertir_a_numero ;devuelve el numero en el registro AX
    mov DI, offset num_units
    mov [DI], AX
    jmp escribir_prods_en_archivo

escribir_prods_en_archivo:
    ;; probar abrirlo normal
    mov AL, 02
	mov AH, 3D
	mov DX, offset file_product
	int 21
	;; si no lo cremos
	jc  crear_archivo_prod
	;; si abre escribimos
	jmp guardar_handle_prod
crear_archivo_prod:
	mov CX, 0000
	mov DX, offset file_product
	mov AH, 3C
	int 21
	;; archivo abierto
guardar_handle_prod:
	;; guardamos handle
	mov [handle_file_prod], AX
	;; obtener handle
	mov BX, [handle_file_prod]
	;; vamos al final del archivo
	mov CX, 00
	mov DX, 00
	mov AL, 02
	mov AH, 42
	int 21
	;; escribir el producto en el archivo
	;; escribí los dos primeros campos
	mov CX, 26
	mov DX, offset buff_prod_codigo
	mov AH, 40
	int 21
	;; escribo los otros dos
	mov CX, 0004
	mov DX, offset num_price
	mov AH, 40
	int 21
	;; cerrar archivo
	mov AH, 3E
	int 21
    jmp productos

eliminar_producto_de_archivo:
    mov DX, 0000
	mov [puntero_temp], DX

pedir_codigo_eliminar:
    mov DX, offset prod_codigo_name
	mov AH, 09
	int 21
	mov DX, offset buffer_teclado
	mov AH, 0A
	int 21
	;;
	mov DI, offset buffer_teclado
	inc DI
	mov AL, [DI]
	cmp AL, 00
	je  pedir_codigo_eliminar
	cmp AL, 05
	jb  aceptar_tam_cod_eliminar  
	mov DX, offset salto
	mov AH, 09
	int 21
	jmp pedir_codigo_eliminar

aceptar_tam_cod_eliminar:
    call validar_campo_codigo
    cmp BX, 0001
    je pedir_codigo_eliminar
    mov DI, offset cod_prod_temp
	mov SI, offset buffer_teclado
	inc SI
	mov CH, 00
	mov CL, [SI]
	inc SI;  posicion en el contenido del buffer
ciclo_copiar_codigo_eliminar:
    mov AL, [SI]
    mov [DI], AL
    inc SI
    inc DI
    loop ciclo_copiar_codigo_eliminar
    mov DX, offset salto
    mov AH, 09
    int 21

    mov AL, 02
    mov DX, offset file_product
    mov AH, 3D
    int 21
    mov BX, 0000
    jc error_abrir_archivo
    mov [handle_file_prod], AX

ciclo_encontrar_codigo_eliminar:
    mov BX, [handle_file_prod]
    mov CX, 26
    mov DX, offset buff_prod_codigo
    mov AH, 3F
    int 21
    mov BX, [handle_file_prod]
    mov CX, 04
    mov DX, offset num_price
    mov AH, 3F
    int 21
    cmp AX, 0000 ;fin de lectura en el archivo
    je finalizar_borrar
    mov DX, [puntero_temp]
    add DX, 2A
    mov [puntero_temp], DX
    ;verificar si es producto valido
    mov AL, 00
    cmp [buff_prod_codigo], AL
    je ciclo_encontrar_codigo_eliminar
    mov SI, offset buffer_teclado
    mov CH, 00
    mov CL, [SI+1]
    mov SI, offset cod_prod_temp
    mov DI, offset buff_prod_codigo 
    call comparar_cadenas_proc
    cmp DL, 0FF
    je borrar_encontrado
    jmp ciclo_encontrar_codigo_eliminar

comparar_cadenas_proc PROC
    ciclo_cadenas_iguales:
        mov AL, [SI]
        cmp [DI], AL
        jne no_son_iguales
        inc SI
        inc DI
        loop ciclo_cadenas_iguales
        mov DL, 0FF ; son iguales
        ret
    no_son_iguales:
        mov DL, 00
        ret
comparar_cadenas_proc ENDP    

finalizar_borrar:
    mov BX, [handle_file_prod]
	mov AH, 3E
	int 21
    jmp productos

borrar_encontrado:
    mov DX, [puntero_temp]
	sub DX, 2A
	mov CX, 0000
	mov BX, [handle_file_prod]
	mov AL, 00
	mov AH, 42
	int 21
	;;; puntero posicionado
	mov CX, 2A
	mov DX, offset ceros
	mov AH, 40
	int 21
    jmp productos

mostrar_productos:
    mov DX, 0000
    mov [puntero_temp], DX
    mov AL, 02
    mov DX, offset file_product
    mov AH, 3D
    int 21
    mov BX, 0001
    jc error_abrir_archivo
    mov [handle_file_prod], AX   
    mov SI, 0000
    
ciclo_mostrar_producto:
    inc SI
    mov BX, [handle_file_prod]
    mov CX, 05
    mov DX, offset buff_tmp_prod_codigo
    mov AH, 3F
    int 21
    mov BX, [handle_file_prod]
    mov CX, 21
    mov DX, offset buff_tmp_prod_descrip
    mov AH, 3F
    int 21
    mov BX, [handle_file_prod]
    mov CX, 04
    mov DX, offset num_price
    mov AH, 3F
    int 21
    cmp AX, 0000 ;fin de lectura en el archivo
    je finalizar_borrar; se utilizar finalizar borrar por regrese el mismo menu y cierra el archivo
    call mostrar_producto_op_productos
    mov DX, [puntero_temp]
    add DX, 2A
    mov [puntero_temp], DX
    cmp SI, 0005
    je opcion_de_usuario
    jmp ciclo_mostrar_producto

opcion_de_usuario:
    mov SI, 0000
    push AX
    push DX
    mov DX, offset salto
    mov AH, 09
    int 21
    mov DX, offset op_mostrar_continuar
    mov AH, 09
    int 21
    mov DX, offset op_mostrar_salir
    mov AH, 09
    int 21
    mov DX, offset esperando_op_mostrar
    mov AH, 09
    int 21
    ;leer opcion de usuario
    mov AH, 07
    int 21
    cmp AL, 71
    je productos
    cmp AL, 0D
    je ciclo_mostrar_producto
    pop DX
    pop AX

mostrar_producto_op_productos:
    push AX
    push DX
    mov DX, offset salto
    mov AH, 09
    int 21
    mov DX, offset prod_codigo_name
    mov AH, 09
    int 21 
    mov DX, offset buff_tmp_prod_codigo
    mov AH, 09
    int 21
    mov DX, offset prod_descrip_name
    mov AH, 09
    int 21
    mov DX, offset buff_tmp_prod_descrip
    mov AH, 09
    int 21
    pop DX
    pop AX 
    ret

validar_campo_codigo PROC
    mov SI, offset buffer_teclado
    inc SI
    mov CH, 00
    mov CL, [SI] ;copiar cantidad de cadenas en el buffer teclado
    inc SI ;incrementar SI para poscionarse a la primera cadena a validar

    ;validar los caracteres [A-Z0-9]
    validar_letras_codigo:
    mov AL, [SI]
    cmp AL, 41 ; 'A'
    jb validar_numeros ;caracteres menores a A para buscar numeros
    cmp AL, 5A ; 'Z'
    ja print_codigo_invalido ;saltar msg caracter invalido mayor que Z
    jmp siguiente_caracter

    validar_numeros:
        cmp AL, 30 ;'0'
        jb  print_codigo_invalido
        cmp AL, 3A ;':'
        je  print_codigo_invalido
        cmp AL, 3B ;';'
        je  print_codigo_invalido
        cmp AL, 3C ;'<'
        je  print_codigo_invalido
        cmp AL, 3D ;'='
        je  print_codigo_invalido
        cmp AL, 3E ;'>'
        je  print_codigo_invalido
        cmp AL, 3F ;'?'
        je  print_codigo_invalido
        cmp AL, 40 ;'@'
        je  print_codigo_invalido
        cmp AL, 41 ;'A'
        ja validar_letras_codigo
        jmp siguiente_caracter

    siguiente_caracter:
        inc SI
        loop validar_letras_codigo
        mov BX, 0000; validacion existosa
        ret 

    print_codigo_invalido:
        mov BX, 0001; el codigo es invalido
        mov DX, offset msg_codigo_invalido
        mov AH, 09
        int 21
        ret
ret
validar_campo_codigo ENDP

ventas:
    mov DX, offset titulo_ventas
    mov AH, 09
    int 21
    
pedir_codigo_venta:
    mov DX, 0000
	mov [puntero_temp], DX
    mov DX, offset prod_codigo_name
    mov AH, 09
    int 21
    ;entrada en teclado!
    mov DX, offset buffer_teclado
    mov AH, 0A
    int 21

    ;comprobar si es palabra fin
    mov DI, offset fin_venta_palabra
	mov SI, offset buffer_teclado
	inc SI
	mov CH, 00
	mov CL, [SI]
	inc SI;  posicion en el contenido del buffer
    call comparar_cadenas_proc
    cmp DL, 0FF
    je menu_loop ;con la palabra fin se termina las ventas regreso a menu

    ;comprobar la cantidad de caracteres >= 4
    mov DI, offset buffer_teclado
    inc DI
    mov AL, [DI]
    cmp AL, 00 ;buffer es igual cero volver a pedir
    je pedir_codigo_venta
    cmp AL, 05
    jb validar_codigo_venta ;condigo aceptado
    jmp pedir_codigo_venta

validar_codigo_venta:
    call validar_campo_codigo
    cmp BX, 0001
    je pedir_codigo_venta
    mov DI, offset cod_prod_temp
	mov SI, offset buffer_teclado
	inc SI
	mov CH, 00
	mov CL, [SI]
	inc SI;  posicion en el contenido del buffer
    
ciclo_copiar_producto_venta:
    mov AL, [SI]
    mov [DI], AL
    inc SI
    inc DI
    loop ciclo_copiar_producto_venta
    mov DX, offset salto
    mov AH, 09
    int 21

    mov AL, 02
    mov DX, offset file_product
    mov AH, 3D
    int 21
    mov BX, 0000
    jc error_abrir_archivo
    mov [handle_file_prod], AX   
         
ciclo_encontrar_codigo_venta:
    mov BX, [handle_file_prod]
    mov CX, 26
    mov DX, offset buff_prod_codigo
    mov AH, 3F
    int 21
    mov BX, [handle_file_prod]
    mov CX, 04
    mov DX, offset num_price
    mov AH, 3F
    int 21
    cmp AX, 0000 ;fin de lectura en el archivo
    je no_producto_venta ;cerrar el archivo msg que no existe el codigo de producto
    mov DX, [puntero_temp]
    add DX, 2A
    mov [puntero_temp], DX
    ;verificar si es producto valido
    mov AL, 00
    cmp [buff_prod_codigo], AL
    je ciclo_encontrar_codigo_venta
    mov SI, offset buffer_teclado
    mov CH, 00
    mov CL, 04
    mov SI, offset cod_prod_temp
    mov DI, offset buff_prod_codigo
    call comparar_cadenas_proc
    cmp DL, 0FF
    je pedir_cantidad_venta
    jmp ciclo_encontrar_codigo_venta

pedir_cantidad_venta:
    mov DX, offset prod_unidades_name
    mov AH, 09
    int 21
    ;entrada en teclado!
    mov DX, offset buffer_teclado
    mov AH, 0A
    int 21
    ;comprobar la cantidad de caracteres >= 02
    mov DI, offset buffer_teclado
    inc DI
    mov AL, [DI]
    cmp AL, 00 ;buffer es igual cero volver a pedir
    je pedir_cantidad_venta
    cmp AL, 03
    jb validar_cantidad_venta ;condigo aceptado
    jmp pedir_cantidad_venta

validar_cantidad_venta:
    mov BX, 0002
    call es_numero
    call convertir_a_numero
    ;guarder el valor numerico en ya convertido obtenido de teclado
    mov DI, offset tmp_num_units
    mov [DI], AX
    ;obtener el valor de unidades en inventario
    mov DI, offset num_units
    mov CX, [DI]
    ;obtener el precio en invetario sistema
    mov DI, offset num_price
    mov BX, [DI]
    ;comparar unidades si es suficiente`
    cmp AX, CX
    ja producto_insuficiente ;mayor que la cantidad en inventario es error
    mov DI, offset num_units
    mov CX, [DI]
    sub CX, AX ;restamos del inventario la venta
    mov [DI], CX ;volvemos copiar las unidades a la memoria
    call modificar_encontrado_venta
hacer_venta:
    mul BX ;multiplicacion de la cantidad por el precio
    mov DI, offset tmp_total_ventas
    mov DX, [DI] ;obtener el subtotal que se lleva hasta ahora
    add DX, AX  ;sumar la nuev cantidad
    mov [DI], DX ;guardar en memoria el subtotal
    mov AX, DX ;mover el valor de DX a AX para mostrar el subtotal
    
    call numero_a_cadena 
    call mostrar_subtotales
    call aumentar_contador_ventas
    call escribir_ventas_en_archivo
    jmp pedir_codigo_venta

;modificar_archivo_prod.bin con nuevas cantidades
modificar_encontrado_venta:
    push AX
    push BX
    push CX
    push DX

    mov DX, [puntero_temp]
	sub DX, 2A
	mov CX, 0000
	mov BX, [handle_file_prod]
	mov AL, 00
	mov AH, 42
	int 21
	;;; puntero posicionado
	mov CX, 26
	mov DX, offset buff_prod_codigo
	mov AH, 40
	int 21
    mov CX, 0004
	mov DX, offset num_price
	mov AH, 40
	int 21
    ;cerrar el archivo
    mov BX, [handle_file_prod]
	mov AH, 3E
	int 21
    pop DX
    pop CX
    pop BX
    pop AX
    ret

aumentar_contador_ventas:
    push SI
    push BX
    mov BX, 0000
    mov SI, offset contador_de_items
    mov BX, [SI]
    inc BX
    mov [SI], BX
    cmp BX, 000A
    je opciones_terminar_venta
    pop BX
    pop SI
    ret

opciones_terminar_venta:
    mov DX, offset msg_terminar_venta
    mov AH, 09
    int 21
    ;leer opcion de usuario
    mov AH, 07
    int 21

    cmp AL, 0D ;Enter
    je limpiar_contador
    cmp AL, 66 ;f
    je menu_loop
    jmp opciones_terminar_venta

limpiar_contador:
    mov BX, 0000
    mov [contador_de_items], BX    
    jmp pedir_codigo_venta

mostrar_subtotales:
    mov DX, offset salto
    mov AH, 09
    int 21
    mov DX, offset msg_sub_totales
    mov AH, 09
    int 21
    mov DX, offset numero_ascii
    mov AH, 09
    int 21
    mov DX, offset salto
    mov AH, 09
    int 21
    ret

producto_insuficiente:
    mov DX, offset msg_insuficiente_cantidad
    mov AH, 09
    int 21
    jmp pedir_cantidad_venta

no_producto_venta:
    mov DX, offset msg_no_existe_producto
    mov AH, 09
    int 21
    jmp ventas  

numero_a_cadena PROC
    mov CX, 0005
	mov DI, offset numero_ascii
    ciclo_poner30s:
		mov BL, 30
		mov [DI], BL
		inc DI
		loop ciclo_poner30s
		;; tenemos '0' en toda la cadena
		mov CX, AX    ; inicializar contador
		mov DI, offset numero_ascii
		add DI, 0004
		;;
    ciclo_convertirAcadena:
            mov BL, [DI]
            inc BL
            mov [DI], BL
            cmp BL, 3a
            je aumentar_siguiente_digito_primera_vez
            loop ciclo_convertirAcadena
            ret
    aumentar_siguiente_digito_primera_vez:
            push DI
    aumentar_siguiente_digito:
            mov BL, 30     ; poner en '0' el actual
            mov [DI], BL
            dec DI         ; puntero a la cadena
            mov BL, [DI]
            inc BL
            mov [DI], BL
            cmp BL, 3a
            je aumentar_siguiente_digito
            pop DI         ; se recupera DI
            loop ciclo_convertirAcadena
    ret
numero_a_cadena ENDP

escribir_ventas_en_archivo:
 ;; probar abrirlo normal
    mov AL, 02
	mov AH, 3D
	mov DX, offset file_ventas
	int 21
	;; si no lo cremos
	jc  crear_archivo_ventas
	;; si abre escribimos
	jmp guardar_handle_ventas  
crear_archivo_ventas:
    mov CX, 0000
	mov DX, offset file_ventas
	mov AH, 3C
	int 21
	;; archivo abierto
guardar_handle_ventas:
    ;; guardamos handle
	mov [handle_file_ventas], AX
	;; obtener handle
	mov BX, [handle_file_ventas]
	;; vamos al final del archivo
	mov CX, 00
	mov DX, 00
	mov AL, 02
	mov AH, 42
	int 21
    ;obtener la fecha
    call get_curret_date
    ;obtener la hora
    call get_current_time
    ;escribir datos de fecha y hora
    mov CX, 06
    mov DX, offset dia
    mov AH, 40
    int 21
    ;escribir el codigo
    mov CX, 05
    mov DX, offset buff_prod_codigo
    mov AH, 40
	int 21
	;; escribir el numeros de unidades
	mov CX, 02
	mov DX, offset tmp_num_units
	mov AH, 40
	int 21
	;; cerrar archivo
	mov AH, 3E
	int 21
    ret

get_curret_date:
   mov CX, 0000
   mov DX, 0000
   mov AH, 2A
   int 21
   mov [dia], DL
   mov [mes], DH
   mov [ano], CX
   ret
get_current_time:
    mov DX, 0000
    mov CX, 0000
    mov AH, 2C
    int 21
    mov [hora], CH
    mov [minuto], CL
    ; mov [segundos], DL
    ret

herramientas:
    mov DX, offset titulo_herramientas
    mov AH, 09
    int 21
    mov DX, offset op_genera_catalogo
    mov AH, 09
    int 21
    mov DX, offset op_report_alfa
    mov AH, 09
    int 21
    mov DX, offset op_rep_ventas
    mov AH, 09
    int 21
    mov DX, offset op_rep_producto_sin_existe
    mov AH, 09
    int 21
    mov DX, offset salto
    mov AH, 09
    int 21
    mov DX, offset msg_escape_menu_principal
    mov AH, 09
    int 21    
    mov DX, offset salto
    mov AH, 09
    int 21
    mov DX, offset promt_m
    mov AH, 09
    int 21

    ;esperando opciones
    mov AH, 07
    int 21
    cmp AL, 1B
    je menu_loop
    cmp AL, 67
    je generar_catalogo_completo
    cmp AL, 76 ;v
    je reporte_ventas
    jmp herramientas

generar_catalogo_completo:
    call get_current_time
    call get_curret_date
    ;crear el archivo CATALG.HTM"
    mov CX, 0000
    mov DX, offset file_catalog_htm
    mov AH, 3C
    int 21
    ;guardamos el handle
    mov [handle_catalog_htm], AX
    ; obtener el handle
    mov BX, [handle_catalog_htm]
    ;escribimos siempre al final der archivo
	mov CX, 00
	mov DX, 00
	mov AL, 02
	mov AH, 42
	int 21


    ;escribimos el encabezado
    mov CX, 0C
    mov DX, offset encabezado_html
    mov AH, 40
    int 21
    ;inicializacion de tabla
    call escribir_fecha_generado


    mov CX, 3E
    mov DX, offset inicializacion_tabla
    mov AH, 40
    int 21

    ;abrir el contenido del archivo productos
    mov AL, 02
	mov AH, 3D
	mov DX, offset file_product
	int 21
    ;;
	mov [handle_file_prod], AX

ciclo_escribir_tablas:
   ;; puntero cierta posición
	mov BX, [handle_file_prod]
	mov CX, 26     ;; leer 26h bytes
	mov DX, offset buff_prod_codigo
	mov AH, 3F
	int 21
	;; puntero avanzó
	mov BX, [handle_file_prod]
	mov CX, 0004
	mov DX, offset num_price
	mov AH, 3F
	int 21
	;; ¿cuántos bytes leímos?
	;; si se leyeron 0 bytes entonces se terminó el archivo...
	cmp AX, 00
	je fin_escribir_tablas
	;; ver si es producto válido
	mov AL, 00
	cmp [buff_prod_codigo], AL
	je ciclo_escribir_tablas
	;; producto en estructura
	call imprimir_estructura_html
	jmp ciclo_escribir_tablas

imprimir_estructura_html:
	mov BX, [handle_catalog_htm]
	mov AH, 40
	mov CH, 00
	mov CL, 04
	mov DX, offset tr_html
	int 21
	;;
	mov BX, [handle_catalog_htm]
	mov AH, 40
	mov CH, 00
	mov CL, 04
	mov DX, offset td_html
	int 21
	;;
	mov DX, offset buff_prod_codigo
	mov SI, 0000
ciclo_escribir_codigo:
	mov DI, DX
	mov AL, [DI]
	cmp AL, 00
	je escribir_desc
	cmp SI, 0006
	je escribir_desc
	mov CX, 0001
	mov BX, [handle_catalog_htm]
	mov AH, 40
	int 21
	inc DX
	inc SI
	jmp ciclo_escribir_codigo
escribir_desc:
	;;
	mov BX, [handle_catalog_htm]
	mov AH, 40
	mov CH, 00
	mov CL, 05
	mov DX, offset tdc_html
	int 21
	;;
	mov BX, [handle_catalog_htm]
	mov AH, 40
	mov CH, 00
	mov CL, 04
	mov DX, offset td_html
	int 21
	;;
	mov DX, offset buff_prod_descrip
	mov SI, 0000
ciclo_escribir_desc:
	mov DI, DX
	mov AL, [DI]
	cmp AL, 00
	je cerrar_tags
	cmp SI, 0026
	je cerrar_tags
	mov CX, 0001
	mov BX, [handle_catalog_htm]
	mov AH, 40
	int 21
	inc DX
	inc SI
	jmp ciclo_escribir_desc
	;;
cerrar_tags:
	mov BX, [handle_catalog_htm]
	mov AH, 40
	mov CH, 00
	mov CL, 05
	mov DX, offset tdc_html
	int 21
	mov BX, [handle_catalog_htm]
	mov AH, 40
	mov CH, 00
	mov CL, 05
	mov DX, offset trc_html
	int 21
	ret

fin_escribir_tablas:
    mov CX, 08
    mov DX, offset cierre_tabla
    mov AH, 40
    int 21

    ;cerramos las etiquetas
    mov CX, 0E
    mov DX, offset footer_html
    mov AH, 40
    int 21
   
    ;cerramos el archivo
    mov BX, [handle_catalog_htm]
	mov AH, 3E
	int 21
    jmp herramientas

reporte_ventas:
    ;genera la fecha
    call get_curret_date
    call get_current_time
    ;crear el archivo REP.TXT"
    mov CX, 0000
    mov DX, offset file_rep_ventas
    mov AH, 3C
    int 21
    ;guardamos el handle
    mov [handle_rep_txt], AX
    ; obtener el handle
    mov BX, [handle_rep_txt]
    ;escribimos siempre al final der archivo
	mov CX, 00
	mov DX, 00
	mov AL, 02
	mov AH, 42
	int 21
    
    ;escribir fecha existente en variables
    call escribir_fecha_generado

    ;escribimos linea doble
    mov CX, 21
    mov DX, offset linea_doble_rep_ventas
    mov AH, 40
    int 21

    call generar_contenido_rep_ventas

escribir_fecha_generado:
    ;escribimos el encabezado
    mov CX, 07
    mov DX, offset fecha_report_venta
    mov AH, 40
    int 21
    
    ;escribir dia
    push BX
    call generar_fecha_dia
    pop BX
    
    mov CX, 05
    mov DX, offset numero_ascii
    mov AH, 40
    int 21

    call slash_separador_fecha
    ;escribir mes
    push BX
    call generar_fecha_mes
    pop BX
    
    mov CX, 05
    mov DX, offset numero_ascii
    mov AH, 40
    int 21

    call slash_separador_fecha
    ;escribir anio
    push BX
    call generar_fecha_anio
    pop BX
    
    mov CX, 05
    mov DX, offset numero_ascii
    mov AH, 40
    int 21
    
    call escribir_nueva_linea

    ;escribir titulo hora
    mov CX, 06
    mov DX, offset hora_report_venta
    mov AH, 40
    int 21

    ;escribir hora
    push BX
    call generar_fecha_hora
    pop BX
    
    mov CX, 05
    mov DX, offset numero_ascii
    mov AH, 40
    int 21

    call dospuntos_separador_fecha

    ;escribir minutos
    push BX
    call generar_fecha_minuto
    pop BX
    
    mov CX, 05
    mov DX, offset numero_ascii
    mov AH, 40
    int 21

    call escribir_nueva_linea
    ret

generar_fecha_dia:
    ;obtenemos la fecha y la hora
    mov AX, 0000
    mov AL, [dia]
    call numero_a_cadena
    ret
generar_fecha_mes:
    ;obtenemos la fecha y la hora
    mov AX, 0000
    mov AL, [mes]
    call numero_a_cadena
    ret
generar_fecha_anio:
    ;obtenemos la fecha y la hora
    mov AX, 0000
    mov AX, [ano]
    call numero_a_cadena
    ret

generar_fecha_hora:
    ;obtenemos la fecha y la hora
    mov AX, 0000
    mov AL, [hora]
    call numero_a_cadena
    ret

generar_fecha_minuto:
    ;obtenemos la fecha y la hora
    mov AX, 0000
    mov AL, [minuto]
    call numero_a_cadena
    ret

escribir_nueva_linea:
    mov CX, 01
    mov DX, offset nueva_linea_report_venta
    mov AH, 40
    int 21
    ret
slash_separador_fecha:
    mov CX, 01
    mov DX, offset slash_venta
    mov AH, 40
    int 21
    ret
dospuntos_separador_fecha:
    mov CX, 01
    mov DX, offset dos_puntos
    mov AH, 40
    int 21
    ret
escribir_linea_simple:
    mov CX, 21
    mov DX, offset linea_simple_rep_ventas
    mov AH, 40
    int 21
    ret

generar_contenido_rep_ventas:
    ;abrir el contenido del archivo productos
    mov AL, 02
	mov AH, 3D
	mov DX, offset file_ventas
	int 21
    ;;
	mov [handle_file_ventas], AX
    mov SI, 0000
ciclo_escribir_ventas:
    inc SI
    ;obtenemos el nombre del producto
    ;; puntero cierta posición
	mov BX, [handle_file_ventas]
	mov CX, 06     ;; leer 26h bytes
	mov DX, offset dia
	mov AH, 3F
	int 21
	;; puntero avanzó
	mov BX, [handle_file_ventas]
	mov CX, 0005
	mov DX, offset buff_prod_codigo
	mov AH, 3F
	int 21
    ;; puntero avanzó
	mov BX, [handle_file_ventas]
	mov CX, 02
	mov DX, offset tmp_num_units
	mov AH, 3F
	int 21
	;; ¿cuántos bytes leímos?
    int 03
	;; si se leyeron 0 bytes entonces se terminó el archivo...
	cmp AX, 00
	je fin_escribir_ventas
	;; ver si es producto válido
    mov AL, 00
	cmp [tmp_num_units], AL
	je fin_escribir_ventas
    cmp SI, 005
	je fin_escribir_ventas
	call escribir_producto_reporte_venta
    jmp ciclo_escribir_ventas

escribir_producto_reporte_venta:
    mov BX, [handle_rep_txt]
    ;escribimos siempre al final der archivo
	mov CX, 00
	mov DX, 00
	mov AL, 02
	mov AH, 42
	int 21
    call escribir_fecha_generado
    ;escribir titulo monto
    mov CX, 07
    mov DX, offset monto_rep
    mov AH, 40
    int 21
    ;convertir el precion en numero
    push BX
    mov AX, 0000
    mov AL, [tmp_num_units]
    call numero_a_cadena
    pop BX
    ;-----------------
    mov CX, 05
    mov DX, offset numero_ascii
    mov AH, 40
    int 21
    call escribir_nueva_linea
    call escribir_linea_simple
    ret

fin_escribir_ventas:
    ;cerramos el archivo
    mov BX, [handle_rep_txt]
	mov AH, 3E
	int 21
    jmp herramientas

fin:
.EXIT
END