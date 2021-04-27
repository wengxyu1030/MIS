
******************************
***Postnatal Care************* 
****************************** 


    *c_pnc_skill: m52 m64 m68 m72 m76 by var label text
	*c_pnc_any : mother OR child receive PNC in first six weeks by skilled health worker	
	*c_pnc_eff: mother AND child in first 24h by skilled health worker
	gen c_pnc_any = .
	gen c_pnc_eff = .

	*c_pnc_eff_q: mother AND child in first 24h by skilled health worker among those with any PNC
	gen c_pnc_eff_q =.
	
	*c_pnc_eff2: mother AND child in first 24h by skilled health worker and cord check, temperature check and breastfeeding counselling within first two days
	gen c_pnc_eff2 = . 
	
    *c_pnc_eff2_q: mother AND child in first 24h weeks by skilled health worker and cord check, temperature check and breastfeeding counselling within first two days among those with any PNC
	gen c_pnc_eff2_q = .
		
