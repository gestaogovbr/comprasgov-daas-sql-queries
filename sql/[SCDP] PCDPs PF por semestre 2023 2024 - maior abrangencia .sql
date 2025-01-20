--PCDP´s 2023,2024 Polícia Federal 
SELECT *
FROM NovoSCDP_VBL.planejamento p
JOIN NovoSCDP_VBL.pcdp pc ON p.id = pc.id_planejamento
JOIN NovoSCDP_VBL.proposto_pcdp pp ON pc.id = pp.id_pcdp
JOIN NovoSCDP_VBL.trecho t ON p.id = t.id_planejamento 
JOIN NovoSCDP_VBL.cidade co ON t.id_cidade_origem = co.id
JOIN NovoSCDP_VBL.cidade cd ON t.id_cidade_destino = cd.id
WHERE p.nome_orgao_raiz_solicitante LIKE 'Polícia Federal' 
AND pc.ano BETWEEN 2023 AND 2024
ORDER BY pc.ano;

--PCDP´s 2023 Polícia Federal 
SELECT *
FROM NovoSCDP_VBL.planejamento p
JOIN NovoSCDP_VBL.pcdp pc ON p.id = pc.id_planejamento
JOIN NovoSCDP_VBL.proposto_pcdp pp ON pc.id = pp.id_pcdp
JOIN NovoSCDP_VBL.trecho t ON p.id = t.id_planejamento 
JOIN NovoSCDP_VBL.cidade co ON t.id_cidade_origem = co.id
JOIN NovoSCDP_VBL.cidade cd ON t.id_cidade_destino = cd.id
WHERE p.nome_orgao_raiz_solicitante LIKE 'Polícia Federal' 
AND pc.ano = 2023 
ORDER BY pc.ano;

--PCDP´s primeiro semestre 2023 - Polícia Federal 
SELECT *
FROM NovoSCDP_VBL.planejamento p
JOIN NovoSCDP_VBL.pcdp pc ON p.id = pc.id_planejamento
JOIN NovoSCDP_VBL.proposto_pcdp pp ON pc.id = pp.id_pcdp
JOIN NovoSCDP_VBL.trecho t ON p.id = t.id_planejamento 
JOIN NovoSCDP_VBL.cidade co ON t.id_cidade_origem = co.id
JOIN NovoSCDP_VBL.cidade cd ON t.id_cidade_destino = cd.id
WHERE p.nome_orgao_raiz_solicitante LIKE 'Polícia Federal'
  AND pc.ano = 2023
  AND MONTH(pc.data_solicitacao) BETWEEN 01 AND 06
ORDER BY pc.ano;

--PCDP´s segundo semestre 2023 - Polícia Federal 
SELECT *
FROM NovoSCDP_VBL.planejamento p
JOIN NovoSCDP_VBL.pcdp pc ON p.id = pc.id_planejamento
JOIN NovoSCDP_VBL.proposto_pcdp pp ON pc.id = pp.id_pcdp
JOIN NovoSCDP_VBL.trecho t ON p.id = t.id_planejamento 
JOIN NovoSCDP_VBL.cidade co ON t.id_cidade_origem = co.id
JOIN NovoSCDP_VBL.cidade cd ON t.id_cidade_destino = cd.id
WHERE p.nome_orgao_raiz_solicitante LIKE 'Polícia Federal'
  AND pc.ano = 2023
  AND MONTH(pc.data_solicitacao) BETWEEN 06 AND 12
ORDER BY pc.ano;

--PCDP´s primeiro semestre 2024 - Polícia Federal 
SELECT *
FROM NovoSCDP_VBL.planejamento p
JOIN NovoSCDP_VBL.pcdp pc ON p.id = pc.id_planejamento
JOIN NovoSCDP_VBL.proposto_pcdp pp ON pc.id = pp.id_pcdp
JOIN NovoSCDP_VBL.trecho t ON p.id = t.id_planejamento 
JOIN NovoSCDP_VBL.cidade co ON t.id_cidade_origem = co.id
JOIN NovoSCDP_VBL.cidade cd ON t.id_cidade_destino = cd.id
WHERE p.nome_orgao_raiz_solicitante LIKE 'Polícia Federal'
  AND pc.ano = 2024
  AND MONTH(pc.data_solicitacao) BETWEEN 01 AND 06
ORDER BY pc.ano;

--PCDP´s segundo semestre 2024 - Polícia Federal 
SELECT *
FROM NovoSCDP_VBL.planejamento p
JOIN NovoSCDP_VBL.pcdp pc ON p.id = pc.id_planejamento
JOIN NovoSCDP_VBL.proposto_pcdp pp ON pc.id = pp.id_pcdp
JOIN NovoSCDP_VBL.trecho t ON p.id = t.id_planejamento 
JOIN NovoSCDP_VBL.cidade co ON t.id_cidade_origem = co.id
JOIN NovoSCDP_VBL.cidade cd ON t.id_cidade_destino = cd.id
WHERE p.nome_orgao_raiz_solicitante LIKE 'Polícia Federal'
  AND pc.ano = 2024
  AND MONTH(pc.data_solicitacao) BETWEEN 06 AND 12
ORDER BY pc.ano;

--PCDP´s 2024 - Polícia Federal 
SELECT *
FROM NovoSCDP_VBL.planejamento p
JOIN NovoSCDP_VBL.pcdp pc ON p.id = pc.id_planejamento
JOIN NovoSCDP_VBL.proposto_pcdp pp ON pc.id = pp.id_pcdp
JOIN NovoSCDP_VBL.trecho t ON p.id = t.id_planejamento 
JOIN NovoSCDP_VBL.cidade co ON t.id_cidade_origem = co.id
JOIN NovoSCDP_VBL.cidade cd ON t.id_cidade_destino = cd.id
WHERE p.nome_orgao_raiz_solicitante LIKE 'Polícia Federal' 
AND pc.ano = 2024 
ORDER BY pc.ano;