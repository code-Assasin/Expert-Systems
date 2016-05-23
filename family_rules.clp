;;*********************************************************************
;; Title : Rule set for family relations
;; Date: 20-05-2016
;; Description : Rule set for the knowledge base family_facts.clp
;;**********************************************************************


;;********************FIRING RULES**************************************

(defrule for_siblings
;(declare(salience 1000))
(initial-fact)
=>
(printout t " Do you want the list of siblings..?(yes or no) " crlf)
(assert(fire_sib (read)))
)

(defrule for_aunt
;(declare(salience 0))
(initial-fact)
=>
(printout t " Do you want the list of Aunts..?(yes or no) " crlf)
(assert(fire_aunt (read)))
)

(defrule for_uncles
;(declare(salience 0))
(initial-fact)
=>
(printout t " Do you want the list of uncles..?(yes or no) " crlf)
(assert(fire_uncle (read)))
)

(defrule for_sisters
;(declare(salience 500))
(initial-fact)
=>
(printout t " Do you want the list of sisters..?(yes or no) " crlf)
(assert(fire_sis (read)))
)

(defrule for_bros
;(declare(salience 250))
(initial-fact)
=>
(printout t " Do you want the list of brothers..?(yes or no) " crlf)
(assert(fire_bro (read)))
)

(defrule for_gp
(initial-fact)
=>
(printout t " Do you want the list of grandparents..?(yes or no) " crlf)
(assert(fire_gp_rule (read)))
)

;***********************************DISPLAYING FACTS*******************************************

(defrule disp_sib
(fire_sib yes)
(sibling ?s1 ?s2)
=>
(printout t ?s1 " and " ?s2 " are siblings " crlf)
)

(defrule disp_sis
(fire_sis yes)
(sister_of ?b ?s)
=>
(printout t ?s " is the sister of " ?b crlf)
)

(defrule disp_bro
(fire_bro yes)
(brother_of ?s ?b)
=>
(printout t ?b " is the brother of " ?s crlf)
)

(defrule disp_aunt
(fire_aunt yes)
(aunt_of ?c ?a)
=>
(printout t " Aunt of " ?c " is " ?a crlf)
)

(defrule disp_uncle
(fire_uncle yes)
(uncle_of ?c ?u)
=>
(printout t " Uncle of " ?c " is " ?u crlf)
)
(defrule disp_gp
(fire_gp_rule yes)
(grandparent_of ?c ?gp)
=>
(printout t " grandparent of " ?c " is " ?gp crlf)
)

;**********************************RULES FOR FAMILY RELATIONS DECLARATION************************

(defrule sibling 
(declare(salience 10000))
(parents_of ?c1 ?p)
(parents_of ?c2 ?p)
=>
(if (neq ?c1 ?c2) then
(assert(sibling ?c1 ?c2))
)
)

(defrule sister_of
(declare(salience 10000))
(sibling ?b ?s)
(female ?s)
=>
(if (neq ?b ?s) then
(assert(sister_of ?b ?s))
)
)

(defrule brother_of
(declare(salience 10000))
(sibling ?s ?b)
(male ?b)
=>
(if (neq ?b ?s) then
(assert(brother_of ?s ?b))
)
)

(defrule aunt_of
(declare(salience 5000))
(parents_of ?c ?p)
(sister_of ?p ?a)
=>
(assert(aunt_of ?c ?a))
)

(defrule uncle_of
(declare(salience 5000))
(parents_of ?c ?p)
(brother_of ?p ?u)
=>
(assert(uncle_of ?c ?u))
)

(defrule grandparent_of
(declare(salience 5000))
(parents_of ?c ?p)
(parents_of ?p ?gp)
=>
(assert(grandparent_of ?c ?gp))
)
