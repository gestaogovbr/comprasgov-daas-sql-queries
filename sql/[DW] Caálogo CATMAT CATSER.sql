select
	a14.ID_ITCP_TP_MATERIAL_SERVICO  	ID_ITCP_TP_MATERIAL_SERVICO,
	a18.DS_ITCP_TP_MATERIAL_SERVICO  	DS_ITCP_TP_MATERIAL_SERVICO,
	a14.ID_ITCP_GRUPO_MATERIAL  		ID_ITCP_GRUPO_MATERIAL,
	a19.DS_ITCP_GRUPO_MATERIAL  		DS_ITCP_GRUPO_MATERIAL
--	a14.ID_ITCP_CLASSE_MAT_SERV  		ID_ITCP_CLASSE_MAT_SERV,
--	a15.ID_ITCP_CLASSE_MAT_SERV_EDIT  	DS_ITCP_CLASSE_MAT_SERV,
--	a15.DS_ITCP_CLASSE_MAT_SERV 		DS_ITCP_CLASSE_MAT_SERV0,
--	a14.ID_ITCP_PADRAO_DESC_MAT  		ID_ITCP_PADRAO_DESC_MAT,
--	a16.DS_ITCP_PADRAO_DESC_MAT  		DS_ITCP_PADRAO_DESC_MAT,
--	a14.ID_ITCP_TP_COD_MAT_SERV  		ID_ITCP_TP_COD_MAT_SERV,
--	a14.ID_ITCP_MATERIAL_SERVICO  		ID_ITCP_MATERIAL_SERVICO,
--	a14.DS_ITCP_MATERIAL_SERVICO  		DS_ITCP_MATERIAL_SERVICO,
--	a14.ID_ITCP_SIT_ATUAL_MAT_SERV  	ID_ITCP_SIT_ATUAL_MAT_SERV,
--	a17.DS_ITCP_SIT_ATUAL_MAT_SERV 		DS_ITCP_SIT_ATUAL_MAT_SERV
from		Siasg_DW_VBL.D_ITCP_MATERIAL_SERVICO	a14
	join	Siasg_DW_VBL.D_ITCP_CLASSE_MAT_SERV	a15
	  on 	(a14.ID_ITCP_CLASSE_MAT_SERV = a15.ID_ITCP_CLASSE_MAT_SERV)
	join	Siasg_DW_VBL.D_ITCP_PADRAO_DESC_MAT	a16
	  on 	(a14.ID_ITCP_PADRAO_DESC_MAT = a16.ID_ITCP_PADRAO_DESC_MAT)
	join	Siasg_DW_VBL.D_ITCP_SIT_ATUAL_MAT_SERV a17 
	  on	(a14.ID_ITCP_SIT_ATUAL_MAT_SERV = a17.ID_ITCP_SIT_ATUAL_MAT_SERV)
	join	Siasg_DW_VBL.D_ITCP_TP_MATERIAL_SERVICO	a18
	  on 	(a14.ID_ITCP_TP_MATERIAL_SERVICO = a18.ID_ITCP_TP_MATERIAL_SERVICO)
	join	Siasg_DW_VBL.D_ITCP_GRUPO_MATERIAL	a19
	  on 	(a14.ID_ITCP_GRUPO_MATERIAL = a19.ID_ITCP_GRUPO_MATERIAL)
group by	
	a14.ID_ITCP_TP_MATERIAL_SERVICO,
	a18.DS_ITCP_TP_MATERIAL_SERVICO,
	a14.ID_ITCP_GRUPO_MATERIAL,
	a19.DS_ITCP_GRUPO_MATERIAL
--	a14.ID_ITCP_CLASSE_MAT_SERV,
--	a15.ID_ITCP_CLASSE_MAT_SERV_EDIT,
--	a15.DS_ITCP_CLASSE_MAT_SERV,
--	a14.ID_ITCP_PADRAO_DESC_MAT,
--	a14.ID_ITCP_TP_COD_MAT_SERV,
--	a16.DS_ITCP_PADRAO_DESC_MAT,
--	a14.DS_ITCP_MATERIAL_SERVICO,
--	a14.ID_ITCP_MATERIAL_SERVICO,
--	a14.ID_ITCP_SIT_ATUAL_MAT_SERV,
--	a17.DS_ITCP_SIT_ATUAL_MAT_SERV
--order by
--	a18.DS_ITCP_TP_MATERIAL_SERVICO,
--	a19.DS_ITCP_GRUPO_MATERIAL,
--	a15.DS_ITCP_CLASSE_MAT_SERV,
--	a16.DS_ITCP_PADRAO_DESC_MAT,
--	a14.DS_ITCP_MATERIAL_SERVICO,
--	a17.DS_ITCP_SIT_ATUAL_MAT_SERV