CLASS zcl_exercism_resistor_duo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS class_constructor.
    CLASS-DATA color_table TYPE TABLE OF string WITH EMPTY KEY.
    METHODS value
      IMPORTING
        colors       TYPE string_table
      RETURNING
        VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_exercism_resistor_duo IMPLEMENTATION.

  METHOD class_constructor.
    color_table = VALUE #(
                           ( `black` ) ( `brown` ) ( `red` ) ( `orange` ) ( `yellow` )
                           ( `green` ) ( `blue` ) ( `violet` ) ( `grey` ) ( `white` )
                         ).
  ENDMETHOD.

  METHOD value.
    LOOP AT colors ASSIGNING FIELD-SYMBOL(<ls_color>) TO 2.
      result = result * 10 + line_index( color_table[ table_line = <ls_color> ] ) - 1.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.

