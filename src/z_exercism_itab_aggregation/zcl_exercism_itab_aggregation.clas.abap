CLASS zcl_exercism_itab_aggregation DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_numbers_type,
             group  TYPE group,
             number TYPE i,
           END OF initial_numbers_type,
           initial_numbers TYPE STANDARD TABLE OF initial_numbers_type WITH EMPTY KEY.

    TYPES: BEGIN OF aggregated_data_type,
             group   TYPE group,
             count   TYPE i,
             sum     TYPE i,
             min     TYPE i,
             max     TYPE i,
             average TYPE f,
           END OF aggregated_data_type,
           aggregated_data TYPE STANDARD TABLE OF aggregated_data_type WITH EMPTY KEY.

    METHODS perform_aggregation
      IMPORTING
        initial_numbers        TYPE initial_numbers
      RETURNING
        VALUE(aggregated_data) TYPE aggregated_data.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_exercism_itab_aggregation IMPLEMENTATION.
  METHOD perform_aggregation.
    LOOP AT initial_numbers INTO DATA(row).
      IF line_index( aggregated_data[ group = row-group ] ) = 0.
        APPEND VALUE #( group   = row-group
                        count   = 1
                        sum     = row-number
                        min     = row-number
                        max     = row-number
                        average = row-number
                      ) TO aggregated_data.
      ELSE.
         DATA stats TYPE aggregated_data_type.
         stats = aggregated_data[ group = row-group ].
         stats-count += 1.
         stats-sum   += row-number.
         stats-average = stats-sum / stats-count.

         IF stats-max < row-number.
           stats-max = row-number.
         ENDIF.
         IF stats-min > row-number.
           stats-min = row-number.
         ENDIF.

         aggregated_data[ group = row-group ] = stats.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

