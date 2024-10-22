SELECT 
    p.numero_pcdp,
    pp.nome AS nome_proposto,
    p.data_inicio_viagem,
    p.data_fim_viagem, 
    p.descricao_motivo_viagem, 
    p.enquadramento_legal_tipo_missao, 
    p.enquadramento_legal_natureza_missao,
    p.nome_orgao_solicitante,
    p.nome_orgao_raiz_solicitante,
    p.valor_aprovado_passagens,
    p.valor_auxilio_alimentacao,	
    p.valor_aprovado_diarias_internacionais,
    CASE 
        WHEN p.moeda_vl = 2 THEN 'D�lar' 
        ELSE p.moeda_vl 
    END AS moeda_usada,
    p.cotacao,
    ROUND(p.valor_aprovado_passagens + p.valor_auxilio_alimentacao + (p.valor_aprovado_diarias_internacionais * p.cotacao), 2) AS Valor_Total_Viagem
FROM NovoSCDP_VBL.planejamento p
JOIN NovoSCDP_VBL.pcdp pc ON p.id = pc.id_planejamento
JOIN NovoSCDP_VBL.proposto_pcdp pp ON pc.id = pp.id_pcdp
WHERE EXTRACT(YEAR FROM p.data_fim_viagem) BETWEEN 2022 AND 2024
    AND (p.nome_orgao_raiz_solicitante LIKE '%Minist�rio da Gest�o%' OR p.nome_orgao_raiz_solicitante LIKE '%Minist�rio da Economia%')
    AND p.descricao_motivo_viagem LIKE '%ONU%';
