REPORT zz_exerc10_01.

DATA : v_result TYPE p.

PARAMETERS : v_opcao TYPE c LENGTH 3,
             v_op1   TYPE p,
             v_op2   TYPE p.

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

  CASE v_opcao.
    WHEN '+'.
      v_result = v_op1 + v_op2.
      WRITE : 'O resultado: ', v_result.
    WHEN '-'.
      v_result = v_op1 - v_op2.
      WRITE : 'O resultado: ', v_result.
    WHEN '*'.
      v_result = v_op1 * v_op2.
      WRITE : 'O resultado: ', v_result.
    WHEN '/'.
      v_result = v_op1 / v_op2.
      WRITE : 'O resultado: ', v_result.
    WHEN 'MOD'.
      v_result = v_op1 MOD v_op2.
      WRITE : 'O resultado: ', v_result.
    WHEN OTHERS.
      WRITE : 'Inválida'.
  ENDCASE.

ENDFORM.