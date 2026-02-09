CLASS zcl_lab_04_cb9980001709 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_lab_04_cb9980001709 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    "Símbolos de texto.

    DATA:texto TYPE string.
    texto = TEXT-001.

    "Funciones de descripción
    DATA: lv_order_status TYPE string VALUE 'Purchase Completed Successfully',
          lv_char_number  TYPE i.

    lv_char_number = strlen( lv_order_status  ).
    out->write( lv_char_number ).

    lv_char_number = numofchar( lv_order_status ).
    out->write( lv_char_number ).

    lv_char_number = find_any_of( val = lv_order_status sub = 'Aa' ).
    out->write( lv_char_number ).

    lv_char_number = find( val = lv_order_status sub = 'Exit' ).
    out->write( lv_char_number ).

    "Funciones de procesamiento

    out->write( | 'UPPER->' { to_upper( lv_order_status ) } | ).

    out->write( | 'LOWER->' { to_lower( lv_order_status ) } | ).

    out->write( | 'MIX->' { to_mixed( lv_order_status ) } | ).

    out->write( | 'Shif Left->' { shift_left( val = lv_order_status circular = 9 ) } | ).


    out->write( | 'substring->' { substring(  val = lv_order_status off = 9 len = 9 )  } | ).
    out->write( | 'reverser->' { reverse( lv_order_status ) } | ).


    "Funciones de contenido

    DATA: lv_string  TYPE string,
          lv_pattern TYPE string VALUE '\d{3}-\d{3}-\d{4}',
          lv_phone   TYPE string VALUE '123-654-7894'.

    IF contains( val = lv_phone pcre = lv_pattern ).
      out->write( ' Si lo contiene' ).
    ELSE.
      out->write( 'No lo contiene' ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
