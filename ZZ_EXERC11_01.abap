REPORT zz_exerc11_01.

DATA: v_cont TYPE i VALUE 0.


START-OF-SELECTION.


PERFORM f_seq.

form f_seq.

  WHILE v_cont LE 100.
    WRITE v_cont.
    v_cont = v_cont + 1.
  ENDWHILE.

ENDFORM.