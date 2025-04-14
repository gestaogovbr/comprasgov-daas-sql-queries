SELECT 
    p.numero_pcdp,
    pc.ano AS "ano_pcdp",
    CASE pc.situacao_pcdp_vl
         WHEN 1 THEN 'Em Planejamento'
         WHEN 2 THEN 'Em Prestação de Contas'
         WHEN 3 THEN 'Cancelada'
         WHEN 4 THEN 'Concluída'
         ELSE 'Situação Inválida'
    END AS situacao_pcdp,
    pp.nome AS nome_proposto,
    p.data_inicio_viagem,
    p.data_fim_viagem, 
    p.descricao_motivo_viagem, 
    p.nome_orgao_solicitante AS "Orgao",
    p.nome_orgao_raiz_solicitante AS "Orgao_Superior",
    p.valor_aprovado_diarias_nacionais, 
    p.valores_nacionais_realizados_tarifa AS "valor_agenciamento",
    p.valor_aprovado_passagens,
    p.valor_auxilio_alimentacao,	
    ROUND(
         p.valor_aprovado_passagens
       + p.valor_auxilio_alimentacao 
       + p.valores_nacionais_realizados_tarifa 
       + p.valor_aprovado_diarias_nacionais, 2
    ) AS Valor_Total_Viagem
FROM NovoSCDP_VBL.planejamento p
JOIN NovoSCDP_VBL.pcdp pc ON p.id = pc.id_planejamento
JOIN NovoSCDP_VBL.proposto_pcdp pp ON pc.id = pp.id_pcdp
WHERE EXTRACT(YEAR FROM p.data_fim_viagem) = 2024
  AND p.nome_orgao_raiz_solicitante LIKE '%Instituto Federal de Educação, Ciência e Tecnologia de Minas Gerais%'