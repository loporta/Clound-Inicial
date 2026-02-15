CLASS zcl_lab_01_var_cb9980001709 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_01_VAR_CB9980001709 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    CONSTANTS: mc_purchase_date TYPE d VALUE '20260130',
               mc_purchase_time TYPE t VALUE '120130',
               mc_type          TYPE c LENGTH 10 VALUE 'PC',
               mc_shipping      TYPE p LENGTH 8 DECIMALS 2 VALUE '40.36',
               mc_id_code       TYPE n LENGTH 4 VALUE '1110',
               mc_qr_code       TYPE x LENGTH 5 VALUE 'F5CF',
               mc_product       TYPE string VALUE 'Laptop',
               mc_bar_code      TYPE xstring VALUE '121211212110'.

    DATA: mv_purchase_date TYPE d,
          mv_purchase_time TYPE t.

    DATA(mv_increase) = '20,5'.
    DATA(mv_discounts) = '10.5'.

    DATA: mv_type     TYPE c LENGTH 10 VALUE mc_type,
          mv_shipping TYPE p LENGTH 8 DECIMALS 2 VALUE  mc_shipping.

    DATA: mv_id_code TYPE n LENGTH 4 VALUE mc_id_code,
          mv_qr_code TYPE x LENGTH 5 VALUE  mc_qr_code.

    TYPES: BEGIN OF mty_customer,
             id       TYPE i,
             customer TYPE c LENGTH 15,
             age      TYPE i,
           END OF mty_customer.

    DATA: customer TYPE mty_customer.
    customer = VALUE #( id = 1
                        Customer = 'Lorena Porta'
                        age = 48 ).

    DATA: ms_employees TYPE REF TO /dmo/employee_hr.
    DATA: lt_employees TYPE TABLE OF REF TO /dmo/employee_hr.



    DATA(mv_product) = mc_product.
    DATA(mv_bar_code) = mc_bar_code.

    mv_purchase_date = mc_purchase_date.
    mv_purchase_time = mc_purchase_time.

    ms_employees->employee = 00000001.
    ms_employees->first_name = 'lORNA'.
*"    Friedrich,Meier,128147.24,EUR,00000000
    APPEND ms_employees TO lt_employees.

    out->write( | 'Fecha:' { mv_purchase_date } 'Hora:' { mv_purchase_time } | ).
    out->write( | Id: { customer-id }; Customer: { customer-Customer }; Age: { customer-age } | ).

    LOOP AT lt_employees INTO ms_employees.
      out->write( |{ ms_employees->first_name } { ms_employees->employee } { ms_employees->last_name } { ms_employees->salary_currency } { ms_employees->salary } { ms_employees->manager }| ).

    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
