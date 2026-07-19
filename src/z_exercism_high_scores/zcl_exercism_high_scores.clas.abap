CLASS zcl_exercism_high_scores DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES integertab TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    METHODS constructor
      IMPORTING
        scores TYPE integertab.

    METHODS list_scores
      RETURNING
        VALUE(result) TYPE integertab.

    METHODS latest
      RETURNING
        VALUE(result) TYPE i.

    METHODS personalbest
      RETURNING
        VALUE(result) TYPE i.

    METHODS personaltopthree
      RETURNING
        VALUE(result) TYPE integertab.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA scores_list TYPE integertab.

ENDCLASS.


CLASS zcl_exercism_high_scores IMPLEMENTATION.

  METHOD constructor.
    me->scores_list = scores.
  ENDMETHOD.

  METHOD list_scores.
    result = scores_list.
  ENDMETHOD.

  METHOD latest.
    result = VALUE #( scores_list[ lines( scores_list ) ] OPTIONAL ).
  ENDMETHOD.

  METHOD personalbest.
    LOOP AT scores_list ASSIGNING FIELD-SYMBOL(<ls_score>).
      IF result < <ls_score>.
        result = <ls_score>.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD personaltopthree.
    DATA(lt_sorted_scores) = scores_list.
    SORT lt_sorted_scores BY table_line DESCENDING.

    APPEND LINES OF lt_sorted_scores FROM 1 TO 3 TO result.
  ENDMETHOD.


ENDCLASS.

