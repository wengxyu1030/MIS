
******************************
*** Child mortality***********
******************************   

*mor_dob				Child date of birth (cmc)
    gen mor_dob = b3
	
*mor_wln				Woman line number in HH to match child with mother (original)
    gen mor_wln = v003
	
*mor_ali				Child still alive (1/0)
   	ge mnths_born_bef_int = v008 - b3 /* months born before interview  */ 
	clonevar mor_ali =  b5

*mor_ade				Child age at death in months
*mor_afl				Child age at death imputation flag

    if inlist(name,"Ghana2016","Ghana2019","Mozambique2018","Tanzania2017","Senegal2020"){
		gen mor_ade = .
		gen mor_afl = .
	}
	if ~inlist(name,"Ghana2016","Ghana2019","Mozambique2018","Tanzania2017","Senegal2020"){
		ge mor_ade = b7
	    replace mor_ade = . if b13~=0
	    ge age_alive_mnths = mnths_born_bef_int 
	    ge time = mor_ade
	    replace time = age_alive_mnths if mor_ali==0
	    replace time = 0 if time<0

		gen mor_afl = b13

	}


