CLASS zcl_exercism_resistor_color DEFINITION PUBLIC CREATE PUBLIC.
  PUBLIC SECTION.
    CLASS-METHODS class_constructor.
    CLASS-DATA color_table TYPE TABLE OF string WITH EMPTY KEY.
    METHODS resistor_color
      IMPORTING
        color_code   TYPE string
      RETURNING
        VALUE(value) TYPE i.

ENDCLASS.

CLASS zcl_exercism_resistor_color IMPLEMENTATION.

  METHOD class_constructor.
    color_table = VALUE #(
                           ( `black` ) ( `brown` ) ( `red` ) ( `orange` ) ( `yellow` )
                           ( `green` ) ( `blue` ) ( `violet` ) ( `grey` ) ( `white` )
                         ).
  ENDMETHOD.

  METHOD resistor_color.
    value = line_index( color_table[ table_line = color_code ] ) - 1.
  ENDMETHOD.

ENDCLASS.

