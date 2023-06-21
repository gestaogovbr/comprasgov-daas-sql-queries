SELECT	
	MAX(a11.ID_ANO_LANC)					ANO,
--	MAX(a11.ID_MES_LANC)  					MES,
--	MAX(a17.ID_ORGAO_MAXI) 					ID_ORGAO_MAXI_UO,
--	MAX(a15.ID_ORGAO_UO)	  				ID_ORGAO_UO,
--	MAX(a19.ID_ORGAO_MAXI)		  			ID_ORGAO_MAXI_UG,
--	MAX(a14.ID_ORGAO_UG)	  				ID_ORGAO,
	MAX(a14.ID_UG)		  					ID_UG,
	MAX(a116.CO_NATUREZA_DESPESA_DETA)		ID_NATUREZA_DESPESA_DETA,
--	MAX(a11.ID_FUNCAO_PT) 					ID_FUNCAO_PT,
--	MAX(a11.ID_SUBFUNCAO_PT)  				ID_SUBFUNCAO_PT,
--	MAX(a11.ID_ACAO_PT)  					ID_ACAO_PT,
--	MAX(a120.NO_ORGAO_MAXI)  				NO_ORGAO_MAXI_UO,
--	MAX(a119.NO_ORGAO)  					NO_ORGAO_UO,
--	MAX(a122.NO_ORGAO_MAXI)  				NO_ORGAO_MAXI_UG,
--	MAX(a121.NO_ORGAO)  					NO_ORGAO,
	MAX(a110.NO_UG)  						NO_UG,
	MAX(a116.NO_NATUREZA_DESPESA_DETA)  	NO_NATUREZA_DESPESA_DETA,
--	MAX(a112.NO_FUNCAO_PT)  				NO_FUNCAO_PT,
--	MAX(a117.NO_SUBFUNCAO_PT)  				NO_SUBFUNCAO_PT,
--	MAX(a111.NO_ACAO_PT)  					NO_ACAO_PT,
	SUM(CASE WHEN a11.ID_MES_LANC = 1 THEN a11.VA_MOVIMENTO_LIQUIDO END) MES_01,
	SUM(CASE WHEN a11.ID_MES_LANC = 2 THEN a11.VA_MOVIMENTO_LIQUIDO END) MES_02,
	SUM(CASE WHEN a11.ID_MES_LANC = 3 THEN a11.VA_MOVIMENTO_LIQUIDO END) MES_03,
	SUM(CASE WHEN a11.ID_MES_LANC = 4 THEN a11.VA_MOVIMENTO_LIQUIDO END) MES_04,
	SUM(CASE WHEN a11.ID_MES_LANC = 5 THEN a11.VA_MOVIMENTO_LIQUIDO END) MES_05,
	SUM(CASE WHEN a11.ID_MES_LANC = 6 THEN a11.VA_MOVIMENTO_LIQUIDO END) MES_06,
	SUM(CASE WHEN a11.ID_MES_LANC = 7 THEN a11.VA_MOVIMENTO_LIQUIDO END) MES_07,
	SUM(CASE WHEN a11.ID_MES_LANC = 8 THEN a11.VA_MOVIMENTO_LIQUIDO END) MES_08,
	SUM(CASE WHEN a11.ID_MES_LANC = 9 THEN a11.VA_MOVIMENTO_LIQUIDO END) MES_09,
	SUM(CASE WHEN a11.ID_MES_LANC = 10 THEN a11.VA_MOVIMENTO_LIQUIDO END) MES_10,
	SUM(CASE WHEN a11.ID_MES_LANC = 11 THEN a11.VA_MOVIMENTO_LIQUIDO END) MES_11,
	SUM(CASE WHEN a11.ID_MES_LANC = 12 THEN a11.VA_MOVIMENTO_LIQUIDO END) MES_12
