CLASS zcl_lab_09_struc_cb9980001709 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_09_struc_cb9980001709 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*  Declaración estructuras
    TYPES: BEGIN OF ty_flights,
             iduser(40) TYPE  c,
             aircode    TYPE /dmo/carrier_id,
             flightnum  TYPE /dmo/connection_id,
             key        TYPE land1,
             seat       TYPE /dmo/plane_seats_occupied,
             flightdate TYPE /dmo/flight_date,
           END OF ty_flights.

    TYPES: BEGIN OF ty_airlines,
             carrid    TYPE /dmo/carrier_id,
             connid    TYPE /dmo/connection_id,
             countryfr TYPE land1,
             cityfrom  TYPE /dmo/city,
             airpfrom  TYPE /dmo/airport_id,
             countryto TYPE land1,
           END OF ty_airlines.

    "Estructuras anidadas (NESTED)
    DATA:BEGIN OF ty_nested,
           flights  TYPE   ty_flights,
           airlines TYPE ty_airlines,
         END OF  ty_nested.

    "Estructuras complejas (DEEP)
    DATA: BEGIN OF ty_deep,
            carrid  TYPE /dmo/carrier_id,
            connid  TYPE /dmo/connection_id,
            flights TYPE ty_flights,
          END OF ty_deep.

    "Añadir datos

    DATA: ls_flights  TYPE ty_flights,
          ls_airlines TYPE ty_airlines.


    ls_flights  = VALUE #( iduser = 'HOLA' aircode = '01' flightnum = 1 key = 'AR' seat = '11' flightdate = '20260102' ).
    ls_airlines = VALUE #( carrid = '01'  connid  = '02' countryfr = 'AR'  cityfrom  = 'Bs. As' airpfrom  = '01' countryto  = 'LA' ).
    ty_nested   = VALUE #( flights = ls_flights airlines = ls_airlines ).
    ty_deep     = VALUE #( carrid = '01' connid = '02' flights = ls_flights ).

    out->Write( ls_flights ).
    out->Write( ls_airlines ).
    out->Write( ty_nested ).
    out->Write( ty_deep ).


    "Estructura INCLUDE


    "Eliminar datos.
    CLEAR: ty_nested, ty_deep.
    out->Write( ty_nested ).
    out->Write( ty_deep ).

  ENDMETHOD.

ENDCLASS.
