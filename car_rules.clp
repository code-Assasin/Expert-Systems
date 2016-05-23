;;*********************************************************************
;; Title : Rule set for Car Malfunctions
;; Date: 20-05-2016
;; Description : Rule set for the knowledge base car_facts.clp
;;**********************************************************************


(defrule r1
(Fuelmeter present)
=>
(assert(reservoir_stat notempty))
)

(defrule r2
(Fuelmeter notpresent)
=>
(assert(reservoir_stat empty))
)

(defrule r3
(batteryyears ?a)
=>
(if (<= ?a 2) then
(assert(batteryage new))
)
(if (and (> ?a 2) (< ?a 4)) then
(assert(batteryage medium))
)
(if (>= ?a 4) then
(assert(batteryage old))
)
)

(defrule r4
(batteryvoltage ?v)
=>
(if (>= ?v 8) then
(assert(batterystatus okay))
)
(if (< ?v 8) then
(assert(batterystatus weak))
)
)

(defrule r5
(environmenttemp ?t)
(batterystatus ?s)
=>
(if (and (<= ?t -7) (= (str-compare ?s "okay") 0)) then
(printout t "done" crlf)
(assert(problem batterytoocold))
)
)

(defrule r6
(and (and (motorturns slowly|no) (lights weak)) (batteryvoltage unknown))
=>
(assert(batterystatus weak))
)

(defrule r7
(and (and (motorturns no) (lights notpresent)) (batteryvoltage unknown))
=>
(assert(batterystatus weak))
)

(defrule r8
(and (and (and (motorturns slowly|no) (lights weak)) (batteryvoltage unknown)) (batteryage new|medium))
=>
(assert(batterystatus weak))
)

(defrule r9
(and (and (motorturns yes) (batterystatus OK)) (fuelsmell yes))
=>
(assert(carburetorstatus leaks))
)

(defrule r10
(and (motorturns no) (startsound knocking))
=>
(assert(startplugstatus malfunctioning))
)

(defrule r11
(and (and (motorturns no) (startsound notpresent)) (batterystatus OK))
=>
(assert(startplugstatus malfunctioning))
)

(defrule r12
(startsound squeaking)
=>
(assert(starterstatus faulty))
)

(defrule r13
(reservoirstatus empty)
=>
(assert(problem reservoir_empty))
)

(defrule r14
(batterystatus weak)
=>
(assert(problem batteryweak))
)

(defrule r15
(carburetorstatus leaks)
=>
(assert(problem carburetor_leaks))
)

(defrule r16
(startplugstatus malfunctioning)
=>
(assert(problem startplug_malfunctioning))
)

(defrule r17
(starterstatus faulty)
=>
(assert(problem starter_faulty))
)







