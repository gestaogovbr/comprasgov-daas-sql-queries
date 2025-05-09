WITH base AS (
    SELECT EXTRACT(YEAR FROM e.data_emissao) AS ano, e.empenhado
    FROM empenhos e
    WHERE e.empenhado > 0
      AND e.deleted_at IS NULL
      AND e.data_emissao IS NOT NULL
      AND e.id_sistema_origem = 'SIAFI'
)
SELECT ano,
       SUM(empenhado) AS total_empenhado,
       COUNT(*) AS quantidade_empenhos
FROM base
GROUP BY ano
ORDER BY ano DESC;