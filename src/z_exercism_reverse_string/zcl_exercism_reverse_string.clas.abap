CLASS zcl_exercism_reverse_string DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS reverse_string
      IMPORTING
        input         TYPE string
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.

CLASS zcl_exercism_reverse_string IMPLEMENTATION.

  METHOD reverse_string.
    DATA(lv_len) = strlen( input ).

    DO lv_len TIMES.
      DATA(lv_offset) = lv_len - sy-index.
      DATA(lv_char)   = input+lv_offset(1).

      result = result && lv_char.
    ENDDO.
  ENDMETHOD.

ENDCLASS.

