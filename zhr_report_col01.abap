REPORT zhr_report_col01.

DATA: v_re    TYPE zhr001_01-zz_re,
      v_nome  TYPE zhr001_01-zz_nome_emp,
      v_cargo TYPE zhr001_01-zz_cargo,
      v_stt   TYPE zhr001_01-zz_status_emp,
      v_dtc   TYPE zhr001_01-zz_data_cad,
      t_out   TYPE TABLE OF zhr001_01, "matriz/tabela interna, recebe os dados da seleção"
      wa_out  LIKE LINE OF t_out,

*alv
t_fieldcat  type  slis_t_fieldcat_alv,
wa_fieldcat like line of t_fieldcat,
wa_layout type slis_layout_alv.


"CRIAR BLOCO NA TELA, ONDE VAI FICAR O FORMULARIO"
SELECTION-SCREEN BEGIN OF BLOCK b0 WITH FRAME TITLE text-001.
SELECT-OPTIONS: s_re     FOR v_re, "o campo s_re recebe o valor da variavel v_re"
                s_nome   FOR v_nome, "assim como nos campos seguintes"
                s_cargo  FOR v_cargo,
                s_stt    FOR v_stt,
                s_dtc    FOR v_dtc.
SELECTION-SCREEN END OF BLOCK b0.

"criaçaõ do report"

START-OF-SELECTION.

  PERFORM f_buscar_dados.
  PERFORM f_exibir_alv.


*&---------------------------------------------------------------------*
*&      Form  F_BUSCAR_DADOS
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_buscar_dados.
  REFRESH: t_out[].

  SELECT  mandt
          zz_re
          zz_nome_emp
          zz_cargo
          zz_status_emp
          zz_data_cad
    INTO TABLE t_out "inserindo dados selecionados na tabela interna"
    FROM zhr001_01
    WHERE zz_re         IN s_re
      AND zz_nome_emp   IN s_nome
      AND zz_cargo      IN s_cargo
      AND zz_status_emp IN s_stt
  AND zz_data_cad   IN s_dtc.

  "verificando se a tabela esta vazia"
  IF t_out[] IS INITIAL.
    MESSAGE e208(00) WITH 'NENHUM REGISTRO ENCONTRADO!'.
  ENDIF.

  DELETE t_out WHERE zz_nome_emp IS INITIAL.


ENDFORM.

*&---------------------------------------------------------------------*
*&      Form  F_EXIBIR_ALV
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_exibir_alv.

  PERFORM f_cria_fcat USING:
        '1'    'ZZ_RE'          'T_OUT'    'ZHR001_00'    'ZZ_RE'          'CÓD.MAT.'    'X'    'X',
        '2'    'ZZ_NOME_EMP'    'T_OUT'    'ZHR001_00'    'ZZ_NOME_EMP'    'NOME'        ''     '',
        '3'    'ZZ_CARGO'       'T_OUT'    'ZHR001_00'    'ZZ_CARGO'       'CARGO'       ''     '',
        '4'    'ZZ_STATUS_EMP'  'T_OUT'    'ZHR001_00'    'ZZ_STATUS_EMP'  'STATUS'      ''     '',
        '5'    'ZZ_DATA_CAD'    'T_OUT'    'ZHR001_00'    'ZZ_DATA_CAD'    'DAT.CAD.'    ''     ''.

        wa_layout-colwidth_optimize = abap_true.
        wa_layout-zebra = abap_true. "layout alv"

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
*     I_INTERFACE_CHECK                 = ' '
*     I_BYPASSING_BUFFER                = ' '
*     I_BUFFER_ACTIVE                   = ' '
*     I_CALLBACK_PROGRAM                = ' '
*     I_CALLBACK_PF_STATUS_SET          = ' '
*     I_CALLBACK_USER_COMMAND           = ' '
*     I_CALLBACK_TOP_OF_PAGE            = ' '
*     I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*     I_CALLBACK_HTML_END_OF_LIST       = ' '
*     I_STRUCTURE_NAME                  = 'ZHR001_01' "orientado a objetos"
*     I_BACKGROUND_ID                   = ' '
*     I_GRID_TITLE  = I_GRID_TITLE
*     I_GRID_SETTINGS                   = I_GRID_SETTINGS
     IS_LAYOUT     = wa_layout
      it_fieldcat   = t_fieldcat
*     IT_EXCLUDING  = IT_EXCLUDING
*     IT_SPECIAL_GROUPS                 = IT_SPECIAL_GROUPS
*     IT_SORT       = IT_SORT
*     IT_FILTER     = IT_FILTER
*     IS_SEL_HIDE   = IS_SEL_HIDE
*     I_DEFAULT     = 'X'
*     I_SAVE        = ' '
*     IS_VARIANT    = IS_VARIANT
*     IT_EVENTS     = IT_EVENTS
*     IT_EVENT_EXIT = IT_EVENT_EXIT
*     IS_PRINT      = IS_PRINT
*     IS_REPREP_ID  = IS_REPREP_ID
*     I_SCREEN_START_COLUMN             = 0
*     I_SCREEN_START_LINE               = 0
*     I_SCREEN_END_COLUMN               = 0
*     I_SCREEN_END_LINE                 = 0
*     I_HTML_HEIGHT_TOP                 = 0
*     I_HTML_HEIGHT_END                 = 0
*     IT_ALV_GRAPHICS                   = IT_ALV_GRAPHICS
*     IT_HYPERLINK  = IT_HYPERLINK
*     IT_ADD_FIELDCAT                   = IT_ADD_FIELDCAT
*     IT_EXCEPT_QINFO                   = IT_EXCEPT_QINFO
*     IR_SALV_FULLSCREEN_ADAPTER        = IR_SALV_FULLSCREEN_ADAPTER
*   IMPORTING
*     E_EXIT_CAUSED_BY_CALLER           = E_EXIT_CAUSED_BY_CALLER
*     ES_EXIT_CAUSED_BY_USER            = ES_EXIT_CAUSED_BY_USER
    TABLES
      t_outtab      = t_out
    EXCEPTIONS
      program_error = 1.

  IF sy-subrc IS NOT INITIAL.
    "TRATAMENTO DO ERRO"
    MESSAGE e208(00) WITH 'ERRO GERAR O ALV!'.
  ENDIF.

ENDFORM.


*&---------------------------------------------------------------------*
*&      Form  F_CRIA_FCAT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_cria_fcat USING VALUE(p_col_pos)
                       VALUE(p_fieldname)
                       VALUE(p_tabname)
                       VALUE(p_ref_tabname)
                       VALUE(p_ref_fieldname)
                       VALUE(p_seltext_m)
                       VALUE(p_key)
                       VALUE(p_hotspot).

  CLEAR: wa_fieldcat.
  wa_fieldcat-col_pos       = p_col_pos.
  wa_fieldcat-fieldname     = p_fieldname.
  wa_fieldcat-tabname       = p_tabname.
  wa_fieldcat-ref_tabname   = p_ref_tabname.
  wa_fieldcat-ref_fieldname = p_ref_fieldname.
  wa_fieldcat-seltext_m     = p_seltext_m.
  wa_fieldcat-key           = p_key.
  wa_fieldcat-hotspot       = p_hotspot.
  APPEND wa_fieldcat TO t_fieldcat.

ENDFORM.