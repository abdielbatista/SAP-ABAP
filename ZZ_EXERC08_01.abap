REPORT zz_exerc08_01.

DATA: v_calc TYPE i.

PARAMETERS: p_num TYPE i.


START-OF-SELECTION.

  PERFORM f_calc.

*&---------------------------------------------------------------------*
*&      Form  F_CALC
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_calc .

  IF p_num MOD 2 EQ 0.
    WRITE 'Esse numero é par'.
  ELSE.
    WRITE 'Esse numero não é par'.
  ENDIF.

ENDFORM.