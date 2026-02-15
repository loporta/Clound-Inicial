CLASS zcl_lab_02_arithcb9980001709 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_02_ARITHCB9980001709 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "Suma
    DATA: lv_base_rate            TYPE i VALUE 20,
          lv_corp_area_rate       TYPE i VALUE 10,
          lv_medical_service_rate TYPE i VALUE 15.

    DATA(lv_total_rate) = lv_base_rate  + lv_corp_area_rate + lv_medical_service_rate.

    ADD 5 TO lv_total_rate.

    out->write( | { lv_total_rate }  | ).

    "Resta
    DATA: lv_maintenance_rate TYPE i VALUE 30,
          lv_margin_rate      TYPE i VALUE 10.

    DATA(lv_base_rate_resta) = lv_maintenance_rate - lv_margin_rate.

    SUBTRACT 4 FROM lv_base_rate_resta.

    out->write( | { lv_base_rate_resta }  | ).


    "Multipliacion

    DATA: lv_package_weight TYPE i VALUE 2,
          lv_cost_per_kg    TYPE i VALUE 3.

    DATA(lv_multi_rate) = lv_package_weight * lv_cost_per_kg.
    MULTIPLY lv_multi_rate BY 2.

    out->write( | { lv_multi_rate }  | ).


    "Division
    DATA: lv_total_weight TYPE i VALUE 38,
          lv_num_packages TYPE i VALUE 4,
          lv_applied_rate TYPE p LENGTH 8 DECIMALS 2.

    lv_applied_rate = lv_total_weight / lv_num_packages.

    DIVIDE lv_applied_rate BY 3.

    out->write( | { lv_applied_rate }  | ).

    "Division sin resto.
    DATA: lv_total_cost         TYPE i VALUE 17,
          lv_discount_threshold TYPE i VALUE 4,
          lv_result1            TYPE p LENGTH 4 DECIMALS 2.

    lv_result1 = lv_total_cost DIV lv_discount_threshold.
    out->write( | { lv_result1 } | ).


    "Division con resto.
    DATA: lv_total_cost1         TYPE i VALUE 19,
          lv_discount_threshold1 TYPE i VALUE 4,
          lv_remainder           TYPE p LENGTH 4 DECIMALS 2.

    lv_remainder = lv_total_cost1 MOD lv_discount_threshold1.
    out->write( | { lv_remainder } | ).

    "Elevar al cuadrado.

    DATA: lv_weight TYPE i VALUE 5.
    DATA(lv_expo) = 5 ** 2.
    out->write( | { lv_expo } | ).


    DATA: lv_square_root TYPE i.

    lv_square_root = sqrt( lv_expo ).
    out->write( | { lv_square_root } | ).

  ENDMETHOD.
ENDCLASS.
