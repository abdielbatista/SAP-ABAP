REPORT ZZ_EXERC17_01.

DATA: v_num  TYPE i VALUE 100,
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

  WHILE v_num LE 200.
    IF v_num MOD 2 EQ 1.
      WRITE v_num.
    ENDIF.

    v_num = v_num + 1.

  ENDWHILE.

ENDFORM.