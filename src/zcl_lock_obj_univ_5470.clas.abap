CLASS zcl_lock_obj_univ_5470 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lock_obj_univ_5470 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    TRY.
        DATA(ob_cl_block) = cl_abap_lock_object_factory=>get_instance( iv_name = 'EZ_UNIV_LOCK5470' ).
      CATCH cx_abap_lock_failure.
        "handle exception
    ENDTRY.

    DATA: gt_parameter TYPE if_abap_lock_object=>tt_parameter.

    gt_parameter = VALUE #( (  name = 'SOC'
                             value = REF #( 'AT' ) )

                           ).
    TRY.
        ob_cl_block->enqueue(
          it_parameter  = gt_parameter

        ).
      CATCH cx_abap_foreign_lock.
      CATCH cx_abap_lock_failure.

    ENDTRY.


    TRY.
        ob_cl_block->dequeue(
          it_parameter  = gt_parameter
        ).
      CATCH cx_abap_lock_failure.
        "handle exception
    ENDTRY.


  ENDMETHOD.

ENDCLASS.
