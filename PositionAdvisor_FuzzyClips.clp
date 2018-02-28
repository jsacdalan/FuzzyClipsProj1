;FuzzCLIPS Implementation for PositionAdvisor
;Jacob Sacdalan

(defrule SetThreshold
	(declare (salience 200))
	=>
	(set-threshold 0.1))

;Certainty of rules

(defrule Attack
	(declare (CF 0.5))
	(stick-skills yes)
	(dodge yes)
	=>
	(assert (position attack)))
	
(defrule Midfield
	(declare (CF 0.8))
	(or (stick-skills yes) (stamina yes))
	=>
	(assert (position midfield)))
	
(defrule Defense
	(declare (CF 0.7))
	(or (footwork yes) (communication yes))
	=>
	(assert (position defense)))
	
(defrule Goalie
	(declare (CF 0.9))
	(fearless yes)
	(communication yes)
	=>
	(assert (position goalie)))
	
;Position Facts

(defrule StickSkills
	(declare (salience 100))
	=>
	(printout t "Enter confidence in player's stick skills (0 to 1): ")
	(bind ?cf (read))
	(assert (stick-skills yes) CF ?cf))
	
(defrule Dodge
	(declare (salience 100))
	=>
	(printout t "Enter confidence in player's ability to dodge (0 to 1): ")
	(bind ?cf (read))
	(assert (dodge yes) CF ?cf))
	
(defrule Stamina
	(declare (salience 100))
	=>
	(printout t "Enter confidence in player's stamina (0 to 1): ")
	(bind ?cf (read))
	(assert (stamina yes) CF ?cf))
	
(defrule Footwork
	(declare (salience 100))
	=>
	(printout t "Enter confidence in player's ability to match opponent's footwork (0 to 1): ")
	(bind ?cf (read))
	(assert (footwork yes) CF ?cf))
	
(defrule Communication
	(declare (salience 100))
	=>
	(printout t "Enter confidence in player's ability to communicate with teammates (0 to 1): ")
	(bind ?cf (read))
	(assert (communication yes) CF ?cf))

(defrule Fear
	(declare (salience 100))
	=>
	(printout t "Enter confidence in player's ability to withstand hits from the ball (0 to 1): ")
	(bind ?cf (read))
	(assert (fearless yes) CF ?cf))
	
;The get-cf function returns confidence of fact.

(defrule ShowResults
	(declare (salience -100))
	?f <- (position ?p)
	=>
	(printout t "User should be placed at " ?p " with certainty " (get-cf ?f) crlf))

	