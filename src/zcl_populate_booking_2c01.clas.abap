CLASS zcl_populate_booking_2c01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_populate_booking_2c01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lt_booking TYPE TABLE OF ztb_booking_2c01.
    DATA lt_travel TYPE TABLE OF ztb_travel_2c01.
    DATA lt_suppl TYPE TABLE OF ztb_bookspl_2c01.

    SELECT * FROM /dmo/travel INTO CORRESPONDING FIELDS OF TABLE @lt_travel UP TO 50 ROWS.

    IF sy-subrc EQ 0.

      SELECT * FROM /dmo/booking FOR ALL ENTRIES IN @lt_travel
      WHERE travel_id EQ @lt_travel-travel_id
      INTO CORRESPONDING FIELDS OF TABLE @lt_booking.

      IF sy-subrc EQ 0.
        SELECT * FROM /dmo/book_suppl FOR ALL ENTRIES IN @lt_booking
        WHERE travel_id EQ @lt_booking-travel_id
        AND booking_id EQ  @lt_booking-booking_id
         INTO CORRESPONDING FIELDS OF TABLE @lt_suppl.
      ENDIF.

      MODIFY: ztb_travel_2c01 FROM TABLE @lt_travel,
      ztb_booking_2c01 FROM TABLE @lt_booking,
      ztb_bookspl_2c01 FROM TABLE @lt_suppl.

      out->write('DONE OK').

    ELSE.
      out->write('Fallo en carga de datos Travel').

    ENDIF.

  ENDMETHOD.



ENDCLASS.
