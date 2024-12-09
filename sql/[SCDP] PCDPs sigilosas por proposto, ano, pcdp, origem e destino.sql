SELECT 
    p.numero_pcdp,
    pp.nome AS nome_proposto,
    pp.matricula_siape,
    p.data_inicio_viagem,
    p.data_fim_viagem,
    pc.ano,
    --t.id_cidade_origem, 
    --t.id_cidade_destino, 
    co.nome AS cidade_origem,
    cd.nome AS cidade_destino,
    pc.sigilosa,
    p.descricao_motivo_viagem, 
    p.nome_orgao_solicitante,
    p.nome_orgao_raiz_solicitante 
FROM NovoSCDP_SG_VBL.planejamento p
JOIN NovoSCDP_SG_VBL.pcdp pc ON p.id = pc.id_planejamento
JOIN NovoSCDP_SG_VBL.proposto_pcdp pp ON pc.id = pp.id_pcdp
JOIN NovoSCDP_SG_VBL.trecho t ON p.id = t.id_planejamento 
JOIN NovoSCDP_SG_VBL.cidade co ON t.id_cidade_origem = co.id
JOIN NovoSCDP_SG_VBL.cidade cd ON t.id_cidade_destino = cd.id
WHERE pp.matricula_siape LIKE '%1515247' 
ORDER BY pc.ano;

    
    
SELECT 
    p.numero_pcdp,
    pp.nome AS nome_proposto,
    pp.matricula_siape,
    p.data_inicio_viagem,
    p.data_fim_viagem,
    pc.ano,
    --t.id_cidade_origem, 
    --t.id_cidade_destino, 
    co.nome AS cidade_origem,
    cd.nome AS cidade_destino,
    pc.sigilosa,
    p.descricao_motivo_viagem, 
    p.nome_orgao_solicitante,
    p.nome_orgao_raiz_solicitante 
FROM NovoSCDP_SG_VBL.planejamento p
JOIN NovoSCDP_SG_VBL.pcdp pc ON p.id = pc.id_planejamento
JOIN NovoSCDP_SG_VBL.proposto_pcdp pp ON pc.id = pp.id_pcdp
JOIN NovoSCDP_SG_VBL.trecho t ON p.id = t.id_planejamento 
JOIN NovoSCDP_SG_VBL.cidade co ON t.id_cidade_origem = co.id
JOIN NovoSCDP_SG_VBL.cidade cd ON t.id_cidade_destino = cd.id
WHERE pp.matricula_siape LIKE '%1183969' 
AND pc.ano BETWEEN 2019 AND 2021
ORDER BY pc.ano;

   