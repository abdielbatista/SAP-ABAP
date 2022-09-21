REPORT zz_exerc12_01.

DATA: v_cont TYPE i VALUE 0,
      v_calc TYPE i.

PARAMETERS: p_tab TYPE i.

PERFORM f_tab.


*&---------------------------------------------------------------------*
*&      Form  F_TAB
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_tab .
  WHILE v_cont LE 10.

    v_calc = p_tab * v_cont.

    WRITE: / p_tab, 'x', v_cont, '=', v_calc.

    v_cont = v_cont + 1.

  ENDWHILE.

ENDFORM.