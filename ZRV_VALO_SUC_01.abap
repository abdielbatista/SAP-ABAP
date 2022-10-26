REPORT zrv_valo_suc_01.


TYPES: BEGIN OF type_serv,
         werks TYPE marc-werks,
         matnr TYPE mara-matnr,
         maktx TYPE makt-maktx,
         mtart TYPE mara-mtart,
         meins TYPE mara-meins,
         vprsv TYPE mbew-vprsv,
         stprs TYPE mbew-stprs,
         verpr TYPE mbew-verpr,
         peinh TYPE mbew-peinh,
       END OF type_serv,

       BEGIN OF type_mesg,
         matnr      TYPE mseg-matnr,
         werks      TYPE mseg-werks,
         bwart      TYPE mseg-bwart,
         budat_mkpf TYPE mseg-budat_mkpf,
         menge      TYPE mseg-menge,
       END OF type_mesg.



DATA: vi_lines TYPE i, "contar linhas para menge
      v_werks  TYPE marc-werks,
      v_matnr  TYPE marc-matnr,
      v_data   TYPE datum, "sy-datum

      t_mesg   TYPE TABLE OF type_mesg,
      wa_mesg  LIKE LINE OF t_mesg,



      t_serv   TYPE TABLE OF type_serv,
      wa_serv  TYPE type_serv,

      t_out    TYPE TABLE OF zdrv_valo_sec_01.


FIELD-SYMBOLS: <lfs_line> TYPE zdrv_valo_sec_01.


SELECTION-SCREEN BEGIN OF BLOCK b0 WITH FRAME TITLE text-001.
SELECT-OPTIONS: s_werks FOR  v_werks,
                s_matnr FOR  v_matnr,
                s_data  FOR  v_data.
SELECTION-SCREEN END OF BLOCK b0.


PERFORM selecao.
PERFORM exibir_alv USING 'ZDRV_VALO_SEC_01'.



*&---------------------------------------------------------------------*
*&      Form  seleção dos dados nas tabelas
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM selecao.

  SELECT a~werks a~matnr b~maktx c~mtart c~meins d~vprsv d~stprs d~verpr d~peinh
    INTO TABLE t_serv
    FROM marc AS a INNER JOIN makt AS b
      ON a~matnr EQ b~matnr
    INNER JOIN mara AS c
      ON a~matnr EQ c~matnr
    INNER JOIN mbew AS d
      ON d~matnr EQ a~matnr AND d~bwkey = a~werks
    WHERE a~werks IN s_werks
      AND a~matnr IN s_matnr
      AND d~matnr EQ a~matnr
      AND d~bwkey EQ a~werks.

*  CLEAR: t_mesg.
*
*  SELECT mseg~matnr mseg~werks mseg~bwart mseg~budat_mkpf mseg~menge
*    INTO TABLE t_mesg
*    FROM  mseg
*    FOR ALL ENTRIES IN t_serv
*    WHERE mseg~matnr EQ t_serv-matnr.
**      AND mseg~werks EQ t_serv-werks
**      AND mseg~bwart EQ '551' OR mseg~bwart EQ '552'
**      AND mseg~budat_mkpf BETWEEN s_data AND s_data.
*
*  SORT t_SERV BY matnr werks.




  LOOP AT t_serv INTO wa_serv.
    CLEAR: wa_mesg.

    APPEND INITIAL LINE TO t_out ASSIGNING <lfs_line>.

    MOVE-CORRESPONDING wa_serv TO <lfs_line>.


    IF wa_serv-vprsv EQ 'S'.
      <lfs_line>-preco = ( wa_serv-stprs / wa_serv-peinh ).
    ELSE.
      <lfs_line>-preco = ( wa_serv-verpr / wa_serv-peinh ).
    ENDIF.


    READ TABLE t_mesg INTO wa_mesg WITH KEY matnr = <lfs_line>-matnr
                                            BINARY SEARCH.

*    IF sy-subrc IS INITIAL.
*      <lfs_line>-menge = ( wa_mesg-menge ).
*    ENDIF.

  ENDLOOP.


ENDFORM.


DATA r_grid TYPE REF TO cl_gui_alv_grid.
DATA: wa_fieldcat TYPE slis_fieldcat_alv,
      wa_layout   TYPE slis_layout_alv,
      it_fieldcat TYPE slis_t_fieldcat_alv.


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
  WA_FIELDCAT-DO_SUM = 'X'.

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