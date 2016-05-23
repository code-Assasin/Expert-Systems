;;*********************************************************************
;; Title : predefined facts for family relations
;; Date: 20-05-2016
;; Description : predefined facts for family_rules.clp
;;**********************************************************************

(deffacts gender
(female catherine)
(female elizabeth)
(female sophia)
(male james_I)
(male charles_I)
(male charles_II)
(male james_II)
(male george_I)
)
(deffacts parents
(parents_of charles_I james_I)
(parents_of catherine charles_I)
(parents_of charles_II charles_I)
(parents_of james_II charles_I)
(parents_of elizabeth james_I)
(parents_of sophia elizabeth)
(parents_of george_I sophia)
)




