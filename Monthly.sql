(SELECT
case when REF_INSCARR.ref_dspl is not null then REF_INSCARR.ref_dspl else ' ' end as Ins_Carrier,' ' as Request_Type,case when Case_Number is not null then Case_Number else ' ' end as Case_Number,case when Episode_ID is not null then Episode_ID else ' ' end as Episode_ID,case when Episode_Dt is not null then convert(varchar(10), cast(Episode_Dt as date), 101) else ' ' end as Episode_Dt,case when Case_Priority is not null then Case_Priority else ' ' end as Case_Priority,' ' as TAT_Hours,' ' as TATCompliant,case when Case_Status is not null then Case_Status else ' ' end as Case_Status,
case when REF_TEL.ref_desc is not null then REF_TEL.ref_desc else ' ' end as Case_Status_Desc,' ' as Rqst_Add_Info_Dt,' ' as Rqst_P2P_Dt,case when C_TEL.peer_to_peer_rev_dt is not null then convert(varchar(10),cast(C_TEL.peer_to_peer_rev_dt as date), 101) else ' ' end as P2P_Occur_Dt,case when Auth_Appr_Start_Dt is not null then Auth_Appr_Start_Dt else ' ' end as Auth_Appr_Start_Dt,case when P_TEL.srvc_end_dt is not null then convert(varchar(10),cast(P_TEL.srvc_end_dt as date), 101) else ' ' end as Auth_Expire_Dt,' ' as Denial_Code,' ' as Denial_Description,case when Non_Cert_Phys_Last_Name is null then ' ' else Non_Cert_Phys_Last_Name  end as Non_Cert_Phys_Last_Name,case when Non_Cert_Phys_First_Name is null then ' ' else Non_Cert_Phys_First_Name end as Non_Cert_Phys_First_Name,case when C_TEL.decn_rndr_dttm is not null then convert(varchar(10),cast(C_TEL.decn_rndr_dttm as date), 101) else ' ' end as Cover_Determine_Decision_Dt,
case when C_TEL.wrt_decn_cmnct_dttm is not null then convert(varchar(10),cast(C_TEL.wrt_decn_cmnct_dttm as date), 101) else ' ' end as Cover_Determine_Letter_Dt,' ' as New_Revised,case when Clinical_Trial is not null then Clinical_Trial else ' ' end as Clinical_Trial,

case when REF_CS.ref_dspl is not null then REF_CS.ref_dspl else ' ' end as 

Cancer_Type,case when Diagnosis_Cd is not null then Diagnosis_Cd else ' ' end as Diagnosis_Cd,case when Location is not null then Location else ' ' end as Location,' ' as Adult_Pediatric,
case when Custom is not null then Custom else ' ' end as Custom,' ' as Metastatic_at_Diag,' ' as Progression_Recurrence,case when First_Relapse_Dt is not null then First_Relapse_Dt else ' ' end as First_Relapse_Dt,case when substring(REF_TEL_1.REF_DSPL,1,10) is not null then substring(REF_TEL_1.REF_DSPL,1,10) else ' ' end as Treatment_Type,case when trt_guid_typ_id is not null then trt_guid_typ_id else ' ' end as Treatment_Line,case when DOD is not null then DOD else ' ' end as Date_Of_Diag,case when Stage_Diag_Adjuvant is not null then Stage_Diag_Adjuvant else ' ' end as Stage_Diag_Adjuvant,' ' as Stage_Diag_Adjuvant_Tumor,' ' as Stage_Diag_Adjuvant_Node,' ' as Stage_Diag_Adjuvant_Met,case when HER2Status is not null then HER2Status else ' ' end as HER2Status,case when Hormone_Receptor_Status_ER is not null then Hormone_Receptor_Status_ER else ' ' end as Hormone_Receptor_Status_ER,
case when Hormone_Receptor_Status_PR is not null then Hormone_Receptor_Status_PR else ' ' end as Hormone_Receptor_Status_PR,' ' as Onco_Type_DX,' ' as Mammo_Print,' ' as Mammo_Strat,case when Histology is not null then Histology else ' ' end as Histology,case when EGFR is not null then EGFR else ' ' end as EGFR,case when ALK is not null then ALK else ' ' end as ALK,case when BRAF is not null then BRAF else ' ' end as BRAF,case when KRAS is not null then KRAS else ' ' end as KRAS,case when MET is not null then MET else ' ' end as MET,case when RET is not null then RET else ' ' end as RET,case when ROS1 is not null then ROS1 else ' ' end as ROS1,' ' as PSA,' ' as Primary_Gleason_Score,' ' as Secondary_Gleason_Score,case when NCCNRegimen_Offered is not null then NCCNRegimen_Offered else ' ' end as NCCNRegimen_Offered,case when NCCNRegimen_Selected is not null then NCCNRegimen_Selected else ' ' end as NCCNRegimen_Selected,' ' as HCPCCode,' ' as HCPCCode_Descr,case when w_tel.proc_cd is not null then w_tel.proc_cd else ' ' end as HCPCCode_Apv,case when A_TEL.cd_desc is not null then A_TEL.cd_desc else ' ' end as HCPCCode_Descr_Apv,case when ICD9Code is not null then ICD9Code else ' ' end as ICD9Code,case when M_tel.cd_desc is not null then M_tel.cd_desc else ' ' end as Diagnosis_Desc,case when Ord_Phys_Fst_Nm is null then ' ' else Ord_Phys_Fst_Nm end as Ord_Phys_Fst_Nm,
case when Ord_Phys_Lst_Nm is null then ' ' else Ord_Phys_Lst_Nm end as Ord_Phys_Lst_Nm,case when Ord_Phys_Specialty is null then ' ' else Ord_Phys_Specialty end as Ord_Phys_Specialty,case when Ord_Phys_MPIN is null then ' ' else Ord_Phys_MPIN end as Ord_Phys_MPIN,case when Ord_Phys_TIN is null then ' ' else Ord_Phys_TIN end as Ord_Phys_TIN,case when Ord_Phys_Addr1 is null then ' ' else Ord_Phys_Addr1 end as Ord_Phys_Addr1,case when Ord_Phys_Addr2 is null then ' ' else Ord_Phys_Addr2 end as Ord_Phys_Addr2,case when Ord_Phys_City is null then ' ' else Ord_Phys_City end as Ord_Phys_City,case when Ord_Phys_State is null then ' ' else Ord_Phys_State end as Ord_Phys_State,case when Ord_Phys_Zip is null then ' ' else Ord_Phys_Zip end as Ord_Phys_Zip,case when Ord_Phys_Phone is null then ' ' else Ord_Phys_Phone end as Ord_Phys_Phone,case when Ord_Phys_Fax is null then ' ' else Ord_Phys_Fax end as Ord_Phys_Fax,
case when Person_Entered_Case is not null then Person_Entered_Case else ' ' end as Person_Entered_Case,case when Ord_Same_Rndr is not null then Ord_Same_Rndr else ' ' end as Ord_Same_Rndr,case when fst_nm is not null then fst_nm else ' ' end as Mbr_Fst_Nm,case when lst_nm is not null then lst_nm else ' ' end as Mbr_Lst_Nm,case when bth_dt is not null then convert(varchar(10),cast(bth_dt as date), 101) else ' ' end as MBR_DOB,
case when Z_MID.MBR_ID_TXT is not null then Z_MID.MBR_ID_TXT else ' ' end as Mbr_ID,
case when Mbr_Group_Nbr is not null then Mbr_Group_Nbr else ' ' end as Mbr_Group_Nbr,case when adr_ln_1_txt is not null then adr_ln_1_txt else ' ' end as Mbr_Addr1,case when adr_ln_2_txt is not null then adr_ln_2_txt else ' ' end as Mbr_Addr2,case when cty_nm is not null then cty_nm else ' ' end as Mbr_City,case when st_cd is not null then st_cd else ' ' end as Mbr_State,case when zip_cd_txt is not null then zip_cd_txt else ' ' end as Mbr_Zip,case when Mbr_Funding_Type is not null then Mbr_Funding_Type else ' ' end as Mbr_Funding_Type,
case when Rndr_Prvdr_Lst_Nm is null then ' ' else Rndr_Prvdr_Lst_Nm end as Rndr_Prvdr_Lst_Nm,case when Rndr_Prvdr_Fst_Nm is null then ' ' else Rndr_Prvdr_Fst_Nm end as Rndr_Prvdr_Fst_Nm,case when Rndr_Prvdr_Specialty is null then ' ' else Rndr_Prvdr_Specialty end as Rndr_Prvdr_Specialty,case when Rndr_Prvdr_MPIN is null then ' ' else Rndr_Prvdr_MPIN end as Rndr_Prvdr_MPIN,case when Rndr_Prvdr_TIN is null then ' ' else Rndr_Prvdr_TIN end as Rndr_Prvdr_TIN,case when Rndr_Prvdr_Addr1 is null then ' ' else Rndr_Prvdr_Addr1 end as Rndr_Prvdr_Addr1,case when Rndr_Prvdr_Addr2 is null then ' ' else Rndr_Prvdr_Addr2 end as Rndr_Prvdr_Addr2,case when Rndr_Prvdr_City is null then ' ' else Rndr_Prvdr_City end as Rndr_Prvdr_City,
case when Rndr_Prvdr_State is null then ' ' else Rndr_Prvdr_State end as Rndr_Prvdr_State,case when Rndr_Prvdr_Zip is null then ' ' else Rndr_Prvdr_Zip end as Rndr_Prvdr_Zip,case when Rndr_Prvdr_Phone is null then ' ' else Rndr_Prvdr_Phone end as Rndr_Prvdr_Phone,case when Rndr_Prvdr_Fax is null then ' ' else Rndr_Prvdr_Fax end as Rndr_Prvdr_Fax,case when LOB is not null then LOB else ' ' end as LOB,' ' as Bckdt_Rsn,case when Mnpsl_St is not null then Mnpsl_St else ' ' end as Mnpsl_St,case when Pregnant is not null then Pregnant else ' ' end as Pregnant,case when PDL1 is not null then PDL1 else ' ' end as PDL1,case when  BRAF_V600E_Mutatn  is not null then  BRAF_V600E_Mutatn  else ' '  end as  BRAF_V600E_Mutatn,case when  Indication  is not null then  Indication  else ' '  end as  Indication,case when  Sppt_Cre  is not null then  Sppt_Cre  else ' '  end as  Sppt_Cre,case when  Andro_Rcptr  is not null then  Andro_Rcptr  else ' '  end as  Andro_Rcptr,case when  Ulms  is not null then  Ulms  else ' '  end as  Ulms,case when  Age  is not null then  Age  else ' '  end as  Age,case when  Flt3  is not null then  Flt3  else ' '  end as  Flt3,case when  Cd33  is not null then  Cd33  else ' '  end as  Cd33,case when  Flt3_Itd  is not null then  Flt3_Itd  else ' '  end as  Flt3_Itd,case when  IDH1  is not null then  IDH1  else ' '  end as  IDH1,case when  IDH2  is not null then  IDH2  else ' '  end as  IDH2,case when  Plt_Snst_St  is not null then  Plt_Snst_St  else ' '  end as  Plt_Snst_St,case when  Ln_Thrpy  is not null then  Ln_Thrpy  else ' '  end as  Ln_Thrpy,case when  BRAF_V600K_Mutatn  is not null then  BRAF_V600K_Mutatn  else ' '  end as  BRAF_V600K_Mutatn,case when  BRAF_V600K  is not null then  BRAF_V600K  else ' '  end as  BRAF_V600K,case when  Ckit_Mutatn  is not null then  Ckit_Mutatn  else ' '  end as  Ckit_Mutatn,case when  Phase  is not null then  Phase  else ' '  end as  Phase,case when  Risk_Level  is not null then  Risk_Level  else ' '  end as  Risk_Level,
case when  CNS_DSES  is not null then  CNS_DSES  else ' '  end as  CNS_DSES,case when  CD20  is not null then  CD20  else ' '  end as  CD20,case when  CD30  is not null then  CD30  else ' '  end as  CD30,case when  Trnsp_Cndt  is not null then  Trnsp_Cndt  else ' '  end as  Trnsp_Cndt,case when  T315I  is not null then  T315I  else ' '  end as  T315I,case when  PDL1_Grt  is not null then  PDL1_Grt  else ' '  end as  PDL1_Grt,case when  Cncr_Sbtp  is not null then  Cncr_Sbtp  else ' '  end as  Cncr_Sbtp,case when  DSES_Stat  is not null then  DSES_Stat  else ' '  end as  DSES_Stat,case when  Epo  is not null then  Epo  else ' '  end as  Epo,case when  Del_SQ  is not null then  Del_SQ  else ' '  end as  Del_SQ,case when  Fail_No_Rdoio  is not null then  Fail_No_Rdoio  else ' '  end as  Fail_No_Rdoio,case when  Prg_Sym_Dses  is not null then  Prg_Sym_Dses  else ' '  end as  Prg_Sym_Dses,case when  Del_TP53  is not null then  Del_TP53  else ' '  end as  Del_TP53,case when  HER2_Mutatn  is not null then  HER2_Mutatn  else ' '  end as  HER2_Mutatn,case when  Frl_Ptnt  is not null then  Frl_Ptnt  else ' '  end as  Frl_Ptnt,case when  Age_Und_65  is not null then  Age_Und_65  else ' '  end as  Age_Und_65,case when  Sm_Rcptr  is not null then  Sm_Rcptr  else ' '  end as  Sm_Rcptr,case when  ALK_ALCL  is not null then  ALK_ALCL  else ' '  end as  ALK_ALCL,case when  Pln_Trnsp  is not null then  Pln_Trnsp  else ' '  end as  Pln_Trnsp,case when  Slw_Prg_Dses  is not null then  Slw_Prg_Dses  else ' '  end as  Slw_Prg_Dses,case when  Eosin_W_Gene  is not null then  Eosin_W_Gene  else ' '  end as  Eosin_W_Gene,
case when  Rpd_Cytordtn  is not null then  Rpd_Cytordtn  else ' '  end as  Rpd_Cytordtn,case when  Kit_mutatn_neg  is not null then  Kit_mutatn_neg  else ' '  end as  Kit_mutatn_neg,case when  BRCA_1_2   is not null then  BRCA_1_2   else ' '  end as  BRCA_1_2 ,case when  MSI_MMR  is not null then  MSI_MMR  else ' '  end as  MSI_MMR,
case when  BRAF_V600E  is not null then  BRAF_V600E  else ' '  end as  BRAF_V600E,
case when REF_CS.ref_cd is not null then REF_CS.ref_cd else ' ' end as Disease_Code
FROM
(SELECT  DISTINCT Case_Number,Episode_ID,Episode_Dt,Case_Priority,Case_Status,Clinical_Trial,Cancer_Type,Custom,NCCNRegimen_Offered,NCCNRegimen_Selected,Person_Entered_Case,Auth_Appr_Start_Dt,First_Relapse_Dt,DOD,Diagnosis_Cd,ICD9Code,
Location,Stage_Diag_Adjuvant,HER2Status,Hormone_Receptor_Status_ER,Hormone_Receptor_Status_PR,Histology,EGFR,ALK,BRAF,KRAS,MET,RET,ROS1,Mnpsl_St,Pregnant,PDL1,BRAF_V600E_Mutatn,Indication,Sppt_Cre,Andro_Rcptr,Ulms,Age,Flt3,Cd33,Flt3_Itd,IDH1,IDH2,Plt_Snst_St,Ln_Thrpy,
BRAF_V600K_Mutatn,BRAF_V600K,Ckit_Mutatn,Phase,Risk_Level,CNS_DSES,CD20,CD30,Trnsp_Cndt,T315I,PDL1_Grt,Cncr_Sbtp,DSES_Stat,Epo,Del_SQ ,Fail_No_Rdoio,Prg_Sym_Dses,Del_TP53,HER2_Mutatn,Frl_Ptnt,Age_Und_65,Sm_Rcptr,ALK_ALCL,
Pln_Trnsp,Slw_Prg_Dses,Eosin_W_Gene,Rpd_Cytordtn,Kit_mutatn_neg,BRCA_1_2,MSI_MMR,BRAF_V600E,Ins_Carrier,Mbr_Group_Nbr,Mbr_Funding_Type,LOB,Ord_Same_Rndr,Ord_Phys_Fst_Nm,Rndr_Prvdr_Lst_Nm,Ord_Phys_Lst_Nm,Ord_Phys_Specialty,Ord_Phys_MPIN,Ord_Phys_TIN,Ord_Phys_Addr1,Ord_Phys_Addr2,Ord_Phys_City,Ord_Phys_State,Ord_Phys_Zip,Ord_Phys_Phone,Ord_Phys_Fax,Rndr_Prvdr_Fst_Nm,Rndr_Prvdr_Specialty,Rndr_Prvdr_MPIN,Rndr_Prvdr_TIN,Rndr_Prvdr_Addr1,Rndr_Prvdr_Addr2,Rndr_Prvdr_City,Rndr_Prvdr_State,Rndr_Prvdr_Zip,Rndr_Prvdr_Phone,Rndr_Prvdr_Fax,req_trt_rgmn_ver_id,MBR_ID as TEST,
Ord_Phys_Fst_Nm as Non_Cert_Phys_First_Name,Ord_Phys_Lst_Nm as Non_Cert_Phys_Last_Name,hsc_sts_typ_id
FROM
(Select
Case_Number,Episode_ID,Episode_Dt,Case_Priority,Case_Status,Clinical_Trial,Cancer_Type,Custom,NCCNRegimen_Offered,NCCNRegimen_Selected,Person_Entered_Case,Auth_Appr_Start_Dt,First_Relapse_Dt,DOD,Diagnosis_Cd,Date_Of_Diag,ICD9Code,
Location,Stage_Diag_Adjuvant,HER2Status,Hormone_Receptor_Status_ER,Hormone_Receptor_Status_PR,Histology,EGFR,ALK,BRAF,KRAS,MET,RET,ROS1,Mnpsl_St,Pregnant,PDL1,BRAF_V600E_Mutatn,Indication,Sppt_Cre,Andro_Rcptr,Ulms,Age,Flt3,Cd33,Flt3_Itd,IDH1,IDH2,Plt_Snst_St,Ln_Thrpy,
BRAF_V600K_Mutatn,BRAF_V600K,Ckit_Mutatn,Phase,Risk_Level,CNS_DSES,CD20,CD30,Trnsp_Cndt,T315I,PDL1_Grt,Cncr_Sbtp,DSES_Stat,Epo,Del_SQ,Fail_No_Rdoio,Prg_Sym_Dses,Del_TP53,HER2_Mutatn,Frl_Ptnt,Age_Und_65,Sm_Rcptr,ALK_ALCL,
Pln_Trnsp,Slw_Prg_Dses,Eosin_W_Gene,Rpd_Cytordtn,Kit_mutatn_neg,BRCA_1_2,MSI_MMR,BRAF_V600E,Ins_Carrier,Mbr_Group_Nbr,Mbr_Funding_Type,LOB,PROV_SEQ_NBR,RF_COLUMN,SJ_COLUMN,Ord_Same_Rndr,
case when RF_COLUMN is not null then F.fst_nm else '' end as bh,case when RF_COLUMN is not null then F.lst_nm else ' ' end as LN,case when RF_COLUMN is not null then F.spcl_typ_id else ' ' end as SPID,case when RF_COLUMN is not null then F.ndb_mpin else ' ' end as mpin,
case when RF_COLUMN is not null then F.fed_tax_id else ' ' end as TID,case when RF_COLUMN is not null then F.adr_ln_1_txt else ' ' end as AD1,case when RF_COLUMN is not null then F.adr_ln_2_txt else ' ' end as AD2,case when RF_COLUMN is not null then F.cty_nm else ' ' end as CN,
case when RF_COLUMN is not null then F.st_cd else ' ' end as SCD,case when RF_COLUMN is not null then F.zip_cd_txt else ' ' end as ZCD,case when RF_COLUMN is not null then F.pri_tel_nbr else ' ' end as TNBR,case when RF_COLUMN is not null then F.fax_nbr else ' ' end as FNBR,
case when SJ_COLUMN is not null then F.lst_nm else ' ' end as t1,case when SJ_COLUMN is not null then F.fst_nm else ' ' end as FN,case when SJ_COLUMN is not null then F.spcl_typ_id else ' ' end as SID,case when SJ_COLUMN is not null then F.ndb_mpin else ' ' end as SMPIN,
case when SJ_COLUMN is not null then F.fed_tax_id else ' ' end as SFID,case when SJ_COLUMN is not null then F.adr_ln_1_txt else ' ' end as SAD1,case when SJ_COLUMN is not null then F.adr_ln_2_txt else ' ' end as SAD2,case when SJ_COLUMN is not null then F.cty_nm else ' ' end as SCN,
case when SJ_COLUMN is not null then F.st_cd else ' ' end as SCD1,case when SJ_COLUMN is not null then F.zip_cd_txt else ' ' end as SZIP,case when SJ_COLUMN is not null then F.pri_tel_nbr else ' ' end as SPNBR,case when SJ_COLUMN is not null then F.fax_nbr else ' ' end as SFNBR,
req_trt_rgmn_ver_id,MBR_ID,hsc_sts_typ_id
FROM
(select
Case_Number,Episode_ID,Episode_Dt,Case_Priority,Case_Status,Clinical_Trial,Cancer_Type,Custom,NCCNRegimen_Offered,NCCNRegimen_Selected,Person_Entered_Case,Auth_Appr_Start_Dt,First_Relapse_Dt,DOD,Diagnosis_Cd,Date_Of_Diag,ICD9Code,
Location,Stage_Diag_Adjuvant,HER2Status,Hormone_Receptor_Status_ER,Hormone_Receptor_Status_PR,Histology,EGFR,ALK,BRAF,KRAS,MET,RET,ROS1,Mnpsl_St,Pregnant,PDL1,BRAF_V600E_Mutatn,Indication,Sppt_Cre,Andro_Rcptr,Ulms,Age,Flt3,Cd33,Flt3_Itd,IDH1,IDH2,Plt_Snst_St,Ln_Thrpy,
BRAF_V600K_Mutatn,BRAF_V600K,Ckit_Mutatn,Phase,Risk_Level,CNS_DSES,CD20,CD30,Trnsp_Cndt,T315I,PDL1_Grt,Cncr_Sbtp,DSES_Stat,Epo,Del_SQ,Fail_No_Rdoio,Prg_Sym_Dses,Del_TP53,HER2_Mutatn,Frl_Ptnt,Age_Und_65,Sm_Rcptr,ALK_ALCL,
Pln_Trnsp,Slw_Prg_Dses,Eosin_W_Gene,Rpd_Cytordtn,Kit_mutatn_neg,BRCA_1_2,MSI_MMR,BRAF_V600E,Ins_Carrier,Mbr_Group_Nbr,Mbr_Funding_Type,LOB,PROV_SEQ_NBR as PROV_SEQ_NBR_1,RF_COLUMN,SJ_COLUMN,Ord_Same_Rndr,req_trt_rgmn_ver_id,MBR_ID,hsc_sts_typ_id
FROM
(select Case_Number,Episode_ID,Episode_Dt,Case_Priority,Case_Status,Clinical_Trial,Cancer_Type,Custom,NCCNRegimen_Offered,NCCNRegimen_Selected,Person_Entered_Case,Auth_Appr_Start_Dt,First_Relapse_Dt,DOD,Diagnosis_Cd,Date_Of_Diag,ICD9Code,
Location,Stage_Diag_Adjuvant,HER2Status,Hormone_Receptor_Status_ER,Hormone_Receptor_Status_PR,Histology,EGFR,ALK,BRAF,KRAS,MET,RET,ROS1,Mnpsl_St,Pregnant,PDL1,BRAF_V600E_Mutatn,Indication,Sppt_Cre,Andro_Rcptr,Ulms,Age,Flt3,Cd33,Flt3_Itd,IDH1,IDH2,Plt_Snst_St,Ln_Thrpy,
BRAF_V600K_Mutatn,BRAF_V600K,Ckit_Mutatn,Phase,Risk_Level,CNS_DSES,CD20,CD30,Trnsp_Cndt,T315I,PDL1_Grt,Cncr_Sbtp,DSES_Stat,Epo,Del_SQ,Fail_No_Rdoio,Prg_Sym_Dses,Del_TP53,HER2_Mutatn,Frl_Ptnt,Age_Und_65,Sm_Rcptr,ALK_ALCL,
Pln_Trnsp,Slw_Prg_Dses,Eosin_W_Gene,Rpd_Cytordtn,Kit_mutatn_neg,BRCA_1_2,MSI_MMR,BRAF_V600E,E.lgl_enty_id as Ins_Carrier,
E.pol_nbr as Mbr_Group_Nbr,E.Fund_arng_ID as Mbr_Funding_Type,E.lob_typ_id as LOB,req_trt_rgmn_ver_id,MBR_ID,hsc_sts_typ_id
FROM
(select Case_Number,Episode_ID,Episode_Dt,Case_Priority,Case_Status,Clinical_Trial,Cancer_Type,Custom,NCCNRegimen_Offered,NCCNRegimen_Selected,Person_Entered_Case,Auth_Appr_Start_Dt,First_Relapse_Dt,DOD,Diagnosis_Cd,Date_Of_Diag,ICD9Code,
[59] as Location,[1] as Stage_Diag_Adjuvant,[5] as HER2Status,[4] as Hormone_Receptor_Status_ER,[4] as Hormone_Receptor_Status_PR,[12] as Histology,[14] as EGFR,[15] as ALK,[46] as BRAF,[7] as KRAS,[19] as MET,[18] as RET,[16] as ROS1,[10] as Mnpsl_St,[11] as Pregnant,
[13] as PDL1,[17] as BRAF_V600E_Mutatn,[2] as Indication,[20] as Sppt_Cre,[21] as Andro_Rcptr,[22] as Ulms,[23] as Age,[24] as Flt3,[25] as Cd33,[26] as Flt3_Itd,[27] as IDH1,[28] as IDH2,[29] as Plt_Snst_St,[3] as Ln_Thrpy,
[30] as BRAF_V600K_Mutatn,[31] as BRAF_V600K,[32] as Ckit_Mutatn,[33] as Phase,[34] as Risk_Level,[35] as CNS_DSES,[36] as CD20,[37] as CD30,[39] as Trnsp_Cndt,[40] as T315I,[41] as PDL1_Grt,[42] as Cncr_Sbtp,
[43] as DSES_Stat,[44] as Epo,[45] as Del_SQ,[47] as Fail_No_Rdoio,[48] as Prg_Sym_Dses,[49] as Del_TP53,[38] as HER2_Mutatn,[50] as Frl_Ptnt,[51] as Age_Und_65,[52] as Sm_Rcptr,[53] as ALK_ALCL,
[54] as Pln_Trnsp,[55] as Slw_Prg_Dses,[56] as Eosin_W_Gene,[57] as Rpd_Cytordtn,[58] as Kit_mutatn_neg,[6] as BRCA_1_2,[8] as MSI_MMR,[9] as BRAF_V600E,req_trt_rgmn_ver_id,MBR_ID,hsc_sts_typ_id
FROM
(SELECT Case_Number,Episode_ID,Episode_Dt,Case_Priority,Case_Status,Clinical_Trial,TRVRS.dses_typ_id as Cancer_Type,Custom,NCCNRegimen_Offered,NCCNRegimen_Selected,Person_Entered_Case,Auth_Appr_Start_Dt,First_Relapse_Dt,DOD,
C.diag_cd as Diagnosis_Cd,c.diag_cd as ICD9Code, convert(varchar(10),cast(C.CREAT_DTTM as date), 101) as Date_Of_Diag,req_trt_rgmn_ver_id,MBR_ID,HSC_DIAG.DSES_TRVRS_ID,hsc_sts_typ_id
FROM
(


select 
Csests.*,
REF_hsc.ref_DSPL as Case_Status
from  (
SELECT 
A.hsc_id as Case_Number,pri_srvc_ref_nbr  as Episode_ID,A.creat_dttm as Episode_Dt, rev_prr_typ_id as Case_Priority,null as Clinical_Trial,
DSES_TRVRS_ID,
req_cstm_trt_rgmn_ind as Custom,req_trt_rgmn_ver_ID as NCCNRegimen_Offered,aprv_trt_rgmn_ver_ID as NCCNRegimen_Selected,A.creat_user_id as Person_Entered_Case,convert(varchar(10), cast([20] as date), 101) as Auth_Appr_Start_Dt ,
convert(varchar(10), cast([7] as date), 101)  as First_Relapse_Dt,convert(varchar(10), cast([3] as date), 101)  as DOD,req_trt_rgmn_ver_id,MBR_ID,hsc_sts_typ_id,
case hsc_sts_typ_id  
  when 1 then (
   CASE f.decn_otcome_typ_id
                        WHEN 2
                        THEN (
                                CASE a.hsc_sts_rsn_typ_id
                                    WHEN 26
                                    THEN 2
                                    WHEN 27
                                    THEN 2
                                    WHEN 28
                                    THEN 2
                                    ELSE 4
                                END)
                        ELSE 4
                    END


  )


     WHEN 2
            THEN (
                    CASE a.hsc_sts_rsn_typ_id
                        WHEN 45
                        THEN 10
                        ELSE (
                                CASE f.decn_otcome_typ_id
                                    WHEN 1
                                    THEN 1
                                    WHEN 2
                                    THEN 2
                                    WHEN 4
                                    THEN 3
                                    ELSE NULL
                                END)
                    END)

   WHEN 5
            THEN (
                    CASE
                        WHEN (a.creat_dttm > (getdate()-45))
                        THEN 7
                        ELSE 8
                    END)
            WHEN 9
            THEN (
                    CASE a.hsc_sts_rsn_typ_id
                        WHEN 44
                        THEN 8
                        ELSE 9
                    END)
            ELSE NULL
  end 

as hscOverallStatusType
from (select * from MBM.HSC) A


LEFT JOIN (
    SELECT *
    FROM (
        SELECT HSC_ATR_VAL,hsc_atr_typ_id,hsc_id
        FROM mbm.hsc_atr
        where hsc_atr_typ_id IN (20,7,3)
    ) AS SRC
    PIVOT( MAX(HSC_ATR_VAL) FOR hsc_atr_typ_id IN ([20],[7],[3])) AS pvt
) AS c
ON c.Hsc_id = A.HSC_ID


left join
(
        SELECT DISTINCT
            aa.hsc_id             AS hsc_id,
            aa.decn_otcome_typ_id AS decn_otcome_typ_id
        FROM
            (MBM.hsc_srvc_decn aa
        JOIN
            MBM.hsc_srvc_non_facl bb
        ON
            (((
                        aa.hsc_id = bb.hsc_id)
                AND (
                        aa.srvc_seq_nbr = bb.srvc_seq_nbr)
                AND (
                        (bb.medcn_admin_rte_typ_id) is null
                    OR  
					(
                            bb.medcn_admin_rte_typ_id <> '01')))))
        WHERE
            (
                aa.inac_ind = 0)) f  on A.hsc_id=f.hsc_id) Csests
				left join (select * from MBM.REF where  ref_nm = 'hscOverallStatusType') REF_hsc
ON REF_hsc.ref_cd = Csests.hscOverallStatusType



)HSC_DIAG
LEFT JOIN
(select * from MBM.DSES_TRVRS)TRVRS
ON TRVRS.[DSES_TRVRS_ID]=HSC_DIAG.dses_trvrs_id
LEFT JOIN
(select *, ROW_NUMBER() OVER(PARTITION BY hsc_id ORDER BY hsc_id desc) as RNK1 from MBM.HSC_DIAG) C
ON HSC_DIAG.Case_Number = C.HSC_ID and RNK1 =1)DSES_TRVRS_CLIN_VAR
LEFT JOIN
(
    SELECT *
    FROM (
        SELECT clin_var_val,clin_var_typ_id,dses_trvrs_id
        FROM mbm.DSES_TRVRS_CLIN_VAR
        where clin_var_typ_id IN (59,1,5,4,12,14,15,46,7,19,18,16,10,11,13,17,2,20,21,22,23,24,25,26,27,28,29,3,30,31,32,33,34,35,36,37,39,40,41,42,43,44,45,47,48,49,38,50,51,52,53,54,55,56,57,58,6,8,9)
    ) AS SRC_1
    PIVOT( MAX(clin_var_val) FOR clin_var_typ_id IN ([59],[1],[5],[4],[12],[14],[15],[46],[7],[19],[18],[16],[10],[11],[13],[17],[2],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[3],[30],[31],[32],[33],[34],[35],[36],[37],[39],[40],[41],[42],[43],[44],[45],[47],[48],[49],[38],[50],[51],[52],[53],[54],[55],[56],[57],[58],[6],[8],[9])) AS pvt1
) AS D
ON D.dses_trvrs_id = DSES_TRVRS_CLIN_VAR.DSES_TRVRS_ID)HSC_MBR_COV
LEFT JOIN
(select *, ROW_NUMBER() OVER(PARTITION BY hsc_id ORDER BY hsc_id desc) as RNK2 from MBM.HSC_MBR_COV) E
ON HSC_MBR_COV.Case_Number = E.HSC_ID and RNK2 =1)MAIN
LEFT JOIN
(SELECT case when RF_COLUMN='RF' and SJ_COLUMN='' then 'NO'
                    when RF_COLUMN='' and SJ_COLUMN='SJ' then 'NO'
                    when RF_COLUMN='RF' and SJ_COLUMN='SJ' then 'YES' ELSE 'NO' END as Ord_Same_Rndr,HSC_ID as b,PROV_SEQ_NBR,RF_COLUMN,SJ_COLUMN
FROM
(SELECT
             HSC_ID,
             PROV_SEQ_NBR,
             max(CASE WHEN prov_role_typ_id = 'RF' THEN prov_role_typ_id end ) AS 'RF_COLUMN',
             max(CASE WHEN prov_role_typ_id = 'SJ' THEN prov_role_typ_id end ) AS 'SJ_COLUMN'
FROM
mbm.HSC_PROV_ROLE group by HSC_ID,PROV_SEQ_NBR
)HSC_PROV_ROLE)HSC_PROV_ROLE_MAIN
ON HSC_PROV_ROLE_MAIN.b = MAIN.CASE_NUMBER)HSC_PROV
LEFT JOIN
(select * from MBM.HSC_PROV) F
on HSC_PROV.PROV_SEQ_NBR_1 =F.PROV_SEQ_NBR and HSC_PROV.case_number =F.HSC_ID)CTE
LEFT JOIN
(select max(b.bh) as Ord_Phys_Fst_Nm,max(b.t1) as Rndr_Prvdr_Lst_Nm,b.case_number as t4,MAX(b.LN) as Ord_Phys_Lst_Nm,       MAX(b.SPID) as Ord_Phys_Specialty,MAX(b.mpin) as Ord_Phys_MPIN,       MAX(b.TID) as Ord_Phys_TIN,MAX(b.AD1) as Ord_Phys_Addr1,MAX(b.AD2) as Ord_Phys_Addr2,     MAX(b.CN) as Ord_Phys_City,MAX(b.SCD) as Ord_Phys_State,MAX(b.ZCD) as Ord_Phys_Zip,MAX(b.TNBR) as Ord_Phys_Phone,MAX(b.FNBR) as Ord_Phys_Fax,MAX(b.FN) as Rndr_Prvdr_Fst_Nm,MAX(b.SID) as Rndr_Prvdr_Specialty,MAX(b.SMPIN) as Rndr_Prvdr_MPIN, MAX(b.SFID) as Rndr_Prvdr_TIN,MAX(b.SAD1) as Rndr_Prvdr_Addr1,MAX(b.SAD2) as Rndr_Prvdr_Addr2,MAX(b.SCN) as Rndr_Prvdr_City,MAX(b.SCD1) as Rndr_Prvdr_State,MAX(b.SZIP) as Rndr_Prvdr_Zip,MAX(b.SPNBR) as Rndr_Prvdr_Phone,MAX(b.SFNBR) as Rndr_Prvdr_Fax
FROM (Select
Case_Number,Episode_ID,Episode_Dt,Case_Priority,Case_Status,Clinical_Trial,Cancer_Type,Custom,NCCNRegimen_Offered,NCCNRegimen_Selected,Person_Entered_Case,Auth_Appr_Start_Dt,First_Relapse_Dt,DOD,Diagnosis_Cd,Date_Of_Diag,ICD9Code,
Location,Stage_Diag_Adjuvant,HER2Status,Hormone_Receptor_Status_ER,Hormone_Receptor_Status_PR,Histology,EGFR,ALK,BRAF,KRAS,MET,RET,ROS1,Mnpsl_St,Pregnant,PDL1,BRAF_V600E_Mutatn,Indication,Sppt_Cre,Andro_Rcptr,Ulms,Age,Flt3,Cd33,Flt3_Itd,IDH1,IDH2,Plt_Snst_St,Ln_Thrpy,
BRAF_V600K_Mutatn,BRAF_V600K,Ckit_Mutatn,Phase,Risk_Level,CNS_DSES,CD20,CD30,Trnsp_Cndt,T315I,PDL1_Grt,Cncr_Sbtp,DSES_Stat,Epo,Del_SQ,Fail_No_Rdoio,Prg_Sym_Dses,Del_TP53,HER2_Mutatn,Frl_Ptnt,Age_Und_65,Sm_Rcptr,ALK_ALCL,
Pln_Trnsp,Slw_Prg_Dses,Eosin_W_Gene,Rpd_Cytordtn,Kit_mutatn_neg,BRCA_1_2,MSI_MMR,BRAF_V600E,Ins_Carrier,Mbr_Group_Nbr,Mbr_Funding_Type,LOB,PROV_SEQ_NBR,RF_COLUMN,SJ_COLUMN,Ord_Same_Rndr,
case when RF_COLUMN is not null then F.fst_nm else '' end as bh,case when RF_COLUMN is not null then F.lst_nm else ' ' end as LN,case when RF_COLUMN is not null then F.spcl_typ_id else ' ' end as SPID,case when RF_COLUMN is not null then F.ndb_mpin else ' ' end as mpin,
case when RF_COLUMN is not null then F.fed_tax_id else ' ' end as TID,case when RF_COLUMN is not null then F.adr_ln_1_txt else ' ' end as AD1,case when RF_COLUMN is not null then F.adr_ln_2_txt else ' ' end as AD2,case when RF_COLUMN is not null then F.cty_nm else ' ' end as CN,
case when RF_COLUMN is not null then F.st_cd else ' ' end as SCD,case when RF_COLUMN is not null then F.zip_cd_txt else ' ' end as ZCD,case when RF_COLUMN is not null then F.pri_tel_nbr else ' ' end as TNBR,case when RF_COLUMN is not null then F.fax_nbr else ' ' end as FNBR,
case when SJ_COLUMN is not null then F.lst_nm else ' ' end as t1,case when SJ_COLUMN is not null then F.fst_nm else ' ' end as FN,case when SJ_COLUMN is not null then F.spcl_typ_id else ' ' end as SID,case when SJ_COLUMN is not null then F.ndb_mpin else ' ' end as SMPIN,
case when SJ_COLUMN is not null then F.fed_tax_id else ' ' end as SFID,case when SJ_COLUMN is not null then F.adr_ln_1_txt else ' ' end as SAD1,case when SJ_COLUMN is not null then F.adr_ln_2_txt else ' ' end as SAD2,case when SJ_COLUMN is not null then F.cty_nm else ' ' end as SCN,
case when SJ_COLUMN is not null then F.st_cd else ' ' end as SCD1,case when SJ_COLUMN is not null then F.zip_cd_txt else ' ' end as SZIP,case when SJ_COLUMN is not null then F.pri_tel_nbr else ' ' end as SPNBR,case when SJ_COLUMN is not null then F.fax_nbr else ' ' end as SFNBR,
req_trt_rgmn_ver_id,MBR_ID
FROM
(select
Case_Number,Episode_ID,Episode_Dt,Case_Priority,Case_Status,Clinical_Trial,Cancer_Type,Custom,NCCNRegimen_Offered,NCCNRegimen_Selected,Person_Entered_Case,Auth_Appr_Start_Dt,First_Relapse_Dt,DOD,Diagnosis_Cd,Date_Of_Diag,ICD9Code,
Location,Stage_Diag_Adjuvant,HER2Status,Hormone_Receptor_Status_ER,Hormone_Receptor_Status_PR,Histology,EGFR,ALK,BRAF,KRAS,MET,RET,ROS1,Mnpsl_St,Pregnant,PDL1,BRAF_V600E_Mutatn,Indication,Sppt_Cre,Andro_Rcptr,Ulms,Age,Flt3,Cd33,Flt3_Itd,IDH1,IDH2,Plt_Snst_St,Ln_Thrpy,
BRAF_V600K_Mutatn,BRAF_V600K,Ckit_Mutatn,Phase,Risk_Level,CNS_DSES,CD20,CD30,Trnsp_Cndt,T315I,PDL1_Grt,Cncr_Sbtp,DSES_Stat,Epo,Del_SQ,Fail_No_Rdoio,Prg_Sym_Dses,Del_TP53,HER2_Mutatn,Frl_Ptnt,Age_Und_65,Sm_Rcptr,ALK_ALCL,
Pln_Trnsp,Slw_Prg_Dses,Eosin_W_Gene,Rpd_Cytordtn,Kit_mutatn_neg,BRCA_1_2,MSI_MMR,BRAF_V600E,Ins_Carrier,Mbr_Group_Nbr,Mbr_Funding_Type,LOB,PROV_SEQ_NBR as PROV_SEQ_NBR_1,RF_COLUMN,SJ_COLUMN,Ord_Same_Rndr,req_trt_rgmn_ver_id,MBR_ID
FROM
(select Case_Number,Episode_ID,Episode_Dt,Case_Priority,Case_Status,Clinical_Trial,Cancer_Type,Custom,NCCNRegimen_Offered,NCCNRegimen_Selected,Person_Entered_Case,Auth_Appr_Start_Dt,First_Relapse_Dt,DOD,Diagnosis_Cd,Date_Of_Diag,ICD9Code,
Location,Stage_Diag_Adjuvant,HER2Status,Hormone_Receptor_Status_ER,Hormone_Receptor_Status_PR,Histology,EGFR,ALK,BRAF,KRAS,MET,RET,ROS1,Mnpsl_St,Pregnant,PDL1,BRAF_V600E_Mutatn,Indication,Sppt_Cre,Andro_Rcptr,Ulms,Age,Flt3,Cd33,Flt3_Itd,IDH1,IDH2,Plt_Snst_St,Ln_Thrpy,
BRAF_V600K_Mutatn,BRAF_V600K,Ckit_Mutatn,Phase,Risk_Level,CNS_DSES,CD20,CD30,Trnsp_Cndt,T315I,PDL1_Grt,Cncr_Sbtp,DSES_Stat,Epo,Del_SQ,Fail_No_Rdoio,Prg_Sym_Dses,Del_TP53,HER2_Mutatn,Frl_Ptnt,Age_Und_65,Sm_Rcptr,ALK_ALCL,
Pln_Trnsp,Slw_Prg_Dses,Eosin_W_Gene,Rpd_Cytordtn,Kit_mutatn_neg,BRCA_1_2,MSI_MMR,BRAF_V600E,E.lgl_enty_id as Ins_Carrier,
E.pol_nbr as Mbr_Group_Nbr,E.Fund_arng_ID as Mbr_Funding_Type,E.lob_typ_id as LOB,req_trt_rgmn_ver_id,MBR_ID
FROM
(select Case_Number,Episode_ID,Episode_Dt,Case_Priority,Case_Status,Clinical_Trial,Cancer_Type,Custom,NCCNRegimen_Offered,NCCNRegimen_Selected,Person_Entered_Case,Auth_Appr_Start_Dt,First_Relapse_Dt,DOD,Diagnosis_Cd,Date_Of_Diag,ICD9Code,
[59] as Location,[1] as Stage_Diag_Adjuvant,[5] as HER2Status,[4] as Hormone_Receptor_Status_ER,[4] as Hormone_Receptor_Status_PR,[12] as Histology,[14] as EGFR,[15] as ALK,[46] as BRAF,[7] as KRAS,[19] as MET,[18] as RET,[16] as ROS1,[10] as Mnpsl_St,[11] as Pregnant,
[13] as PDL1,[17] as BRAF_V600E_Mutatn,[2] as Indication,[20] as Sppt_Cre,[21] as Andro_Rcptr,[22] as Ulms,[23] as Age,[24] as Flt3,[25] as Cd33,[26] as Flt3_Itd,[27] as IDH1,[28] as IDH2,[29] as Plt_Snst_St,[3] as Ln_Thrpy,
[30] as BRAF_V600K_Mutatn,[31] as BRAF_V600K,[32] as Ckit_Mutatn,[33] as Phase,[34] as Risk_Level,[35] as CNS_DSES,[36] as CD20,[37] as CD30,[39] as Trnsp_Cndt,[40] as T315I,[41] as PDL1_Grt,[42] as Cncr_Sbtp,
[43] as DSES_Stat,[44] as Epo,[45] as Del_SQ,[47] as Fail_No_Rdoio,[48] as Prg_Sym_Dses,[49] as Del_TP53,[38] as HER2_Mutatn,[50] as Frl_Ptnt,[51] as Age_Und_65,[52] as Sm_Rcptr,[53] as ALK_ALCL,
[54] as Pln_Trnsp,[55] as Slw_Prg_Dses,[56] as Eosin_W_Gene,[57] as Rpd_Cytordtn,[58] as Kit_mutatn_neg,[6] as BRCA_1_2,[8] as MSI_MMR,[9] as BRAF_V600E,req_trt_rgmn_ver_id,MBR_ID
FROM
(SELECT Case_Number,Episode_ID,Episode_Dt,Case_Priority,Case_Status,Clinical_Trial,TRVRS.dses_typ_id as Cancer_Type,Custom,NCCNRegimen_Offered,NCCNRegimen_Selected,Person_Entered_Case,Auth_Appr_Start_Dt,First_Relapse_Dt,DOD,
C.diag_cd as Diagnosis_Cd,c.diag_cd as ICD9Code, convert(varchar(10),cast(C.CREAT_DTTM as date), 101) as Date_Of_Diag,req_trt_rgmn_ver_id,MBR_ID,HSC_DIAG.DSES_TRVRS_ID
FROM
(
select 
Csests.*,
REF_hsc.ref_DSPL as Case_Status
from  (
SELECT 
A.hsc_id as Case_Number,pri_srvc_ref_nbr  as Episode_ID,A.creat_dttm as Episode_Dt, rev_prr_typ_id as Case_Priority,null as Clinical_Trial,
DSES_TRVRS_ID,
req_cstm_trt_rgmn_ind as Custom,req_trt_rgmn_ver_ID as NCCNRegimen_Offered,aprv_trt_rgmn_ver_ID as NCCNRegimen_Selected,A.creat_user_id as Person_Entered_Case,convert(varchar(10), cast([20] as date), 101) as Auth_Appr_Start_Dt ,
convert(varchar(10), cast([7] as date), 101)  as First_Relapse_Dt,convert(varchar(10), cast([3] as date), 101)  as DOD,req_trt_rgmn_ver_id,MBR_ID,
case hsc_sts_typ_id  
  when 1 then (
   CASE f.decn_otcome_typ_id
                        WHEN 2
                        THEN (
                                CASE a.hsc_sts_rsn_typ_id
                                    WHEN 26
                                    THEN 2
                                    WHEN 27
                                    THEN 2
                                    WHEN 28
                                    THEN 2
                                    ELSE 4
                                END)
                        ELSE 4
                    END


  )


     WHEN 2
            THEN (
                    CASE a.hsc_sts_rsn_typ_id
                        WHEN 45
                        THEN 10
                        ELSE (
                                CASE f.decn_otcome_typ_id
                                    WHEN 1
                                    THEN 1
                                    WHEN 2
                                    THEN 2
                                    WHEN 4
                                    THEN 3
                                    ELSE NULL
                                END)
                    END)

   WHEN 5
            THEN (
                    CASE
                        WHEN (a.creat_dttm > (getdate()-45))
                        THEN 7
                        ELSE 8
                    END)
            WHEN 9
            THEN (
                    CASE a.hsc_sts_rsn_typ_id
                        WHEN 44
                        THEN 8
                        ELSE 9
                    END)
            ELSE NULL
  end 

as hscOverallStatusType
from (select * from MBM.HSC) A


LEFT JOIN (
    SELECT *
    FROM (
        SELECT HSC_ATR_VAL,hsc_atr_typ_id,hsc_id
        FROM mbm.hsc_atr
        where hsc_atr_typ_id IN (20,7,3)
    ) AS SRC
    PIVOT( MAX(HSC_ATR_VAL) FOR hsc_atr_typ_id IN ([20],[7],[3])) AS pvt
) AS c
ON c.Hsc_id = A.HSC_ID


left join
(
        SELECT DISTINCT
            aa.hsc_id             AS hsc_id,
            aa.decn_otcome_typ_id AS decn_otcome_typ_id
        FROM
            (MBM.hsc_srvc_decn aa
        JOIN
            MBM.hsc_srvc_non_facl bb
        ON
            (((
                        aa.hsc_id = bb.hsc_id)
                AND (
                        aa.srvc_seq_nbr = bb.srvc_seq_nbr)
                AND (
                        (bb.medcn_admin_rte_typ_id) is null
                    OR  
					(
                            bb.medcn_admin_rte_typ_id <> '01')))))
        WHERE
            (
                aa.inac_ind = 0)) f  on A.hsc_id=f.hsc_id) Csests
				left join (select * from MBM.REF where  ref_nm = 'hscOverallStatusType') REF_hsc
ON REF_hsc.ref_cd = Csests.hscOverallStatusType


)HSC_DIAG
LEFT JOIN
(select * from MBM.DSES_TRVRS)TRVRS
ON TRVRS.[DSES_TRVRS_ID]=HSC_DIAG.dses_trvrs_id
LEFT JOIN
(select *, ROW_NUMBER() OVER(PARTITION BY hsc_id ORDER BY hsc_id desc) as RNK1 from MBM.HSC_DIAG) C
ON HSC_DIAG.Case_Number = C.HSC_ID and RNK1 =1)DSES_TRVRS_CLIN_VAR
LEFT JOIN
(
    SELECT *
    FROM (
        SELECT clin_var_val,clin_var_typ_id,dses_trvrs_id
        FROM mbm.DSES_TRVRS_CLIN_VAR
        where clin_var_typ_id IN (59,1,5,4,12,14,15,46,7,19,18,16,10,11,13,17,2,20,21,22,23,24,25,26,27,28,29,3,30,31,32,33,34,35,36,37,39,40,41,42,43,44,45,47,48,49,38,50,51,52,53,54,55,56,57,58,6,8,9)
    ) AS SRC_1
    PIVOT( MAX(clin_var_val) FOR clin_var_typ_id IN ([59],[1],[5],[4],[12],[14],[15],[46],[7],[19],[18],[16],[10],[11],[13],[17],[2],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[3],[30],[31],[32],[33],[34],[35],[36],[37],[39],[40],[41],[42],[43],[44],[45],[47],[48],[49],[38],[50],[51],[52],[53],[54],[55],[56],[57],[58],[6],[8],[9])) AS pvt1
) AS D
ON D.dses_trvrs_id = DSES_TRVRS_CLIN_VAR.DSES_TRVRS_ID)HSC_MBR_COV
LEFT JOIN
(select *, ROW_NUMBER() OVER(PARTITION BY hsc_id ORDER BY hsc_id desc) as RNK2 from MBM.HSC_MBR_COV) E
ON HSC_MBR_COV.Case_Number = E.HSC_ID and RNK2 =1)MAIN
LEFT JOIN
(SELECT case when RF_COLUMN='RF' and SJ_COLUMN='' then 'NO'
                    when RF_COLUMN='' and SJ_COLUMN='SJ' then 'NO'
                    when RF_COLUMN='RF' and SJ_COLUMN='SJ' then 'YES' ELSE 'NO' END as Ord_Same_Rndr,HSC_ID as b,PROV_SEQ_NBR,RF_COLUMN,SJ_COLUMN
FROM
(SELECT
             HSC_ID,
             PROV_SEQ_NBR,
             max(CASE WHEN prov_role_typ_id = 'RF' THEN prov_role_typ_id end ) AS 'RF_COLUMN',
             max(CASE WHEN prov_role_typ_id = 'SJ' THEN prov_role_typ_id end ) AS 'SJ_COLUMN'
FROM
mbm.HSC_PROV_ROLE group by HSC_ID,PROV_SEQ_NBR
)HSC_PROV_ROLE)HSC_PROV_ROLE_MAIN
ON HSC_PROV_ROLE_MAIN.b = MAIN.CASE_NUMBER)HSC_PROV
LEFT JOIN
(select * from MBM.HSC_PROV) F
on HSC_PROV.PROV_SEQ_NBR_1 =F.PROV_SEQ_NBR and HSC_PROV.case_number =F.HSC_ID) b group by b.case_number) PET
on PET.t4=cte.case_number) MAIN
LEFT JOIN
(select *, ROW_NUMBER() OVER(PARTITION BY hsc_id ORDER BY hsc_id desc) as RNK5 from MBM.HSC_SRVC_DECN) C_TEL
ON C_TEL.HSC_ID=MAIN.CASE_NUMBER AND RNK5=1
LEFT JOIN
(select *, ROW_NUMBER() OVER(PARTITION BY hsc_id ORDER BY hsc_id desc) as RNK6 from MBM.HSC_SRVC_NON_FACL) P_TEL
ON P_TEL.HSC_ID=MAIN.CASE_NUMBER AND RNK6=1
LEFT JOIN
(select * from MBM.ICD10) M_TEL
ON M_TEL.DIAG_CD=MAIN.Diagnosis_Cd
LEFT JOIN
(select * from MBM.TRT_RGMN_VER) D_TEL
ON D_TEL.trt_rgmn_ver_id =MAIN.req_trt_rgmn_ver_id
LEFT JOIN
(select * from MBM.MBR) Z_TEL
on Z_TEL.MBR_ID = MAIN.TEST
LEFT JOIN
(select *, ROW_NUMBER() OVER(PARTITION BY TT.MBR_ID ORDER BY TT.MBR_ID desc) as RNK8 from MBM.MBR_ADR TT where TT.adr_typ_id = '1') T_TEL
on T_TEL.MBR_ID = MAIN.TEST
LEFT JOIN
(select * from MBM.REF where  ref_nm = 'hscStatusType')REF_TEL
ON REF_TEL.ref_cd = MAIN.hsc_sts_typ_id
LEFT JOIN
(select *, ROW_NUMBER() OVER(PARTITION BY HSC_ID,PROC_CD ORDER BY HSC_ID,PROC_CD desc) as RNK9 from MBM.HSC_SRVC) W_TEL
on MAIN.case_number =W_TEL.HSC_ID and RNK9 = 1
LEFT JOIN
(select *, ROW_NUMBER() OVER(PARTITION BY proc_cd ORDER BY trpy_typ_id desc) as RNK7 from MBM.TRT_RGMN_VER_PROC) S_TEL
ON S_TEL.proc_cd =W_TEL.proc_cd and RNK7 =1
LEFT JOIN
(select * from MBM.REF where  ref_nm = 'therapyType')REF_TEL_1
ON REF_TEL_1.ref_cd = S_TEL.trpy_typ_id
LEFT JOIN
(select * from [MBM].[HCPCS]) A_TEL
ON A_TEL.proc_cd  = W_TEL.PROC_CD
LEFT JOIN
(select * from MBM.REF where  ref_nm = 'DiseaseType')REF_CS
ON REF_CS.ref_cd = MAIN.Cancer_Type
LEFT JOIN
(select * from MBM.MBR_ID where MBR_ID_TYP_ID = 1) Z_MID
on Z_MID.MBR_ID = MAIN.TEST
LEFT JOIN
(select * from MBM.REF where  ref_nm = 'lineOfBusinessType')REF_INSCARR
ON REF_INSCARR.ref_cd = MAIN.LOB
)TST
