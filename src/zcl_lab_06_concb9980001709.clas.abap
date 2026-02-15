CLASS zcl_lab_06_concb9980001709 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: lv_string     TYPE string,
          lv_resultado  TYPE string,
          lv_string2    TYPE string,
          lv_resultado2 TYPE string.

    INTERFACES: if_oo_adt_classrun.

    METHODS: m_string IMPORTING lv_string           TYPE string
                      RETURNING VALUE(lv_resultado) TYPE string.
    METHODS: m_SWITCH  IMPORTING lv_string2           TYPE string
                       RETURNING VALUE(lv_resultado2) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_06_concb9980001709 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    "IF / ENDIF
    DATA: lv_conditional TYPE i VALUE '7'.

    IF lv_conditional EQ 7.
      out->write( 'El valor es ingual a 7' ).
    ELSE.
      out->write( 'El valor es no ingual a 7' ).
    ENDIF.
    "Distinto a 7.
    lv_conditional = 9.

    IF lv_conditional EQ 7.
      out->write( 'El valor es ingual a 7' ).
    ELSE.
      out->write( 'El valor es no ingual a 7' ).
    ENDIF.

    "CASE / ENDCASE
    lv_string = 'LOGALI'.
    out->write( | {  me->m_string( lv_string ) } | ).

    lv_string = 'SAP'.
    out->write( | {  me->m_string( lv_string ) } | ).

    lv_string = 'Others'.
    out->write( | {  me->m_string( lv_string ) } | ).



    "DO / ENDDO
    DATA(lv_counter) = 0.
    DO 10 TIMES.
      lv_counter += 1.
    ENDDO.
    out->write( lv_counter ).

    "CHECK.

    lv_counter = 0.
    DO 10 TIMES.
      CHECK lv_counter <= 7.
      lv_counter += 1.
      out->write( lv_counter ).
    ENDDO.

    "SWITCH

    lv_string2 = 'LOGALI'.
    out->write( | {  me->m_SWITCH( lv_string2 ) } | ).

    lv_string2 = 'SAP'.
    out->write( | {  me->m_SWITCH( lv_string2 ) } | ).

    lv_string2 = 'MOVISTAR'.
    out->write( | {  me->m_SWITCH( lv_string2 ) } | ).

    lv_string2 = 'Others'.
    out->write( | {  me->m_SWITCH( lv_string2 ) } | ).


    "COND.
    DATA(lV_TIME) = cl_abap_context_info=>get_system_time( ).
    DATA(lv_tipo) = COND string( WHEN: lv_time <= '120000' THEN 'AM'
                                 WHEN: lv_time >= '120000' THEN 'PM'
                                 WHEN: lv_time =  '120000' THEN 'High Noon' ).
    out->write( lv_tipo ).

    "WHILE / ENDWHILE.
    DATA: lv_counter_2 TYPE i.

    WHILE lv_counter_2 <= 19.
      lv_counter_2 = lv_counter_2  + 1.

      CHECK lv_counter_2 <= 9.
      out->write( lv_counter_2 ).
    ENDWHILE.

    out->write( lv_counter_2 ).

    "LOOP / ENDLOOP.
    TYPES: BEGIN OF ty_id,
             ape2 TYPE string,
             mail TYPE string,
           END OF ty_id.

    DATA: zemp_logali TYPE TABLE OF ty_id,
          lw_id       TYPE ty_id.

    lw_id-ape2 = 'JIMENEZ1'.
    lw_id-mail = 'Prueba1'.
    APPEND lw_id TO zemp_logali.

    CLEAR: lw_id.
    lw_id-ape2 = 'PORTA'.
    lw_id-mail = 'Prueba2'.
    APPEND lw_id TO zemp_logali.

    DATA(lt_employees) = zemp_logali.

    LOOP AT lt_employees INTO DATA(ls_employees) WHERE ape2 = 'JIMENEZ1'.
      out->write( ls_employees-mail ).
    ENDLOOP.

    "TRY / ENDTRY

    TRY.
        DATA: lv_exception TYPE f VALUE '4',
              lv_counter1  TYPE i VALUE '5'.

        DO 5 TIMES.
          lv_counter1 = lv_counter1 - 1.
          lv_exception = lv_exception / lv_counter1.
        ENDDO.
      CATCH cx_sy_zerodivide INTO FINAL(rx).
    ENDTRY.

    out->write( rx->get_text(  ) ).
  ENDMETHOD.

  METHOD m_string.
    CASE: lv_string.
      WHEN: 'LOGALI'.
        lv_resultado = 'Academy'.

      WHEN: 'SAP'.
        lv_resultado = 'Enterprise software' .
      WHEN OTHERS.
        lv_resultado = 'Unknown' .
    ENDCASE.
  ENDMETHOD.

  METHOD m_switch.

    lv_resultado2 = SWITCH string( lv_string2
                                                WHEN 'LOGALI'   THEN |Academy|
                                                WHEN:'SAP'      THEN  |Enterprise software|
                                                WHEN:'MOVISTAR' THEN |Telephony|
                                                ELSE |Unknown| ).

  ENDMETHOD.

ENDCLASS.


