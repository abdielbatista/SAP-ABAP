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
      t_out     TYPE TABLE OF zsmm_fly_serv01.


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



DATA r_grid TYPE REF TO cl_gui_alv_grid.
DATA: wa_fieldcat TYPE slis_fieldcat_alv,
      wa_layout   TYPE slis_layout_alv,
      it_fieldcat TYPE slis_t_fieldcat_alv.



PERFORM exibir_alv USING 'zsmm_fly_serv01'.


FORM exibir_alv USING VALUE(p_name).

  DATA:    t_fieldcat  TYPE  slis_t_fieldcat_alv,
           wa_fieldcat LIKE LINE OF t_fieldcat,
           wa_layout   TYPE  slis_layout_alv.


  CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name       = p_name
      i_client_never_display = abap_true
    CHANGING
      ct_fieldcat            = t_fieldcat
    EXCEPTIONS
      inconsistent_interface = 1
      program_error          = 2.


  wa_layout-colwidth_optimize = abap_true.
  wa_layout-zebra             = abap_true.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      is_layout     = wa_layout
      it_fieldcat   = t_fieldcat
    TABLES
      t_outtab      = t_out
    EXCEPTIONS
      program_error = 1.

  IF sy-subrc IS NOT INITIAL.
    "TRATAMENTO DO ERRO
    MESSAGE e208(00) WITH 'ERRO GERAR O ALV!'.
  ENDIF.


ENDFORM.