CLASS zcl_lab_03_data_cb9980001709 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_03_data_cb9980001709 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    "Conversiones de Tipo
    DATA: mv_char  TYPE c LENGTH 10 VALUE '12345',
          mv_num   TYPE i,
          mv_float TYPE f.

    mv_num =  mv_char .
    out->write( mv_num ).

    mv_float =  mv_char .
    out->write( mv_float ).


    "Truncamiento y Redondeo

    DATA: mv_trunc TYPE i,
          mv_round TYPE p LENGTH 3 DECIMALS 1.

    mv_float = '123.45'.
    mv_trunc = trunc( mv_float  ).

    mv_round =  round(
                  val  = mv_float
                  dec  = 1
                ) .

    "Declaracion en linea
    DATA(lv_abap) = 'ABAP'.

    " COnversion tipo forzado

    mv_num = CONV i( mv_char ) .
    out->write( mv_num ).

    "Fecha y hora
    DATA: mv_date_1 TYPE d,
          mv_date_2 TYPE d,
          mv_days   TYPE i,
          mv_time   TYPE t.

    mv_date_1 = cl_abap_context_info=>get_system_date(  ).

    mv_days = mv_date_1 - mv_date_2.

    out->write( | { mv_date_1+6(2) } / { mv_date_1+4(2) } / { mv_date_1+0(4)  } | ).

    "Campos Timestamp

    DATA: mv_timestamp TYPE utclong,
          mv_date_2_l  TYPE utclong,
          mv_date_1_l  TYPE utclong.


    mv_timestamp = utclong_current( ).

    mv_date_2_l = utclong_current( ).
    mv_date_1_l = utclong_current( ).

    mv_date_1_l = utclong_add( val = mv_date_2_l  days = 2 ).

    DATA(mv_date_2f) = utclong_diff( high = mv_date_1_l low = mv_date_2_l ).

  ENDMETHOD.

ENDCLASS.
