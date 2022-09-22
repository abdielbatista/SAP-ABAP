REPORT zhr_teste_col01.

TABLES: sflight.

DATA: it_sflight TYPE TABLE OF sflight. "tabela interna para receber dados do sql"


PARAMETERS: p_carrid TYPE sflight-carrid,
            p_connid TYPE sflight-connid. "os parametros recebem o mesmo tipo do campo da tabela"

SELECT-OPTIONS: s_fldate FOR sflight-fldate.

START-OF-SELECTION.

  "buscar os dados"
  PERFORM busca_dados.


  "mostrar os dados"
  PERFORM mostra_dados.



FORM busca_dados.

  SELECT *
    FROM sflight
    INTO TABLE it_sflight
    WHERE carrid EQ p_carrid
      AND connid EQ p_connid
      AND fldate IN s_fldate.

  IF SY-SUBRC NE 0.
    MESSAGE 'Nenhum dado encontrado' type 'E'.
  ENDIF.

ENDFORM.

FORM mostra_dados.
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
   EXPORTING
     I_STRUCTURE_NAME                  = 'SFLIGHT'
    TABLES
      t_outtab                          = IT_SFLIGHT
   EXCEPTIONS
     PROGRAM_ERROR                     = 1
            .
  IF SY-SUBRC <> 0.

    ENDIF.

ENDFORM.