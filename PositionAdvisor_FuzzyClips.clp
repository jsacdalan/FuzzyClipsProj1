;FuzzCLIPS Implementation for PositionAdvisor
;Jacob Sacdalan

(defrule welcome
	(declare (salience 150))
	=>
	(printout t "Welcome, this expert system will help advise you on which position to play in Lacrosse." crlf crlf))

(defrule SetThreshold
	(declare (salience 200))
	=>
	(set-threshold 0.1))

;Certainty of rules

(defrule Attack1
	(declare (CF 0.9))
	(check yes)
	(stick-skills yes)
	(dodge yes)
	(long-pass yes)
	(score yes)
	=>
	(assert (position attack)))
	
(defrule Midfield1
	(declare (CF 0.9))
	(check yes)
	(long-pass yes)
	(stamina yes)
	(ond yes)
	(or (stick-skills yes) (score yes))
	=>
	(assert (position midfield)))
	
(defrule Defense1
	(declare (CF 0.9))
	(check yes)
	(long-pass yes)
	(score yes)
	(footwork yes) 
	(communication yes)
	=>
	(assert (position defense)))
	
(defrule Goalie1
	(declare (CF 0.9))
	(check yes)
	(reaction yes)
	(long-pass yes)
	(fearless yes)
	(communication yes)
	=>
	(assert (position goalie)))
	
;Position Facts
	
(defrule BigHits
	(declare (salience 100))
	=>
	(printout t "Enter confidence in player's ability to take/deliver body checks (0 to 1): ")
	(bind ?cf (read))
	(assert (check yes) CF ?cf))

(defrule LongPassing
	(declare (salience 100))
	=>
	(printout t "Enter confidence in player's ability to make a long pass over 20 yards (0 to 1): ")
	(bind ?cf (read))
	(assert (long-pass yes) CF ?cf))
	
(defrule Reactions
	(declare (salience 100))
	=>
	(printout t "Enter confidence in player's ability to react quickly to a shot (0 to 1): ")
	(bind ?cf (read))
	(assert (reaction yes) CF ?cf))
	
(defrule StickSkills
	(declare (salience 100))
	=>
	(printout t "Enter confidence in player's stick skills (0 to 1): ")
	(bind ?cf (read))
	(assert (stick-skills yes) CF ?cf))

(defrule Score
	(declare (salience 100))
	=>
	(printout t "Enter confidence in player's ability to score (0 to 1): ")
	(bind ?cf (read))
	(assert (score yes) CF ?cf))
	
(defrule OffAndDef
	(declare (salience 100))
	=>
	(printout t "Enter confidence in player's ability to play offense and defense (0 to 1): ")
	(bind ?cf (read))
	(assert (ond yes) CF ?cf))	

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

(defrule End
	(declare (salience 75))
	=>
	(printout t "Here are the results: "))

(defrule ShowResults
	(declare (salience 150))
	?f <- (position ?p)
	=>
	(printout t "User should be placed at " ?p " with certainty " (get-cf ?f) crlf))
	
;(defrule DeclarePos
;	(declare(salience

	