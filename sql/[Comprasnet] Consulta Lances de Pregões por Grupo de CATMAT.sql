SELECT DISTINCT
	numprp NumeroLicitacao, 
	pr.coduasg CodigoUG, 
	nomuasg NomeUG,
	'5' CodigoModalidadeCompra, 
	'Preg�o Eletr�nico' ModalidadeCompra, 
	prgProcesso NumeroProcesso,
	CodOrgao CodigoOrgao, 
	NomeOrgao NomeOrgao, 
	ipgItem SequencialItem,
	codmat CodigoPDMItemCompra, 
	ipgDescricao DescricaoItemCompra, 
	prpCNPJ CNPJParticipante,
	prpRazaoSocial RazaoSocialParticipante,
	ippIndHabilitado IndicadorHabilitado, -- CASE ippIndHabilitado WHEN 'H' THEN true ELSE false END FlagVencedor,
	lanValor PrecoLance
FROM Comprasnet_VBL.tbl_pregaoitem p
JOIN Comprasnet_VBL.tbl_Pregao pr ON p.prgCod = pr.prgCod 
JOIN Comprasnet_VBL.tbl_Lances l ON p.ipgCod = l.ipgCod
JOIN Comprasnet_VBL.tb_uasg u ON pr.coduasg = u.coduasg
JOIN Comprasnet_VBL.tbl_PropostaItem ipp ON p.ipgCod = ipp.ipgCod 
JOIN Comprasnet_VBL.tbl_Proposta prp ON ipp.prpCod = prp.prpCod
WHERE lanStatus = 'V' AND pr.prgDataInclusao > '2013-01-01 00:00:00' AND pr.prgDataInclusao < '2017-01-01 00:00:00' AND pr.prgDataHom IS NOT NULL --'2017-01-01 00:00:00'
UNION
SELECT DISTINCT
	numprp NumeroLicitacao, 
	pr.coduasg CodigoUG, 
	nomuasg NomeUG,
	'5' CodigoModalidadeCompra, 
	'Preg�o Eletr�nico' ModalidadeCompra, 
	prgProcesso NumeroProcesso,
	CodOrgao CodigoOrgao, 
	NomeOrgao NomeOrgao, 
	ipgItem SequencialItem,
	codmat CodigoPDMItemCompra, 
	ipgDescricao DescricaoItemCompra, 
	prpCNPJ CNPJParticipante,
	prpRazaoSocial RazaoSocialParticipante,
	ippIndHabilitado IndicadorHabilitado, -- CASE ippIndHabilitado WHEN 'H' THEN true ELSE false END FlagVencedor,
	lanValor PrecoLance
FROM Comprasnet_VBL.tbl_pregaoitem p
JOIN Comprasnet_VBL.tbl_Pregao pr ON p.prgCod = pr.prgCod 
JOIN Comprasnet_VBL.tbl_Lances_Encerrados le ON le.ipgCod = p.ipgCod
JOIN Comprasnet_VBL.tb_uasg u ON pr.coduasg = u.coduasg
JOIN Comprasnet_VBL.tbl_PropostaItem ipp ON p.ipgCod = ipp.ipgCod 
JOIN Comprasnet_VBL.tbl_Proposta prp ON ipp.prpCod = prp.prpCod
WHERE lanStatus = 'V' AND pr.prgDataInclusao > '2013-01-01 00:00:00' AND pr.prgDataInclusao < '2015-01-01 00:00:00' AND pr.prgDataHom IS NOT NULL --'2017-01-01 00:00:00'
;

Colunas solicitadas:
1. N�mero Licita��o; 
2. C�digo UG; 
3. Nome UG; 
4. C�digo Modalidade Compra; 
5. Modalidade Compra; 
6. N�mero Processo; 
7. C�digo �rg�o; 
8. Nome �rg�o; 
9. C�digo Item Compra; 
10. Descri��o Item Compra; 
11. CNPJ Participante; 
12. Nome Participante; 
13. Flag Vencedor; 
14. Pre�o ou lance;

