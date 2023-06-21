SELECT
	id 						AS 'id',
	texto					AS 'texto',
	valor_total_estimado	AS 'valor_total_estimado',
	uasg					AS 'uasg',
	categoria				AS 'categoria',
	id_categoria			AS 'id_categoria',
	equipe_cpf				AS 'equipe_cpf',
	tipo_trilha				AS 'tipo_trilha',
	'email_alerta'			AS 'email_alerta'
FROM seges_delog_cgscg_stage.alice.etp_teste2 a
FOR JSON PATH
LIMIT 100;

{
    "id": 74459,
    "texto": "6.1 - Bens e Servi�os que Comp�em a Solu��o Servi�o/Bem Descri��o Estimativa (m�s) Previs�o Anual Total (Ano) Servi�o de Suporte e Atendimento em TIC ao Usu�rio (Service Desk) Presta��o de servi�os de suporte t�cnico de microinform�tica ao usu�rio final, em 1�, 2� e 3� n�veis, incluindo a sustenta��o dos ativos e dos softwares relacionados �s atividades meio e final�sticas do Cemaden, contribuindo assim para manter em funcionamento as opera��es e fun��es de suas diversas �reas, em especial da Sala de Situa��o do Centro, operando em regime de 24h/7d. 5870 (UST) 70440 (UST) R$ 1.992.043,20 Total = R$ 1.992.043,20 | 6 - Cen�rio Escolhido Cen�rio x Descri��o Ap�s an�lise dos Cen�rios, a solu��o que mais se adequa �s necessidades do Cemaden � equivalente � implementada pelo MAPA (Cen�rio 1) e pelo INPE (Cen�rio 4). [...]",
    "valor_total_estimado": 30000000.0,
    "categoria": "Contrata��es de TIC",
    "id_categoria": 3,
    "uasg": 130005,
    "equipe_cpf": ["30000000075"],
    "tipo_trilha": "etp"
}