REPORT zz_exerc07_01.

DATA: v_calc TYPE i.

PARAMETERS: p_num1 TYPE i,
            p_num2 TYPE i.


PERFORM f_calc.

FORM f_calc.

  IF p_num1 > p_num2.
    WRITE p_num1.
  ELSE.
    WRITE p_num2.
  ENDIF.

ENDFORM.