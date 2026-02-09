CLASS zcl_lab_05_inv_cb9980001709 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_05_inv_cb9980001709 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    "Concatenación
    DATA: mv_exercise     TYPE n LENGTH 4,
          mv_invoice_no   TYPE n  LENGTH 8,
          mv_invoice_code TYPE string.

    mv_exercise = '2026'.
    mv_invoice_no = '123456'.
    CONCATENATE mv_exercise mv_invoice_no INTO mv_invoice_code SEPARATED BY '/'.

    out->write( mv_invoice_code ).

    "Concatenaciones líneas de Tablas

    TYPES: BEGIN OF ty_id,
             id(2) TYPE c,
           END OF ty_id.

    DATA: zemp_logali TYPE TABLE OF ty_id,
          lw_id       TYPE ty_id.

    lw_id-id = '01'.
    APPEND lw_id TO zemp_logali.

    CLEAR: lw_id.
    lw_id-id = '02'.
    APPEND lw_id TO zemp_logali.

    DATA(lt_employees) = zemp_logali.

    DATA(lv_lineof) = concat_lines_of( table = lt_employees sep = space ).
    out->write( lv_lineof ).

    "Condensación

    DATA: mv_case1 TYPE string VALUE 'Sales invoice with status in process',
          mv_case2 TYPE string VALUE '“***ABAP*Cloud***”'.

    CONDENSE mv_case1.
    out->write( mv_case1 ).

    mv_case2 = condense( val = mv_case2 from = '*'  ).
    out->write( mv_case2 ).


    "SPLIT
    DATA: mv_data TYPE string VALUE '0001111111;LOGALI GROUP;2024'.

    SPLIT mv_data AT ';' INTO DATA(mv_id_customer)
                              DATA(mv_customer)
                              DATA(mv_year).

    out->write( mv_id_customer ).
    out->write( mv_customer ).
    out->write( mv_year ).

    "SHIFT
    DATA: mv_invoice_num TYPE string VALUE '2015ABCD'.

    mv_invoice_num = shift_left( val = mv_invoice_num places = 2 ).
    mv_invoice_num = shift_right( val = mv_invoice_num places = 2 ).
    out->write( mv_invoice_num ).


    "Funciones STRLEN y NUMOFCHAR
    DATA(mv_response) = 'Generating Invoice'.

    DATA(mv_count) = strlen( mv_response ).
    out->write( mv_count ).

    CLEAR: mv_count.
    mv_count = numofchar( mv_response ).
    out->write( mv_count ).


    "Funciones TO_LOWER y TO_UPPER
    DATA: mv_translate_invoice TYPE string VALUE 'Report the issuance of this invoice'.

    TRANSLATE mv_translate_invoice TO UPPER CASE.
    out->write( mv_translate_invoice ).

    TRANSLATE mv_translate_invoice TO LOWER CASE.
    out->write( mv_translate_invoice ).

    "Función INSERT y REVERSE

    DATA(lv_char) = strlen(  mv_translate_invoice ).

    DATA(lv_insert) = insert( val = mv_translate_invoice sub = 'to client' off = lv_char ).
    out->write( lv_insert ).

    DATA(lv_reverse) = reverse( mv_translate_invoice ).
    out->write( lv_reverse ).


  ENDMETHOD.

ENDCLASS.
