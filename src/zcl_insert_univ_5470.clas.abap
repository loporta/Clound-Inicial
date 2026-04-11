CLASS zcl_insert_univ_5470 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_univ_5470 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA: gt_zuniversity_5470 TYPE TABLE OF zuniversity_5470.

    gt_zuniversity_5470 = VALUE #( ( soc      = 'AT'
                                     exercise = '2025' )

                                   ( soc      = 'XX'
                                     exercise = '2025' )

                                     ( soc    = 'YY'
                                     exercise = '2026' )
                                                         ).

    MODIFY zuniversity_5470 FROM TABLE @gt_zuniversity_5470.
    IF sy-subrc = 0.
      COMMIT WORK AND WAIT.
      out->write( gt_zuniversity_5470 ).
      out->write( 'ok' ).
    ELSE.
      ROLLBACK WORK.
      out->write( 'no ok' ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
