CLASS zcl_lab_06_selectsql_5470 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_06_selectsql_5470 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*    SELECT SINGLE FROM zproducts_5470
*    FIELDS product_name
*    WHERE product_id = '3'
*    INTO @DATA(lv_product_id) BYPASSING BUFFER.
*
*    IF sy-subrc = 0.
*      out->write( |'Nombre del produto' { lv_product_id } | ).
*    ENDIF.


*    SELECT product_id,
*           category_id
*      FROM zproducts_5470
*      APPENDING TABLE @DATA(gt_categoria)
*      UP TO 3 ROWS.
*
*    IF sy-subrc = 0.
*      out->write( name = 'Nombre del produto' data = gt_categoria  ).
*    ENDIF..

*
*    SELECT product_id,
*           price
*      FROM  zproducts_5470
*      INTO TABLE @DATA(gt_price).
*    ENDSELECT.
*
*    out->write( name = 'Nombre del produto' data = gt_price  ).

*
*    SELECT product_id,
*           price
*      FROM  zproducts_5470
*      INTO TABLE @DATA(gt_price)
*      PACKAGE SIZE 2.
*    ENDSELECT.
*    IF sy-subrc = 0.
*      out->write( name = 'Nombre del produto' data = gt_price  ).
*    ENDIF.
*
*    DATA: gt_categoria TYPE TABLE OF zproducts_5470.
*
*    SELECT product_id,
*           category_id
*      FROM zproducts_5470
*      INTO CORRESPONDING FIELDS OF TABLE @gt_categoria.
*
*    IF sy-subrc = 0.
*      out->write( name = 'Nombre del produto' data = gt_categoria  ).
*    ENDIF.

  ENDMETHOD.

ENDCLASS.
