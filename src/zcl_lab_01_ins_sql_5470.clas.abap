CLASS zcl_lab_01_ins_sql_5470 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_01_ins_sql_5470 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*    DATA(lw_product) = VALUE zproducts_5470( category_id  = '1'
*                                             client       = sy-mandt
*                                             price        = '12.3'
*                                             product_id   = '00000001'
*                                             product_name = 'Teclado'
*                                             quantity     = '3'
*
*                                           ).
*
*    INSERT zproducts_5470 FROM @lw_product.
*
*
*    INSERT zproducts_5470 FROM TABLE @( VALUE #(    ( category_id  = '2'
*                                                     client       = sy-mandt
*                                                     price        = '11.1'
*                                                     product_id   = '00000002'
*                                                     product_name = 'Teclado'
*                                                     quantity     = '3' )
*
*                                                     ( category_id  = '3'
*                                                     client       = sy-mandt
*                                                     price        = '12.2'
*                                                     product_id   = '00000003'
*                                                     product_name = 'Teclado'
*                                                     quantity     = '3' )
*
*                                                     ( category_id  = '4'
*                                                     client       = sy-mandt
*                                                     price        = '13.3'
*                                                     product_id   = '00000004'
*                                                     product_name = 'Teclado'
*                                                     quantity     = '3' )
*                                                     )
*                                             ).
*
*
*    DATA(lw_product1) = VALUE zproducts_5470(   category_id  = '1'
*                                                client       = sy-mandt
*                                                price        = '12.3'
*                                                product_id   = '00000001'
*                                                product_name = 'Teclado'
*                                                quantity     = '3'
*
*                                                ).
*
*    TRY.
*        INSERT zproducts_5470 FROM @lw_product1.
*      CATCH cx_sy_open_sql_db INTO DATA(lx_error).
*        DATA(lv_error) = lx_error->get_text(  ).
*        out->write( lv_error  ).
*    ENDTRY.
*
*
**    lw_product1-price        = '18.8'.
**
**    UPDATE zproducts_5470 FROM @lw_product1 .
*
*
*    UPDATE zproducts_5470 SET quantity = 20 WHERE category_id  = '2'.
*    IF sy-subrc = 0.
*      out->write( | 'Se actualizaron:'  { sy-dbcnt } | ).
*    ELSE.
*      out->write( | error en la base de datos | ).
*
*    ENDIF.
*
*
*    SELECT *
*    FROM zproducts_5470
*    WHERE category_id   >= '1'
*    INTO TABLE @DATA(gt_pruduc).
*    IF sy-subrc = 0.
*
*      LOOP AT gt_pruduc ASSIGNING FIELD-SYMBOL(<lfs_product>).
*        <lfs_product>-price = 50.
*      ENDLOOP.
*
*      UPDATE zproducts_5470 FROM TABLE @gt_pruduc.
*      IF sy-subrc = 0.
*        out->write( | 'Se actualizaron:'  { sy-dbcnt } | ).
*      ELSE.
*        out->write( | error en la base de datos | ).
*      ENDIF.
*    ENDIF.


*    SELECT *
*        FROM zproducts_5470
*        WHERE category_id   = '1'
*        INTO TABLE @DATA(gt_pruduc).
*    IF sy-subrc = 0.
*
*      LOOP AT gt_pruduc ASSIGNING FIELD-SYMBOL(<lfs_product>).
*        <lfs_product>-quantity = '60'.
*        <lfs_product>-price = '850.99'.
*      ENDLOOP.
*
*
*      MODIFY zproducts_5470 FROM TABLE @gt_pruduc.
*      IF sy-subrc = 0.
*        out->write( | 'Se actualizaron:'  { sy-dbcnt } | ).
*      ELSE.
*        out->write( | error en la base de datos | ).
*      ENDIF.
*    ENDIF.


*    SELECT *
*        FROM zproducts_5470
*        WHERE category_id   = '1'
*        INTO TABLE @DATA(gt_pruduc).
*    IF sy-subrc = 0.
*
*      LOOP AT gt_pruduc ASSIGNING FIELD-SYMBOL(<lfs_product>).
*        <lfs_product>-quantity = '90'.
*        <lfs_product>-price = '850.99'.
*      ENDLOOP.
*
*      READ TABLE gt_pruduc INTO DATA(lw_product) WITH KEY category_id   = '1' BINARY SEARCH.
*      IF sy-subrc = 0.
*        lw_product-category_id = '10'.
*        lw_product-product_name = 'MSI'.
*        APPEND lw_product TO gt_pruduc.
*        CLEAR lw_product.
*      ENDIF.
*
*
*      MODIFY zproducts_5470 FROM TABLE @gt_pruduc.
*      IF sy-subrc = 0.
*        out->write( | 'Se actualizaron:'  { sy-dbcnt } | ).
*      ELSE.
*        out->write( | error en la base de datos | ).
*      ENDIF.
*    ENDIF.


*    SELECT *
*        FROM zproducts_5470
*        WHERE category_id IN ( '1' , '2' )
*        INTO TABLE @DATA(gt_pruduc).
*    IF sy-subrc = 0.
*      DELETE zproducts_5470 FROM TABLE @gt_pruduc.
*      IF sy-subrc = 0.
*        out->write( | 'Se actualizaron:'  { sy-dbcnt } | ).
*      ELSE.
*        out->write( | error en la base de datos | ).
*      ENDIF.
*    ENDIF.
*
*    DELETE FROM zproducts_5470 WHERE quantity > '100'.
*    IF sy-subrc = 0.
*      out->write( | 'Se actualizaron:'  { sy-dbcnt } | ).
*    ELSE.
*      out->write( |No hay registros para borrar | ).
*    ENDIF.


*    INSERT zproducts_5470 FROM @( VALUE #( product_id   = '20'
*                                      product_name = 'ONE PLUS'
*                                      category_id  = '10'
*                                      quantity     = '200'
*                                      price        = '25.99'
*                                      )
*                                 ).
*    IF sy-subrc = 0.
*      COMMIT WORK AND WAIT.
*    ELSE.
*      ROLLBACK WORK.
*    ENDIF.

    UPDATE zproducts_5470 SET price = '20.99' WHERE product_id = '20'.
    IF sy-subrc = 0.
      ROLLBACK WORK.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
