;*****************************
;Title : Candidate selection based on age,income,education..etc
;Description : Clips rules for candidate selection and score calculation using global variables and average.
;Date : 23-05-2016
;Author : Harshitha .M
;*****************************


(deftemplate cand
(slot age
(type NUMBER)) ;pls declare this otherwise..problem in reading the input..
(slot income
(type NUMBER))
)

(deffacts default_facts
(task user_prompt)
)

(defglobal 
?*score* = 0
?*age_score* = 1
?*income_score* = 1
?*edu_score* = 1
)

(defrule ui
?f<-(task user_prompt)
=>
(printout t " Choose the parameters: " crlf
			" 1.Age " crlf
			" 2.income " crlf
			" 3.Education" crlf
			" 4.Quit or give result " crlf)
(assert(option (read)))
(assert(task check-opt))
(retract ?f)
)

(defrule end_program
(option 4)
=>
(bind ?*score* (/ (+ ?*age_score* ?*income_score* ?*edu_score*) 3) )
(printout t "The score is.. " ?*score* crlf)
(printout t "Quiting " crlf)
(halt)
)

(defrule option-check
?f1<-(option ?num)
?f2<-(task check-opt)
=>
(if (or (not(integerp ?num)) (> ?num 4) (< ?num 1))then
(printout t "Invalid option.." crlf)
(retract ?f1)
(retract ?f2)
(assert(task user_prompt))
)
)

(defrule age_rule
?f3<-(option 1)
=>
(retract ?f3)
(printout t "enter your age.." crlf)
(assert(cand(age (read))))
)

(defrule age_score_rule
(cand(age ?a))
=>
(if (and (> ?a 20) (< ?a 40)) then
(bind ?*age_score* 90)
)

(if (and (> ?a 40) (< ?a 60)) then
(bind ?*age_score* 70)
)

(if (> ?a 60) then
(bind ?*age_score* 50)
)
(assert(task user_prompt))
)

(defrule income_rule
?f4<-(option 2)
=>
(retract ?f4)
(printout t "enter your income.." crlf)
(bind ?x (read))

(if (<= ?x 50000) then
(bind ?*income_score* 25)
)
(if (> ?x 50000) then
(bind ?*income_score* 75)
)

(assert(cand(income ?x)))
(assert(task user_prompt))

)

(defrule edu_rule
?f5<-(option 3)
=>
(retract ?f5)
(printout t "enter :the highest degree of education attained " crlf
		   "1. less than high school" crlf
		   "2. High school" crlf
		   "3. Graduation " crlf
		   "4. Masters" crlf  
		   "5. Post doc" crlf 
		   "6. more than that .." crlf )
(bind ?input (read))

(bind ?*edu_score* (* ?input 10))

)

























