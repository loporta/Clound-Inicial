CLASS zcl_lab_07_tables_cb9980001709 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_07_tables_cb9980001709 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    "Añadir registros
    DATA: mt_employees TYPE STANDARD TABLE OF zemp_logali.

    "APPEND
    DATA: ms_employees TYPE zemp_logali.

    ms_employees-id     = '01'.
    ms_employees-email  = 'Lorena@gmail.com'.
    ms_employees-ape1   = 'Porta'.
    ms_employees-ape2   = 'Alvarez'.
    ms_employees-name   = 'Lorena.'.
    ms_employees-fechan = '20260101'.
    ms_employees-fechaa = '20260102'.
    APPEND ms_employees TO mt_employees.
    CLEAR: ms_employees.

    ms_employees-id     = '02'.
    ms_employees-email  = 'Lorena2@gmail.com'.
    ms_employees-ape1   = 'Porta2'.
    ms_employees-ape2   = 'Alvarez2'.
    ms_employees-name   = 'Lorena2.'.
    ms_employees-fechan = '20260201'.
    ms_employees-fechaa = '20260202'.
    APPEND ms_employees TO mt_employees.
    CLEAR: ms_employees.

    out->write( EXPORTING data = mt_employees name = 'APPEND' ).

    "Value.
    DATA(ms_employees_va) = VALUE zemp_logali(  id = '03'
                                                email  = 'Lorena@gmail.com'
                                                ape1   = 'Porta3'
                                                ape2   = 'Alvarez3'
                                                name   = 'Lorena3.'
                                                fechan = '20260301'
                                                fechaa = '20260302' ) .

    DATA(mt_employees_va) = NEW zemp_logali( ms_employees_va ).

    ms_employees_va = VALUE #( id = '04'
                               email  = 'Lorena@gmail.com'
                               ape1   = 'Porta4'
                               ape2   = 'Alvarez4'
                               name   = 'Lorena4.'
                               fechan = '20260401'
                               fechaa = '20260402'
                                         ).
    mt_employees_va = NEW zemp_logali( ms_employees_va ).

    out->write( EXPORTING data = mt_employees_va name = 'VALUE' ).

    "CORRESPONDING
    DATA: ms_spfli_2 TYPE /dmo/connection.


    SELECT *
        FROM /dmo/connection
        WHERE carrier_id = 'LH'
        INTO TABLE @DATA(mt_spfli).
    IF sy-subrc = 0.
      "MOVE-CORRESPONDING
      READ TABLE mt_spfli INTO DATA(ms_spfli) INDEX 1.
      IF sy-subrc = 0.
        MOVE-CORRESPONDING ms_spfli TO ms_spfli_2.
        "CORRESPONDING #
        ms_spfli_2 = CORRESPONDING #( ms_spfli ).
      ENDIF.

      "READ TABLE con índice
      CLEAR: ms_spfli.
      READ TABLE mt_spfli INTO ms_spfli INDEX 1.
      IF sy-subrc = 0.
        out->write( ms_spfli ).
      ENDIF.

      "READ TABLE con índice
      CLEAR: ms_spfli.
      ms_spfli = VALUE #( mt_spfli[ 1 ] OPTIONAL ) .
      out->write( ms_spfli ).

      "READ TABLE con clave
      CLEAR: ms_spfli.
      READ TABLE mt_spfli INTO ms_spfli WITH KEY airport_to_id = 'FRA'.
      IF sy-subrc = 0.
        out->write( ms_spfli ).
      ENDIF.

      CLEAR: ms_spfli.
      ms_spfli = VALUE #( mt_spfli[ airport_to_id = 'FRA'  ] OPTIONAL ).
      IF sy-subrc = 0.
        out->write( ms_spfli ).
      ENDIF.

      "Chequeo de registros
      IF line_exists( mt_spfli[ connection_id = '0400'  ] ).
        out->write( 'Existe' ).
      ELSE.
        out->write( 'NO Existe' ).
      ENDIF.

      IF line_exists( mt_spfli[ connection_id = '0407'  ] ).
        out->write( 'Existe' ).
      ELSE.
        out->write( 'NO Existe' ).
      ENDIF.

      "Índice de un registro
      DATA(lv_index) = line_index( mt_spfli[ connection_id = '0407'  ] ).
      out->write( lv_index ).

*Sentencia LOOP
      LOOP AT mt_spfli ASSIGNING FIELD-SYMBOL(<lfs_unidad>) WHERE distance_unit = 'KM'.
        out->write( data = <lfs_unidad> name = 'KM' ).
      ENDLOOP.
    ENDIF.


    "FOR
    TYPES: BEGIN OF ty_flights,
             iduser     TYPE c LENGTH 40,
             aircode    TYPE /dmo/carrier_id,
             flightnum  TYPE /dmo/connection_id,
             key        TYPE land1,
             seat       TYPE /dmo/plane_seats_occupied,
             flightdate TYPE /dmo/flight_date,
           END OF ty_FLIGHTS.

    DATA: lt_flights      TYPE STANDARD TABLE OF ty_FLIGHTS,
          lt_flights_info TYPE STANDARD TABLE OF ty_FLIGHTS.

    lt_flights = VALUE #( FOR i = 0 UNTIL i < 15
                  ( iduser    = 1234 + i
                     aircode   = 'SQ'
                     flightnum = 0000 + i
                     key       = 'US'
                     seat      = 0 + i
                     flightdate = cl_abap_context_info=>get_system_date( ) + i ) ).

    lt_flights_info = VALUE #( FOR lw_flights IN lt_flights
                               ( iduser     = lw_flights-iduser
                                 aircode    = 'CL'
                                 flightnum  = lw_flights-flightnum + 10
                                 key        = 'COP'
                                 seat       = lw_flights-seat
                                 flightdate =  lw_flights-flightdate  ) ).

  ENDMETHOD.

ENDCLASS.
