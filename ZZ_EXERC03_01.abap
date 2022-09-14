REPORT zz_exerc03_01.

DATA: v_altura    TYPE i VALUE 5,
      v_base      TYPE i VALUE 3,
      v_alt       TYPE p LENGTH 2 DECIMALS 2.


v_alt = ( ( v_altura * v_base ) / 2 ).

WRITE v_alt.
