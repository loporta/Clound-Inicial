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

    "OVERLAY
    DATA: lv_sale        TYPE string VALUE 'Purchase Completed',
          lv_sale_status TYPE string VALUE 'Invoice'.

    OVERLAY lv_sale WITH lv_sale_status.

    "Función SUBSTRING.
    DATA: lv_result TYPE string VALUE 'SAP-ABAP-32-PE'.

    out->write( lv_result ).
    lv_result = substring( val = lv_result off = 4 len = 4  ).
    out->write( lv_result ).

    "FIND
    DATA: lv_status TYPE string VALUE 'INVOICE GENERATED SUCCESSFULLY',
          lv_count  TYPE i.

    out->write( | { find_any_of( val = lv_status sub = 'GEN' ) } | ).

    lv_count =  count( val = lv_status sub = 'A' ).
    out->write( lv_count  ).


    "REPLACE
    DATA: lv_request TYPE string VALUE 'SAP-ABAP-32-PE'.

    REPLACE ALL OCCURRENCES OF '-' IN lv_request WITH '/'.

    "PCRE Regex
    DATA: lv_regex TYPE string VALUE  '^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$',
          lv_email TYPE string VALUE 'abc@dede.com.ar'.

    FIND PCRE lv_regex IN lv_email.
    IF sy-subrc = 0.
      out->write( 'Formato correcto' ).
    ELSE.
      out->write( 'Formato incorrecto'  ).
    ENDIF.

    "Expresiones regulares
    DATA: lv_idcustome TYPE string VALUE '0000012345'.

    lv_regex = '0*'.

    REPLACE ALL OCCURRENCES OF PCRE lv_Regex IN lv_idcustome WITH ' '.

    out->write( lv_idcustome  ).

    "Repetición de strings
    out->write( | {  repeat( val = lv_idcustome occ = 3 ) } | ).


    "Función ESCAPE

    DATA: lv_format TYPE string VALUE 'Send payment data via Internet'.

    DATA(lv_url) = escape( val = lv_format format = cl_abap_format=>e_html_text ).
    out->write( lv_url  ).

    DATA(lv_json) = escape( val = lv_format format = cl_abap_format=>e_json_string ).
    out->write( lv_json  ).

    DATA(lv_templ) = escape( val = lv_format format = cl_abap_format=>e_string_tpl ).
    out->write( lv_templ  ).



  ENDMETHOD.
ENDCLASS.
