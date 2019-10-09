SELECT
CAST(ANO as INT64) as ANO, CAST(CO_ENTIDADE as FLOAT64) as CO_ENTIDADE, CAST(CO_MUNICIPIO as FLOAT64) as CO_MUNICIPIO, CAST(DEPENDAD as STRING) as TP_DEPENDAD, UPPER(CAST(NO_ENTIDADE as STRING)) as NO_ENTIDADE, UPPER(CAST(NO_MUNICIPIO as STRING)) as NO_MUNICIPIO, UPPER(CAST(NO_REGIAO as STRING)) as NO_REGIAO, UPPER(CAST(SG_UF as STRING)) as SG_UF, CAST(TAB_F00 as FLOAT64) as TAB_F00, CAST(TAB_F01 as FLOAT64) as TAB_F01, CAST(TAB_F02 as FLOAT64) as TAB_F02, CAST(TAB_F03 as FLOAT64) as TAB_F03, CAST(TAB_F04 as FLOAT64) as TAB_F04, CAST(TAB_F05 as FLOAT64) as TAB_F05, CAST(TAB_F06 as FLOAT64) as TAB_F06, CAST(TAB_F07 as FLOAT64) as TAB_F07, CAST(TAB_F08 as FLOAT64) as TAB_F08, CAST(TAB_F14 as FLOAT64) as TAB_F14, CAST(TAB_F58 as FLOAT64) as TAB_F58, CAST(TAB_FUN as FLOAT64) as TAB_FUN, CAST(TAB_M01 as FLOAT64) as TAB_M01, CAST(TAB_M02 as FLOAT64) as TAB_M02, CAST(TAB_M03 as FLOAT64) as TAB_M03, CAST(TAB_M04 as FLOAT64) as TAB_M04, CAST(TAB_MED as FLOAT64) as TAB_MED, CAST(TAB_MNS as FLOAT64) as TAB_MNS, CAST(TAP_F00 as FLOAT64) as TAP_F00, CAST(TAP_F01 as FLOAT64) as TAP_F01, CAST(TAP_F02 as FLOAT64) as TAP_F02, CAST(TAP_F03 as FLOAT64) as TAP_F03, CAST(TAP_F04 as FLOAT64) as TAP_F04, CAST(TAP_F05 as FLOAT64) as TAP_F05, CAST(TAP_F06 as FLOAT64) as TAP_F06, CAST(TAP_F07 as FLOAT64) as TAP_F07, CAST(TAP_F08 as FLOAT64) as TAP_F08, CAST(TAP_F14 as FLOAT64) as TAP_F14, CAST(TAP_F58 as FLOAT64) as TAP_F58, CAST(TAP_FUN as FLOAT64) as TAP_FUN, CAST(TAP_M01 as FLOAT64) as TAP_M01, CAST(TAP_M02 as FLOAT64) as TAP_M02, CAST(TAP_M03 as FLOAT64) as TAP_M03, CAST(TAP_M04 as FLOAT64) as TAP_M04, CAST(TAP_MED as FLOAT64) as TAP_MED, CAST(TAP_MNS as FLOAT64) as TAP_MNS, CAST(TIPOLOCA as STRING) as TP_LOCAL, CAST(TRE_F00 as FLOAT64) as TRE_F00, CAST(TRE_F01 as FLOAT64) as TRE_F01, CAST(TRE_F02 as FLOAT64) as TRE_F02, CAST(TRE_F03 as FLOAT64) as TRE_F03, CAST(TRE_F04 as FLOAT64) as TRE_F04, CAST(TRE_F05 as FLOAT64) as TRE_F05, CAST(TRE_F06 as FLOAT64) as TRE_F06, CAST(TRE_F07 as FLOAT64) as TRE_F07, CAST(TRE_F08 as FLOAT64) as TRE_F08, CAST(TRE_F14 as FLOAT64) as TRE_F14, CAST(TRE_F58 as FLOAT64) as TRE_F58, CAST(TRE_FUN as FLOAT64) as TRE_FUN, CAST(TRE_M01 as FLOAT64) as TRE_M01, CAST(TRE_M02 as FLOAT64) as TRE_M02, CAST(TRE_M03 as FLOAT64) as TRE_M03, CAST(TRE_M04 as FLOAT64) as TRE_M04, CAST(TRE_MED as FLOAT64) as TRE_MED, CAST(TRE_MNS as FLOAT64) as TRE_MNS

FROM `raw_federal_inep.taxa_rendimento`
WHERE ANO LIKE '20__' -- removendo rodape;