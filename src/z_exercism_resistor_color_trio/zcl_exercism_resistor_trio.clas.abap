CLASS zcl_exercism_resistor_trio DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS class_constructor.
    CLASS-DATA color_table TYPE TABLE OF string WITH EMPTY KEY.
    METHODS label
      IMPORTING
        colors       TYPE string_table
      RETURNING
        VALUE(result) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_exercism_resistor_trio IMPLEMENTATION.

  METHOD class_constructor.
    color_table = VALUE #(
                           ( `black` ) ( `brown` ) ( `red` ) ( `orange` ) ( `yellow` )
                           ( `green` ) ( `blue` ) ( `violet` ) ( `grey` ) ( `white` )
                         ).
  ENDMETHOD.

  METHOD label.
    DATA lv_value TYPE p DECIMALS 1.
    DATA lv_prefix TYPE string.

    LOOP AT colors ASSIGNING FIELD-SYMBOL(<ls_color>) TO 3.
      IF sy-tabix < 3.
        lv_value = lv_value * 10 + line_index( color_table[ table_line = <ls_color> ] ) - 1.
      ELSE.
        DATA(lv_exp) = line_index( color_table[ table_line = <ls_color> ] ) - 1.
        IF lv_value >= 10.
          lv_value = lv_value / 10.
          lv_exp += 1.
        ENDIF.

        IF lv_exp < 3 .
          lv_prefix = ``.
        ELSEIF lv_exp < 6.
          lv_prefix = `kilo`.
          lv_exp -= 3.
        ELSEIF lv_exp < 9.
          lv_prefix = `mega`.
          lv_exp -= 6.
        ELSE.
          lv_prefix = `giga`.
          lv_exp -= 9.
        ENDIF.

        lv_value = lv_value * ipow( base = 10 exp = lv_exp ).
      ENDIF.
    ENDLOOP.

    result = |{ CONV i( lv_value ) } { lv_prefix }ohms|.
  ENDMETHOD.
ENDCLASS.

