SELECT *
  FROM NovoSCDP_SG_VBL.planejamento p
  JOIN NovoSCDP_SG_VBL.pcdp pc ON p.id = pc.id_planejamento
  JOIN NovoSCDP_SG_VBL.proposto_pcdp pp ON pc.id = pp.id_pcdp
  JOIN NovoSCDP_SG_VBL.trecho t ON p.id = t.id_planejamento 
  JOIN NovoSCDP_SG_VBL.cidade co ON t.id_cidade_origem = co.id
  JOIN NovoSCDP_SG_VBL.cidade cd ON t.id_cidade_destino = cd.id
  WHERE p.nome_orgao_raiz_solicitante LIKE 'Polícia Federal'
    AND pc.ano = 2023
  ORDER BY pc.ano
  LIMIT 50
)
UNION ALL
(
  SELECT *
  FROM NovoSCDP_SG_VBL.planejamento p
  JOIN NovoSCDP_SG_VBL.pcdp pc ON p.id = pc.id_planejamento
  JOIN NovoSCDP_SG_VBL.proposto_pcdp pp ON pc.id = pp.id_pcdp
  JOIN NovoSCDP_SG_VBL.trecho t ON p.id = t.id_planejamento 
  JOIN NovoSCDP_SG_VBL.cidade co ON t.id_cidade_origem = co.id
  JOIN NovoSCDP_SG_VBL.cidade cd ON t.id_cidade_destino = cd.id
  WHERE p.nome_orgao_raiz_solicitante LIKE 'Polícia Federal'
    AND pc.ano = 2024
  ORDER BY pc.ano
  LIMIT 50
);
