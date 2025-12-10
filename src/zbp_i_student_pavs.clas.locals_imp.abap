CLASS lhc_Student DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Student RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Student RESULT result.
    METHODS setAdmitted FOR MODIFY
      IMPORTING keys FOR ACTION Student~setAdmitted RESULT result.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Student RESULT result.

ENDCLASS.

CLASS lhc_Student IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD get_instance_features.

"Read the status data from entity Student
    READ ENTITIES OF ZI_Student_Pavs IN LOCAL MODE
    ENTITY Student
    FIELDS ( Status ) WITH CORRESPONDING #( keys )
    RESULT DATA(studentadmitted)
    FAILED failed.

"Enable the SetAdmitted button only when the status set to No
    result = VALUE #( FOR stud IN studentadmitted
    LET statusval = COND #( WHEN stud-Status = abap_true
                            THEN if_abap_behv=>fc-o-disabled
                            ELSE if_abap_behv=>fc-o-enabled )
                            IN ( %tky = stud-%tky
                            %action-setAdmitted = statusval )
                            ).

  ENDMETHOD.

  METHOD setAdmitted.
    MODIFY ENTITIES OF ZI_Student_Pavs IN LOCAL MODE
    ENTITY Student
    UPDATE
    FIELDS ( Status )
    WITH VALUE #( FOR key IN keys ( %tky = key-%tky Status = abap_true ) )

    FAILED failed
    REPORTED reported.


    "Get the response updated record
    READ ENTITIES OF ZI_Student_Pavs IN LOCAL MODE
    ENTITY Student
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(studentdata).

    result = VALUE #( FOR studentrec IN studentdata
    ( %tky = studentrec-%tky %param = studentrec )
    ).


  ENDMETHOD.





ENDCLASS.
