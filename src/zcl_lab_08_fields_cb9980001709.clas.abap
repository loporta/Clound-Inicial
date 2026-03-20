CLASS zcl_lab_08_fields_cb9980001709 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_08_fields_cb9980001709 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*1. Declaración
    DATA: lv_employee TYPE string.

    FIELD-SYMBOLS: <lv_employee> TYPE string.

    lv_employee = 'Lorena Porta'.

    ASSIGN lv_employee TO <lv_employee>.

    out->write( <lv_employee> ).


*Declaración en línea

    SELECT *
    FROM zemp_logali
    INTO TABLE @DATA(lt_employees)
    UP TO 5 ROWS.
    IF sy-subrc = 0.
      LOOP AT lt_employees ASSIGNING FIELD-SYMBOL(<ls_employee>).
        <ls_employee>-email = 'lorena.porta ,q'.

        out->write( |{ <ls_employee>-ape1 } {  <ls_employee>-email } | ).
      ENDLOOP.


    ENDIF.


*    Añadir un registro

    APPEND INITIAL LINE TO lt_employees ASSIGNING FIELD-SYMBOL(<lfs_employees>).

    <lfs_employees> = VALUE #( ape1  = 'PORTA'
                               ape2  = 'LOPEZ'
                               email = 'Pruebaq' ).


    out->write( |{ <lfs_employees>-ape1 } {  <lfs_employees>-email } | ).
*    UNASSIGN  <lfs_employees>.

    "Insertar un registro

    INSERT INITIAL LINE INTO lt_employees  ASSIGNING FIELD-SYMBOL(<lfs_employees2>) INDEX 2.

    <lfs_employees2> = VALUE #( ape1  = 'PORTA2'
                               ape2  = 'LOPEZ2'
                               email = 'Pruebaq2' ).
    IF sy-subrc = 0.
      out->write( lt_employees ).
    ENDIF.
*    UNASSIGN <lfs_employees2>.

    READ TABLE lt_employees  ASSIGNING FIELD-SYMBOL(<lfs_employees3>) INDEX 2.
    IF sy-subrc = 0.
      <lfs_employees3> = VALUE #(  ape1  = 'PORTA3'
                                   ape2  = 'LOPEZ3'
                                   email = 'Pruebaq3' ).


      out->write( lt_employees ).
    ENDIF.


*Coerción – Casteo

    TYPES: BEGIN OF ty_data,
             anio TYPE c LENGTH 4,
             mes  TYPE c LENGTH 2,
             dia  TYPE c LENGTH 2,
           END OF ty_data.

    FIELD-SYMBOLS <lfs_employees4> TYPE ty_data.

    DATA(lv_date) = cl_abap_context_info=>get_system_date( ).

    ASSIGN lv_date TO  <lfs_employees4> CASTING.

    out->write( <lfs_employees4>-anio ).
    out->write( <lfs_employees4>-mes ).
    out->write( <lfs_employees4>-dia ).
  ENDMETHOD.

ENDCLASS.
