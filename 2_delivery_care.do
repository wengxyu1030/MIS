******************************
*** Delivery Care************* 
******************************
gen DHS_phase=substr(v000, 3, 1)
destring DHS_phase, replace

gen country_year="`name'"
gen year = regexs(1) if regexm(country_year, "([0-9][0-9][0-9][0-9])[\-]*[0-9]*[ a-zA-Z]*$")
destring year, replace
gen country = regexs(1) if regexm(country_year, "([a-zA-Z]+)")


 *sba_skill (not nailed down yet, need check the result and update key words accordingly.)
	gen sba_skill =.

	*c_hospdel: child born in hospital of births in last 2 years
	gen c_hospdel =.
 
	*c_facdel: child born in formal health facility of births in last 2 years
	gen c_facdel = .
	
	*c_earlybreast: child breastfed within 1 hours of birth of births in last 2 years
	g c_earlybreast = .

    *c_skin2skin: child placed on mother's bare skin immediately after birth of births in last 2 years
	gen c_skin2skin = .
	
	*c_sba: Skilled birth attendance of births in last 2 years: go to report to verify how "skilled is defined"
	gen c_sba = . 

	*c_sba_q: child placed on mother's bare skin and breastfeeding initiated immediately after birth among children with sba of births in last 2 years
	gen c_sba_q = .
	
	*c_caesarean: Last birth in last 2 years delivered through caesarean                    
	 g c_caesarean = .
	
    *c_sba_eff1: Effective delivery care (baby delivered in facility, by skilled provider, mother and child stay in facility for min. 24h, breastfeeding initiated in first 1h after birth)
	//g c_sba_eff1 = . 
	gen stay = .
	
	gen c_sba_eff1 = .  
		
	*c_sba_eff1_q: Effective delivery care (baby delivered in facility, by skilled provider, mother and child stay in facility for min. 24h, breastfeeding initiated in first 1h after birth) among those with any SBA
	gen c_sba_eff1_q = .
		
	*c_sba_eff2: Effective delivery care (baby delivered in facility, by skilled provider, mother and child stay in facility for min. 24h, breastfeeding initiated in first 1h after birth, skin2skin contact)
	gen c_sba_eff2 = .
	 
	*c_sba_eff2_q: Effective delivery care (baby delivered in facility, by skilled provider, mother and child stay in facility for min. 24h, breastfeeding initiated in first 1h after birth, skin2skin contact) among those with any SBA
	
	gen c_sba_eff2_q =  .


	
