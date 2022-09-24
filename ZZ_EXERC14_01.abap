REPORT zz_exerc14_01.

DATA: v_menor TYPE i,
      v_maior TYPE i.

PARAMETERS: p_num1 TYPE i,
            p_num2 TYPE i.



PERFORM f_seq_menor.

PERFORM f_seq_maior.



*&---------------------------------------------------------------------*
*&      Form  F_SEQ_MENOR
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_seq_menor.
  
PERFORM f_calc.

  WHILE v_menor LE v_maior.
    WRITE: v_menor.
    v_menor = v_menor + 1.
  ENDWHILE.

ENDFORM.



*&---------------------------------------------------------------------*
*&      Form  F_SEQ_MAIOR
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_seq_maior.

  PERFORM f_calc.

  WHILE v_maior GE v_menor.
    WRITE v_maior.
    v_maior = v_maior - 1.
  ENDWHILE.

ENDFORM.

*&---------------------------------------------------------------------*
*&      Form  F_CALC
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_calc.

  IF p_num1 LT p_num2.
    v_menor = p_num1.
    v_maior = p_num2.
  ELSEIF p_num1 EQ p_num2.
    MESSAGE e208(00) WITH 'OS NUMEROS NÃO PODEM SER IGUAIS!'.
  ELSE.
    v_menor = p_num2.
    v_maior = p_num1.
  ENDIF.

ENDFORM.