--	SUM(a11.VA_MOVIMENTO_LIQUIDO)			DESPESAS_PAGAS
FROM	
	DWTG_Colunar_VBL.WF_LANCAMENTO_EP20					a11
	JOIN	DWTG_Colunar_VBL.WD_ITEM_DECODIFICADO_CCON	a12
	  ON 	(a11.ID_ANO_LANC = a12.ID_ANO_ITEM_CONTA AND 
			a11.ID_CONTA_CONTABIL_LANC = a12.ID_CONTA_CONTABIL)
	JOIN	DWTG_Colunar_VBL.WD_DOC_NE					a13
	  ON 	(a11.ID_DOCUMENTO_CCOR = a13.ID_DOC_NE)
	JOIN	DWTG_Colunar_VBL.WD_UG_EXERCICIO			a14
	  ON 	(a11.ID_ANO_LANC = a14.ID_ANO AND 
			a11.ID_UG_EXEC = a14.ID_UG)
	JOIN	DWTG_Colunar_VBL.WD_UO_EXERCICIO			a15
	  ON 	(a11.ID_ANO_LANC = a15.ID_ANO AND 
			a11.ID_UO = a15.ID_UO)
	JOIN	DWTG_Colunar_VBL.WD_ORGAO_EXERCICIO			a16
	  ON 	(a15.ID_ANO = a16.ID_ANO AND 
			a15.ID_ORGAO_UO = a16.ID_ORGAO)
	JOIN	DWTG_Colunar_VBL.WD_ORGAO_SUPE_EXERCICIO	a17
	  ON 	(a16.ID_ANO = a17.ID_ANO AND 
			a16.ID_ORGAO_SUPE = a17.ID_ORGAO_SUPE)
	JOIN	DWTG_Colunar_VBL.WD_ORGAO_EXERCICIO			a18
	  ON 	(a14.ID_ANO = a18.ID_ANO AND 
			a14.ID_ORGAO_UG = a18.ID_ORGAO)
	JOIN	DWTG_Colunar_VBL.WD_ORGAO_SUPE_EXERCICIO	a19
	  ON 	(a18.ID_ANO = a19.ID_ANO AND 
			a18.ID_ORGAO_SUPE = a19.ID_ORGAO_SUPE)
	JOIN	DWTG_Colunar_VBL.WD_UG						a110
	  ON 	(a14.ID_UG = a110.ID_UG)
	JOIN	DWTG_Colunar_VBL.WD_ACAO_PT					a111
	  ON 	(a11.ID_ACAO_PT = a111.ID_ACAO_PT)
	JOIN	DWTG_Colunar_VBL.WD_FUNCAO_PT				a112
	  ON 	(a11.ID_FUNCAO_PT = a112.ID_FUNCAO_PT)
	JOIN	DWTG_Colunar_VBL.WD_ITEM_INFORMACAO			a113
	  ON 	(a12.ID_ITEM_INFORMACAO = a113.ID_ITEM_INFORMACAO)
	JOIN	DWTG_Colunar_VBL.WD_MES_BASE				a115
	  ON 	(a11.ID_MES_LANC = a115.ID_MES)
	JOIN	DWTG_Colunar_VBL.WD_NATUREZA_DESPESA_DETA	a116
	  ON 	(a11.ID_CATEGORIA_ECONOMICA_NADE = a116.ID_CATEGORIA_ECONOMICA_NADE AND 
			a11.ID_ELEMENTO_DESPESA_NADE = a116.ID_ELEMENTO_DESPESA_NADE AND 
			a11.ID_GRUPO_DESPESA_NADE = a116.ID_GRUPO_DESPESA_NADE AND 
			a11.ID_MOAP_NADE = a116.ID_MOAP_NADE AND 
			a11.ID_SUBITEM_NADE = a116.ID_SUBITEM_NADE)
	JOIN	DWTG_Colunar_VBL.WD_SUBFUNCAO_PT			a117
	  ON 	(a11.ID_SUBFUNCAO_PT = a117.ID_SUBFUNCAO_PT)
	JOIN	DWTG_Colunar_VBL.WD_ORGAO					a119
	  ON 	(a15.ID_ORGAO_UO = a119.ID_ORGAO)
	JOIN	DWTG_Colunar_VBL.WD_ORGAO_MAXI				a120
	  ON 	(a17.ID_ORGAO_MAXI = a120.ID_ORGAO_MAXI)
	JOIN	DWTG_Colunar_VBL.WD_ORGAO					a121
	  ON 	(a14.ID_ORGAO_UG = a121.ID_ORGAO)
	JOIN	DWTG_Colunar_VBL.WD_ORGAO_MAXI				a122
	  ON 	(a19.ID_ORGAO_MAXI = a122.ID_ORGAO_MAXI)
WHERE	
	(a11.ID_CATEGORIA_ECONOMICA_NADE = 3
	 AND (a11.ID_GRUPO_DESPESA_NADE = 3
	 AND (a11.ID_MOAP_NADE = 90
	 AND a11.ID_ELEMENTO_DESPESA_NADE IN (39))) --(4, 14, 15, 30, 31, 32, 33, 34, 35, 36, 37, 39, 40)))
	 AND a17.ID_ORGAO_MAXI IN (22000, 25000, 20103, 20105, 20113, 23000, 24000, 28000, 30000, 32000, 33000, 34000, 35000, 38000, 39000, 40000, 41000, 42000, 44000, 47000, 49000, 51000, 53000, 54000, 55000, 56000, 58000, 81000, 82000, 26000, 36000, 20000, 20101, 20114, 26455, 26457, 52000, 57000, 63000)
	 AND a12.ID_ITEM_INFORMACAO IN (423)
	 AND a11.ID_ANO_LANC IN (2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020) --(2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020)
--	 AND a11.ID_MES_LANC IN (1, 2)
	 AND a13.ID_TP_NE IN (3, 5)
	 AND a11.VA_MOVIMENTO_LIQUIDO <> 0
	 AND a110.ID_MOEDA_UG IN (790))
GROUP BY	
	a12.ID_ITEM_INFORMACAO,
	a11.ID_ANO_LANC,
--	a11.ID_MES_LANC,
--	a14.ID_ORGAO_UG,
--	a11.ID_FUNCAO_PT,
--	a11.ID_SUBFUNCAO_PT,
--	a11.ID_ACAO_PT,
--	a17.ID_ORGAO_MAXI,
	a14.ID_UG,
--	a15.ID_ORGAO_UO,
--	a19.ID_ORGAO_MAXI,
	a11.ID_CATEGORIA_ECONOMICA_NADE, 
	a11.ID_ELEMENTO_DESPESA_NADE,
	a11.ID_GRUPO_DESPESA_NADE,
	a11.ID_MOAP_NADE,
	a11.ID_SUBITEM_NADE;