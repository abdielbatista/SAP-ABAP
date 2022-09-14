REPORT zz_exerc04_01.

DATA: v_media     TYPE p DECIMALS 2,
      v_resultado TYPE char100.

PARAMETERS: p_nota1 TYPE p DECIMALS 2,
            p_nota2 TYPE p DECIMALS 2,
            p_nota3 TYPE p DECIMALS 2,
            p_nota4 TYPE p DECIMALS 2.


START-OF-SELECTION.

  "chamada do form"
  PERFORM f_calc.


FORM f_calc.

  v_media = ( p_nota1 + p_nota2 + p_nota3 + p_nota4 ) / 4.

  WRITE: / 'Média:', v_media.

ENDFORM.