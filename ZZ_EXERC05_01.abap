REPORT zz_exerc05_01.

DATA:  v_idade TYPE i,
       v_conta TYPE i,
       v_ano TYPE i VALUE 2015.

PARAMETERS: ano_nas TYPE i,
            ano_att TYPE i.


v_idade = ano_att - ano_nas.
v_conta = v_ano - ano_nas.



WRITE: / 'IDADE:', v_idade.
WRITE: / 'EM 2015 VOCE TERA:', v_conta.