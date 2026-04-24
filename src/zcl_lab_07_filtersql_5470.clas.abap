CLASS zcl_lab_07_filtersql_5470 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_07_filtersql_5470 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*    SELECT FROM zproducts_5470
*    FIELDS *
*    WHERE price GE '100'
*    INTO TABLE @DATA(gt_eq).
*    IF sy-subrc = 0.
*      out->write( data = gt_eq ).
*    ENDIF.


*    SELECT FROM zproducts_5470
*    FIELDS *
*    WHERE price BETWEEN '100' AND '1000'
*    INTO TABLE @DATA(gt_between).
*    IF sy-subrc = 0.
*      out->write( data = gt_between ).
*    ENDIF.

*    SELECT FROM zproducts_5470
*      FIELDS category_id
*      WHERE product_name LIKE '%S'
*      INTO TABLE @DATA(gt_like).
*
*    IF sy-subrc = 0 AND gt_like IS NOT INITIAL.
*      out->write( data = gt_like ).
*    ELSE.
*      out->write( 'No se encontraron resultados' ).
*    ENDIF.

  ENDMETHOD.

ENDCLASS.
