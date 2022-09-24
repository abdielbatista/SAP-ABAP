REPORT ZZ_EXERC13_01.

DATA: v_cont TYPE i VALUE 0,
      v_dobro  TYPE i VALUE 1.

PARAMETERS: v_num TYPE i.

START-OF-SELECTION.


PERFORM f_seq.

*&---------------------------------------------------------------------*
*&      Form  F_SEQ
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_seq .

  WHILE v_dobro LE v_num.

     WRITE v_dobro.
     v_dobro = v_dobro * 2.
     
  ENDWHILE.

ENDFORM.