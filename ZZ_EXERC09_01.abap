REPORT zz_exerc09_01.


DATA : v_mcon  TYPE p LENGTH 2 DECIMALS 1 VALUE '62.1',
       v_fcon  TYPE p LENGTH 2 DECIMALS 1 VALUE '72.7',
       v_sexom TYPE p LENGTH 2 DECIMALS 1 VALUE '44.7',
       v_sexof TYPE i VALUE '58',
       v_pesoi TYPE p.


PARAMETERS: v_sexo TYPE c,
            v_alt  TYPE p LENGTH 2 DECIMALS 2.


PERFORM f_peso.

*&---------------------------------------------------------------------*
*&      Form  F_PESO
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_peso .

  CASE v_sexo.
    WHEN 'F'.
      v_pesoi =  ( v_fcon * v_alt ) - v_sexof.
      WRITE : 'O peso ideal é: ', v_pesoi,'kg'.
    WHEN 'M'.
      v_pesoi = ( v_mcon * v_alt ) - v_sexom.
      WRITE : 'O peso ideal é: ', v_pesoi,'kg'.
    WHEN OTHERS.
      WRITE 'Opção inválida'.

  ENDCASE.

ENDFORM.