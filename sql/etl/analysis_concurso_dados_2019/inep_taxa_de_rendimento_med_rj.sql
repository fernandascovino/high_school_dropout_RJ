SELECT *
FROM `cleaned_federal_inep.taxa_rendimento`
WHERE TAB_M01 IS NOT NULL
  AND TP_DEPENDAD = 'Estadual'
  AND SG_UF IN ('RJ', 'SP')
  AND CO_ENTIDADE IN
    (SELECT CO_ENTIDADE FROM -- filtro qtd anos em que a escola aparece
      (SELECT DISTINCT CO_ENTIDADE, 
        COUNT(ANO) OVER (PARTITION BY CO_ENTIDADE) as QTD_ENTIDADE_MED_ANOS
        FROM `cleaned_federal_inep.taxa_rendimento`
        WHERE TAB_MED IS NOT NULL
          AND ANO != 2011 -- até consertar
        ORDER BY QTD_ENTIDADE_MED_ANOS DESC) t
    WHERE QTD_ENTIDADE_MED_ANOS > 5);