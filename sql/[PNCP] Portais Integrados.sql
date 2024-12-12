##### Script Atualizado

SELECT
	u.id,
	u.nomerazaosocial,
	u.cpfcnpj,
	u.datainclusao
FROM PNCP_VBL.usuario u
JOIN (
	SELECT co.usuarioid
	FROM PNCP_VBL.contrato co
	WHERE co.excluido = 0
	UNION
	SELECT c.usuarioid
	FROM PNCP_VBL.compra c
	WHERE c.excluido = 0
	) AS active_users 
    ON u.id = active_users.usuarioid
ORDER BY u.id;


##### Script Alterado

SELECT
	COUNT(DISTINCT ct.id) AS qt_contratos_pncp,
	COUNT(DISTINCT cp.id) AS qt_compras,
	SUBSTRING(u.datainclusao, 9, 2)|| '/' || SUBSTRING(u.datainclusao, 6, 2)|| '/' || SUBSTRING(u.datainclusao, 1, 4) datainclusao,
	u.id,
	u.nomerazaosocial,
	u.cpfcnpj
FROM usuario u
	JOIN compra cp ON u.id = cp.usuarioid
	JOIN contrato ct ON u.id = ct.usuarioid
WHERE 1=1
    AND (ct.id IS NOT NULL OR cp.id IS NOT NULL) 
    AND ct.excluido = 0
    AND cp.excluido = 0   
GROUP BY
	u.id,
	u.nomerazaosocial,
	u.cpfcnpj,
	u.datainclusao
ORDER BY
	u.id;
	

##### Script Original

SELECT 
    COUNT(DISTINCT co.id) AS qt_contratos_pncp,
    COUNT(DISTINCT c.id) AS qt_compras,
    SUBSTRING(u.datainclusao, 9, 2)||'/'||SUBSTRING(u.datainclusao, 6, 2)||'/'||SUBSTRING(u.datainclusao, 1, 4) datainclusao,
    u.id,
    u.nomerazaosocial,
    u.cpfcnpj
FROM 
    usuario u
LEFT JOIN 
    contrato co ON u.id = co.usuarioid AND co.excluido = 0
LEFT JOIN 
    compra c ON u.id = c.usuarioid AND c.excluido = 0
WHERE 
    (co.id IS NOT NULL OR c.id IS NOT NULL)
GROUP BY 
    u.id,
    u.nomerazaosocial,
    u.cpfcnpj,
    u.datainclusao
HAVING 
    (COUNT(DISTINCT co.id) = 0 AND COUNT(DISTINCT c.id) > 0)
    OR (COUNT(DISTINCT co.id) > 0 AND COUNT(DISTINCT c.id) = 0)
    OR (COUNT(DISTINCT co.id) > 0 AND COUNT(DISTINCT c.id) > 0)
ORDER BY 
    u.id;

### Script com PCA e Ata

SELECT DISTINCT 
    u.id, 
    u.nomerazaosocial, 
    u.cpfcnpj, 
    u.datainclusao
FROM 
    PNCP_VBL.usuario u
WHERE 
    u.id IN (
        SELECT usuarioid FROM PNCP_VBL.contrato WHERE excluido = 0
        UNION
        SELECT usuarioid FROM PNCP_VBL.compra WHERE excluido = 0
        UNION
        SELECT usuarioid FROM PNCP_VBL.planocontratacao WHERE excluido = 0
        UNION
        SELECT usuarioid FROM PNCP_VBL.ataregistropreco WHERE excluido = 0
    );

