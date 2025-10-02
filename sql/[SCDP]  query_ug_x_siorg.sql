-- Query para extrair a relação UG x SIORG do banco NovoSCDP_VDB
-- Relaciona Unidades Gestoras (UG) com códigos SIORG através das tabelas
-- unidade_gestora_siafi e orgao

SELECT 
    ugs.id AS id_unidade_gestora,
    ugs.codigo_siafi AS codigo_ug_siafi,
    o.codigo_siorg,
    o.nome AS nome_orgao,
    o.sigla AS sigla_orgao,
    o.integrado_siafi,
    CASE o.natureza_juridica_vl
        WHEN 1 THEN 'Empresa Pública'
        WHEN 2 THEN 'Fundação Pública'
        WHEN 3 THEN 'Administração Direta'
        WHEN 4 THEN 'Autarquia'
        WHEN 6 THEN 'Sociedade de Economia Mista'
        ELSE 'Não informado'
    END AS natureza_juridica_descricao,
    ugs.data_ultima_atualizacao_registro AS data_atualizacao_ug,
    o.data_ultima_atualizacao_registro AS data_atualizacao_orgao
FROM NovoSCDP_VBL.unidade_gestora_siafi ugs
INNER JOIN NovoSCDP_VBL.orgao o 
    ON ugs.id_orgao = o.id
WHERE 
    ugs.ativo = 1  -- Apenas UGs ativas
    AND o.codigo_siorg IS NOT NULL  -- Apenas órgãos com código SIORG válido
ORDER BY 
    o.codigo_siorg, 
    ugs.codigo_siafi;

-- Query alternativa incluindo também órgãos sem UG cadastrada
-- para análise completa da estrutura SIORG

/*
SELECT 
    o.codigo_siorg,
    o.nome AS nome_orgao,
    o.sigla AS sigla_orgao,
    o.codigo_siape,
    ugs.codigo_siafi AS codigo_ug_siafi,
    ugs.responsavel_teto,
    ugs.ativo AS ug_ativa,
    CASE 
        WHEN ugs.id IS NULL THEN 'Sem UG cadastrada'
        WHEN ugs.ativo = 1 THEN 'UG Ativa'
        ELSE 'UG Inativa'
    END AS status_ug,
    o.vinculado AS orgao_vinculado,
    o.raiz AS orgao_raiz,
    o.integrado_siafi,
    o.natureza_juridica_vl
FROM NovoSCDP_VDB.dbo.orgao o
LEFT JOIN NovoSCDP_VDB.dbo.unidade_gestora_siafi ugs 
    ON o.id = ugs.id_orgao AND ugs.ativo = 1
WHERE 
    o.codigo_siorg IS NOT NULL
ORDER BY 
    o.codigo_siorg, 
    ugs.codigo_siafi;
*/

-- Query para estatísticas da relação UG x SIORG

/*
SELECT 
    'Total de órgãos com código SIORG' AS metrica,
    COUNT(*) AS quantidade
FROM NovoSCDP_VDB.dbo.orgao 
WHERE codigo_siorg IS NOT NULL

UNION ALL

SELECT 
    'Total de UGs ativas' AS metrica,
    COUNT(*) AS quantidade
FROM NovoSCDP_VDB.dbo.unidade_gestora_siafi 
WHERE ativo = 1

UNION ALL

SELECT 
    'Órgãos com UG cadastrada' AS metrica,
    COUNT(DISTINCT o.id) AS quantidade
FROM NovoSCDP_VDB.dbo.orgao o
INNER JOIN NovoSCDP_VDB.dbo.unidade_gestora_siafi ugs 
    ON o.id = ugs.id_orgao AND ugs.ativo = 1
WHERE o.codigo_siorg IS NOT NULL

UNION ALL

SELECT 
    'Órgãos sem UG cadastrada' AS metrica,
    COUNT(*) AS quantidade
FROM NovoSCDP_VDB.dbo.orgao o
LEFT JOIN NovoSCDP_VDB.dbo.unidade_gestora_siafi ugs 
    ON o.id = ugs.id_orgao AND ugs.ativo = 1
WHERE o.codigo_siorg IS NOT NULL 
    AND ugs.id IS NULL;
*/