REPORT zz_exerc06_01.

PARAMETERS: p_num TYPE i.

START-OF-SELECTION.

  IF p_num <= 3.
    WRITE p_num.
  ELSE.
    WRITE 'o numero digitado é maior que 3'.
  ENDIF.