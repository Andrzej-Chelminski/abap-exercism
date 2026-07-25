CLASS zcl_exercism_line_up DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS format IMPORTING name          TYPE string
                             number        TYPE i
                   RETURNING VALUE(result) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_exercism_line_up IMPLEMENTATION.
  METHOD format.
    DATA(lv_ordinal) = COND string(
                                    WHEN number MOD 100 BETWEEN 11 AND 13 THEN `th`
                                    WHEN number MOD 10 = 1                THEN `st`
                                    WHEN number MOD 10 = 2                THEN `nd`
                                    WHEN number MOD 10 = 3                THEN `rd`
                                    ELSE                                       `th`
                                  ).

    result = |{ name }, you are the { number }{ lv_ordinal } customer we serve today. Thank you!|.
  ENDMETHOD.
ENDCLASS.

