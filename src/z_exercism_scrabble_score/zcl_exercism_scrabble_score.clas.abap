CLASS zcl_exercism_scrabble_score DEFINITION PUBLIC .

  PUBLIC SECTION.
    METHODS score
      IMPORTING
        input         TYPE string OPTIONAL
      RETURNING
        VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_exercism_scrabble_score IMPLEMENTATION.
  METHOD score.
    DO strlen( input ) TIMES.
      DATA(lv_offset) = sy-index - 1.
      DATA(lv_char)   = input+lv_offset(1).

      IF 'AEIOULNRST' CS lv_char.
        result += 1.
      ELSEIF 'DG' CS lv_char.
        result += 2.
      ELSEIF 'BCMP' CS lv_char.
        result += 3.
      ELSEIF 'FHVWY' CS lv_char.
        result += 4.
      ELSEIF 'K' CS lv_char.
        result += 5.
      ELSEIF 'JX' CS lv_char.
        result += 8.
      ELSEIF 'QZ' CS lv_char.
        result += 10.
      ENDIF.
    ENDDO.
  ENDMETHOD.

ENDCLASS.

