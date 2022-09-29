REPORT zz_exerc15_01.

DATA :  v_numpar TYPE i VALUE '0',
        v_cpar   TYPE i VALUE '0',
        v_soma   TYPE i VALUE '0',
        v_media  TYPE p VALUE '0',
        v_mdpar  TYPE p VALUE '0',
        v_mdigi  TYPE p VALUE '0'.

PARAMETERS :  v_num1 TYPE i,
              v_num2 TYPE i,
              v_num3 TYPE i,
              v_num4 TYPE i,
              v_num5 TYPE i.
* Operações
v_soma = v_num1 + v_num2 + v_num3 + v_num4 + v_num5.
v_media = ( ( v_num1 + v_num2 + v_num3 + v_num4 + v_num5 ) / 5 ).

IF ( ( v_num1 <> v_num2 ) AND ( v_num1 <> v_num3 ) AND ( v_num1 <> v_num4 ) AND ( v_num1 <> v_num5 ) ).
  IF ( v_num2 <> v_num3 ) AND ( v_num2 <> v_num4 ) AND ( v_num2 <> v_num5 ).
    IF ( v_num3 <> v_num4 ) AND ( v_num3 <> v_num5 ).
      IF ( ( v_num4 <> v_num5 ) ).
        IF ( ( v_num1 >= v_num2 ) AND ( v_num1 >= v_num3 ) AND ( v_num1 >= v_num4 ) AND ( v_num1 >= v_num5 ) ).
          WRITE : 'O maior número é: ', v_num1.
        ELSE.
          IF ( v_num2 >= v_num3 ) AND ( v_num2 >= v_num4 ) AND ( v_num2 >= v_num5 ).
            WRITE : 'O maior número é:', v_num2.
          ELSE.
            IF ( v_num3 >= v_num4 ) AND ( v_num3 >= v_num5 ).
              WRITE : 'O maior número é:', v_num3.
            ELSE.
              IF ( v_num4 >= v_num5 ).
                WRITE : 'O maior número é:', v_num4.
              ELSE.
                IF ( v_num5 >= v_num1 ) AND ( v_num5 >= v_num2 ) AND ( v_num5 >= v_num3 ) AND ( v_num5 >= v_num4 ).
                  WRITE : 'O maior número é:', v_num5.
                ELSE.
                  WRITE : 'Digite apenas valores diferentes!'.
                ENDIF.
              ENDIF.
            ENDIF.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDIF.
ELSE.
  WRITE : 'Digite apenas números diferentes!'.
ENDIF.

IF ( ( v_num1 <> v_num2 ) AND ( v_num1 <> v_num3 ) AND ( v_num1 <> v_num4 ) AND ( v_num1 <> v_num5 ) ).
  IF ( v_num2 <> v_num3 ) AND ( v_num2 <> v_num4 ) AND ( v_num2 <> v_num5 ).
    IF ( v_num3 <> v_num4 ) AND ( v_num3 <> v_num5 ).
      IF ( ( v_num4 <> v_num5 ) ).
        IF ( ( v_num1 <= v_num2 ) AND ( v_num1 <= v_num3 ) AND ( v_num1 <= v_num4 ) AND ( v_num1 <= v_num5 ) ).
          WRITE : 'O menor número é: ', v_num1.
        ELSE.
          IF ( v_num2 <= v_num3 ) AND ( v_num2 <= v_num4 ) AND ( v_num2 <= v_num5 ).
            WRITE : 'O menor número é:', v_num2.
          ELSE.
            IF ( v_num3 <= v_num4 ) AND ( v_num3 <= v_num5 ).
              WRITE : 'O menor número é:', v_num3.
            ELSE.
              IF ( v_num4 <= v_num5 ).
                WRITE : 'O menor número é:', v_num4.
              ELSE.
                IF ( v_num5 <= v_num1 ) AND ( v_num5 <= v_num2 ) AND ( v_num5 <= v_num3 ) AND ( v_num5 <= v_num4 ).
                  WRITE : 'O menor número é:', v_num5.
                ELSE.
                  WRITE : 'Digite apenas valores diferentes!'.
                ENDIF.
              ENDIF.
            ENDIF.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDIF.
ELSE.
  WRITE : 'Digite apenas números diferentes!'.
ENDIF.
IF v_num1 MOD 2 = 0.
  v_cpar = v_cpar + 1.
  v_numpar = v_numpar + v_num1.
ENDIF.
IF v_num2 MOD 2 = 0.
  v_cpar = v_cpar + 1.
  v_numpar = v_numpar + v_num2.
ENDIF.
IF v_num3 MOD 2 = 0.
  v_cpar = v_cpar + 1.
  v_numpar = v_numpar + v_num3.
ENDIF.
IF v_num4 MOD 2 = 0.
  v_cpar = v_cpar + 1.
  v_numpar = v_numpar + v_num4.
ENDIF.
IF v_num5 MOD 2 = 0.
  v_cpar = v_cpar + 1.
  v_numpar = v_numpar + v_num5.
ENDIF.

v_soma = v_num1 + v_num2 + v_num3 + v_num4 + v_num5.
v_mdpar =  v_numpar / v_cpar .
v_mdigi = ( ( v_num1 + v_num2 + v_num3 + v_num4 + v_num5 ) / 5 ).
WRITE : / 'Média dos números pares é: ', v_mdpar.
WRITE : / 'Média dos números digitados: ', v_mdigi.
WRITE : / 'Soma dos números digitados: ', v_soma.