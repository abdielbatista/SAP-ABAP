REPORT zz_exerc01_02.

DATA:  v_a TYPE i VALUE 3,
       v_b TYPE i VALUE 2,
       v_c TYPE i VALUE 5.

"A > B"
IF v_a GT v_b.
  WRITE AT / 'A > B: VERDADEIRO'.
ELSE.
  WRITE AT /  'A > B: FALSO'.
ENDIF.


"B = A"
IF v_b EQ v_a.
  WRITE AT / 'B = A: VERDADEIRO'.
ELSE.
  WRITE AT / 'B = A: FALSO'.
ENDIF.


"(A >= B) AND (C <> 5)"
IF ( v_a GE v_b ) AND ( v_c NE 5 ).
  WRITE AT / '(A >= B) AND (C <> 5): VERDADEIRO'.
ELSE.
  WRITE AT / '(A >= B) AND (C <> 5): FALSO'.
ENDIF.


"(B < A) OR (A = 3)"
IF ( v_b LT v_a ) OR ( v_a EQ 3 ).
  WRITE AT / '(B < A) OR (A = 3): VERDADEIRO'.
ELSE.
  WRITE AT / '(B < A) OR (A = 3): FALSO'.
ENDIF.


"(A > B) OR (A = 3)"
IF ( v_a GT v_b ) OR ( v_a EQ 3 ).
  WRITE AT / '(A > B) OR (A = 3): VERDADEIRO'.
ELSE.
  WRITE AT / '(A > B) OR (A = 3): FALSO'.
ENDIF.


"(C <= 7) AND (B > 0) AND (C > A)"
IF ( v_c LE 7 ) AND ( v_b GT 0 ) AND ( v_c GT v_a ).
  WRITE AT / '(C <= 7) AND (B > 0) AND (C > A): VERDADEIRO'.
ELSE.
  WRITE AT / '(C <= 7) AND (B > 0) AND (C > A): FALSO'.
ENDIF.