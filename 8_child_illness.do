
**************************
*** Child illness ********
**************************   
	
*c_diarrhea Child with diarrhea in last 2 weeks
	g c_diarrhea=.
	g ccough=.
			  
*c_treatdiarrhea Child with diarrhea receive oral rehydration salts (ORS)
	g c_treatdiarrhea=.
		
*c_diarrhea_hmf	Child with diarrhea received recommended home-made fluids
	g c_diarrhea_hmf=.

*c_diarrhea_pro	The treatment was provided by a formal provider (all public provider except other public, pharmacy, and private sector)
	g c_diarrhea_pro =.

*c_diarrhea_mof	Child with diarrhea received more fluids
	g c_diarrhea_mof = .

*c_diarrhea_medfor Get formal medicine except (ors hmf home other_med, country specific). 
	g c_diarrhea_medfor = .

*c_diarrhea_med	Child with diarrhea received any medicine other than ORS or hmf (country specific)
	g c_diarrhea_med = .
			
*c_diarrheaact	Child with diarrhea seen by provider OR given any form of formal treatment
	g c_diarrheaact = .
				
*c_diarrheaact_q	Child under 5 with diarrhea in last 2 weeks seen by formal healthcare provider or given any form of treatment who received ORS
	g c_diarrheaact_q = .
		
*c_fever	Child with a fever in last two weeks
	gen c_fever = (h22 == 1) if !inlist(h22,.,8,9)


*c_sevdiarrhea	Child with severe diarrhea
	g c_sevdiarrhea = .
					
*c_sevdiarrheatreat	Child with severe diarrhea seen by formal healthcare provider
	g c_sevdiarrheatreat = .
		
*c_sevdiarrheatreat_q	IV (intravenous) treatment of severe diarrhea among children with any formal provider visits
	g c_sevdiarrheatreat_q = .

*c_ari	Children under 5 with cough and rapid breathing in the two weeks preceding the survey which originated from the chest.	
	g c_ari = .
		
	/* Children under 5 with cough and rapid breathing in the 
	two weeks preceding the survey which originated from the chest. */
	g c_ari2 = . 

		
*c_treatARI/c_treatARI2	   Child with acute respiratory infection (ARI) /ARI2 symptoms seen by formal provider
	gen c_treatARI =.
	gen c_treatARI2 =.

	    
	order h32a-h32x,sequential	
		
	foreach var of varlist h32a-h32x {
                 local lab: variable label `var' 
        replace `var' = . if ///   				 
		regexm("`lab'","(other|shop|pharmacy|market|kiosk|relative|friend|church|drug|addo|hilot|traditional|cs private medical|cs public sector|no treatment)") ///
                 & !regexm("`lab'","(ngo|hospital|medical center|traditional practioner$|sub health center|health center|aid post|trained vhv and other government|maternity home|diagnostic center|wome('s|n's) consultation|(pol|po)yclinic|fap|emergency services|ambulatory/family doctor office)")  
		replace `var' = . if !inlist(`var',0,1)
                 /* do not consider formal if contain words in the first group but don't contain any words in the second group */
      }
	egen pro_ari = rowtotal(h32a-h32x),mi

*c_fevertreat	Child with fever symptoms seen by formal provider	
	gen c_fevertreat = 0 if c_fever == 1
	replace c_fevertreat = 1 if c_fevertreat == 0 & pro_ari >= 1
	replace c_fevertreat = . if pro_ari == .

			
*c_illness/c_illness2	Child with any illness symptoms in last two weeks
	gen c_illness =.
	gen c_illness2 = .

		
*c_illtreat/c_illtreat2 	Child with any illness symptoms taken to formal provider
	gen c_illtreat = .
	gen c_illtreat2 = .
