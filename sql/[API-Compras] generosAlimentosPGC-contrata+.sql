WITH codigos(codigo) AS (
  SELECT v.codigo
  FROM (VALUES
    (8905),(8910),(8915),(8920),(8925),(8930),(8935),
    (8940),(8945),(8950),(8955),(8960),(8965),(8970),(8975)
  ) AS v(codigo)
),
dm_uasg AS (  -- 1 linha por UASG: a mais recente
  SELECT
      codigo_uasg,
      uso_sisg,
      ROW_NUMBER() OVER (
        PARTITION BY codigo_uasg
        ORDER BY data_hora_movimento DESC
      ) AS rn
  FROM planejamento_contratacao.VW_DM_CORP_UASG
  WHERE codigo_uasg IS NOT NULL
)
SELECT DISTINCT
  ft.orgao,
  ft.codigo_uasg,
  ft.nome_uasg,
  ft.ano_pca_projeto_compra AS ano,
  ft.codigo_classe_material,
  ft.nome_classe_material,
  CASE dm.uso_sisg
       WHEN 1 THEN N'Sim'
       WHEN 0 THEN N'Não'
       ELSE N'Indefinido'
  END AS uso_sisg
FROM planejamento_contratacao.vw_ft_pgc_detalhe AS ft
JOIN codigos AS c
  ON ft.codigo_classe_material = c.codigo
LEFT JOIN dm_uasg AS dm
  ON dm.codigo_uasg = ft.codigo_uasg
 AND dm.rn = 1
WHERE ft.ano_pca_projeto_compra IN (2025, 2026)
ORDER BY ano, ft.orgao, ft.codigo_uasg, ft.codigo_classe_material;
