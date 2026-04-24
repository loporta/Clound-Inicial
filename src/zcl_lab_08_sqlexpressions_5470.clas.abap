CLASS zcl_lab_08_sqlexpressions_5470 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_08_sqlexpressions_5470 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*    SELECT MAX( price ), MIN( price )
*    FROM zproducts_5470
*    INTO ( @DATA(lv_maximo),  @DATA(lv_minimo) ).
*    IF sy-subrc = 0.
*      out->write( | 'Max:' { lv_maximo } - 'Min:' { lv_minimo }| ).
*    ENDIF.


*    SELECT AVG( price ), SUM( price )
*    FROM zproducts_5470
*    INTO ( @DATA(lv_maximo),  @DATA(lv_minimo) ).
*    IF sy-subrc = 0.
*      out->write( | 'AVG:' { lv_maximo } - 'Total:' { lv_minimo }| ).
*    ENDIF.

*    SELECT DISTINCT MAX( price ), SUM( price )
*    FROM zproducts_5470
*    INTO ( @DATA(lv_maximo),  @DATA(lv_minimo) ).
*    IF sy-subrc = 0.
*      out->write( | 'Max:' { lv_maximo } - 'Min:' { lv_minimo }| ).
*    ENDIF.

*
*    SELECT COUNT( product_id )
*    FROM zproducts_5470
*    INTO ( @DATA(lv_maximo) ).
*    IF sy-subrc = 0.
*      out->write( | 'Cant:' { lv_maximo } | ).
*    ENDIF.


    SELECT product_id, price
    FROM zproducts_5470
    ORDER BY  price ASCENDING
    INTO TABLE  @DATA(gt_maximo)
    OFFSET 3.


    IF sy-subrc = 0.
      out->write( data = gt_maximo ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
