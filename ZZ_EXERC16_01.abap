REPORT zz_exerc16_01.

DATA: v_num  TYPE i VALUE 1,
      v_cont TYPE i VALUE 0.


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

  WHILE v_num LE 500.
    IF v_num MOD 3 EQ 0.
      v_cont = v_cont + v_num.
    ENDIF.

    v_num = v_num + 1.

  ENDWHILE.

  WRITE v_num.

ENDFORM.