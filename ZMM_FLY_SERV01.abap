REPORT zmm_fly_serv01.

TYPES:
  BEGIN OF ty_flight,
    carrid   TYPE sflight-carrid,
    connid   TYPE sflight-connid,
    fldate   TYPE sflight-fldate,
    price    TYPE sflight-price,
    cityfrom TYPE spfli-cityfrom,
    cityto   TYPE  spfli-cityto,
    airpfrom TYPE spfli-airpfrom,
    airpto   TYPE spfli-airpto,
  END OF ty_flight.


DATA: it_flight TYPE TABLE OF ty_flight,
      t_out    TYPE TABLE OF ZSMM_FLY_SERV01.


SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.
PARAMETERS p_carrid TYPE sflight-carrid.
PARAMETERS p_connid TYPE sflight-connid.SELECTION-SCREEN END OF BLOCK b1.


IF p_connid IS NOT INITIAL.
  SELECT a~carrid a~connid a~fldate a~price b~cityfrom b~cityto b~airpfrom b~airpto
  INTO TABLE t_out
  FROM sflight AS a INNER JOIN spfli AS b
  ON a~carrid = b~carrid AND a~connid = b~connid
  WHERE a~carrid = p_carrid AND a~connid = p_connid.


ELSE.
  SELECT a~carrid a~connid a~fldate a~price b~cityfrom b~cityto b~airpfrom b~airpto
  INTO TABLE t_out
  FROM sflight AS a INNER JOIN spfli AS b
  ON a~carrid = b~carrid
  WHERE a~carrid = p_carrid.


ENDIF.




"""If you want show results in loop, you must create a work area""""
*-----------------------------------------SHOW IN LOOP-------------------------------------------------

a r_grid type ref to cl_gui_alv_grid.
DATA: wa_fieldcat TYPE slis_fieldcat_alv,
      wa_layout   TYPE slis_layout_alv,
      it_fieldcat TYPE slis_t_fieldcat_alv.


PERFORM montar_campos.
PERFORM montar_layout.
PERFORM exibir_alv.


FORM montar_campos.


  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'CARRID'.
  wa_fieldcat-tabname   = 'SFLIGHT'.
  wa_fieldcat-seltext_m = 'Companhia'.
  APPEND wa_fieldcat TO it_fieldcat.

  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'CONNID'.
  wa_fieldcat-tabname   = 'SFLIGHT'.
  wa_fieldcat-seltext_m = 'Cod. do Voo'.
  APPEND wa_fieldcat TO it_fieldcat.

  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'FLDATE'.
  wa_fieldcat-tabname   = 'SFLIGHT'.
  wa_fieldcat-seltext_m = 'Data do voo'.
  APPEND wa_fieldcat TO it_fieldcat.

  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'PRICE'.
  wa_fieldcat-tabname   = 'SFLIGHT'.
  wa_fieldcat-seltext_m = 'Preço'.
  APPEND wa_fieldcat TO it_fieldcat.

  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'CITYFROM'.
  wa_fieldcat-tabname   = 'SPFLI'.
  wa_fieldcat-seltext_m = 'Cidade de partida'.
  APPEND wa_fieldcat TO it_fieldcat.

  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'CITYTO'.
  wa_fieldcat-tabname   = 'SPFLI'.
  wa_fieldcat-seltext_m = 'Cidade de destino'.
  APPEND wa_fieldcat TO it_fieldcat.

  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'AIRPFROM'.
  wa_fieldcat-tabname   = 'SPFLI'.
  wa_fieldcat-seltext_m = 'Aeroporto de partida'.
  APPEND wa_fieldcat TO it_fieldcat.

  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'AIRPTO'.
  wa_fieldcat-tabname   = 'SPFLI'.
  wa_fieldcat-seltext_m = 'Aeroporto de destino'.
  APPEND wa_fieldcat TO it_fieldcat.

ENDFORM.


FORM montar_layout.
  wa_layout-zebra = 'X'.
  wa_layout-colwidth_optimize = 'X'.
ENDFORM.


FORM exibir_alv.


  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program = sy-repid
      i_grid_title       = 'Dados dos Voos'
      is_layout          = wa_layout
      it_fieldcat        = it_fieldcat
    TABLES
      t_outtab           = t_out.


ENDFORM.