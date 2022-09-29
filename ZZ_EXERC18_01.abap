REPORT zz_exerc18_01.

DATA: v_cont TYPE i,
      v_hr   TYPE i.

PARAMETERS: p_horas TYPE i,
            p_sal   TYPE i.


PERFORM f_calc.


*&---------------------------------------------------------------------*
*&      Form  F_CALC
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_calc.

  IF p_horas GT 40.

    v_hr = p_horas - 40.

    v_cont = ( ( p_sal * 50 ) / 100 ) * v_hr.

    WRITE v_cont.
  ELSE.
    
    p_sal = p_sal * 40.
    WRITE p_sal.
  ENDIF.

ENDFORM.