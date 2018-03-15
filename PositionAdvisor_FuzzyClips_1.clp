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

(defrule Attack
	(declare (CF 0.5))
	(stick-skills yes)
	(dodge yes)
	(score yes)
	(experience yes)
	(check yes)
	=>							;If the user's are continuous with the position's requirements,
	(assert (position attack))) ;then assert attack as the position
	
(defrule Midfield
	(declare (CF 0.8))
	(stamina yes)
	(ond yes)
	(or (stick-skills yes) (score yes))
	(experience yes)
	(check yes)
	=>							;If the user's are continuous with the position's requirements,
	(assert (position midfield)));then assert midfield as the user's position
	
(defrule Defense
	(declare (CF 0.7))
	(or (footwork yes) (communication yes))
	(experience yes)
	(check yes)
	(long-pass yes)
	=>							;If the user's are continuous with the position's requirements,
	(assert (position defense)));then assert defense as the user's position
	
(defrule Goalie
	(declare (CF 0.9))
	(fearless yes)
	(communication yes)
	(experience yes)
	(long-pass yes)
	=>							;If the user's are continuous with the position's requirements,
	(assert (position goalie))) ;then assert goalie as the user's position
	
;Position Facts

(defrule StickSkills ;determine if stick skills are proficient
	(declare (salience 100))
	=>
	(printout t "Enter confidence in player's stick skills (0 to 1): ")
	(bind ?cf (read))
	(assert (stick-skills yes) CF ?cf))

(defrule Score ;determine if the user is able to score
	(declare (salience 100))
	=>
	(printout t "Enter confidence in player's ability to score (0 to 1): ")
	(bind ?cf (read))
	(assert (score yes) CF ?cf))
	
(defrule OffAndDef ;determine if the player can play both sides of the ball
	(declare (salience 100))
	=>
	(printout t "Enter confidence in player's ability to play offense and defense (0 to 1): ")
	(bind ?cf (read))
	(assert (ond yes) CF ?cf))	

(defrule Dodge ;determine if the player can perform a dodge well
	(declare (salience 100))
	=>
	(printout t "Enter confidence in player's ability to dodge (0 to 1): ")
	(bind ?cf (read))
	(assert (dodge yes) CF ?cf))
	
(defrule Stamina ; determine if the player has adequate stamina
	(declare (salience 100))
	=>
	(printout t "Enter confidence in player's stamina (0 to 1): ")
	(bind ?cf (read))
	(assert (stamina yes) CF ?cf))
	
(defrule Footwork ;determine if the player can stay with an opponent who is carrying the ball
	(declare (salience 100))
	=>
	(printout t "Enter confidence in player's ability to match opponent's footwork (0 to 1): ")
	(bind ?cf (read))
	(assert (footwork yes) CF ?cf))
	
(defrule Communication ;determine if the player can communicate with other teammates well
	(declare (salience 100))
	=>
	(printout t "Enter confidence in player's ability to communicate with teammates (0 to 1): ")
	(bind ?cf (read))
	(assert (communication yes) CF ?cf))

(defrule Fear ;determine if player is afraid of being pelted with the ball or not
	(declare (salience 100))
	=>
	(printout t "Enter confidence in player's ability to withstand hits from the ball (0 to 1): ")
	(bind ?cf (read))
	(assert (fearless yes) CF ?cf))

(defrule LaxExperience ;determine if the player has any experience in playing
	(declare (salience 100))
	=>
	(printout t "Enter confidence in player's lacrosse experience (0 to 1): ")
	(bind ?cf (read))
	(assert (experience yes) CF ?cf))

(defrule BigHits ;determine if the player can withstand a check or check other players
	(declare (salience 100))
	=>
	(printout t "Enter confidence in player's ability to take/deliver body checks (0 to 1): ")
	(bind ?cf (read))
	(assert (check yes) CF ?cf))
	
(defrule LongPassing ;determine if the player can perform a long pass over 20 yards away to a teammate
	(declare (salience 100))
	=>
	(printout t "Enter confidence in player's ability to make a long pass over 20 yards (0 to 1): ")
	(bind ?cf (read))
	(assert (long-pass yes) CF ?cf))
	
	
;The get-cf function returns confidence of fact.
;The highest certainty is the position the user should play.

(defrule ShowResults ;this returns the confidence in a player's position
	(declare (salience -100))
	?f <- (position ?p)
	=>
	(printout t "User should be placed at " ?p " with certainty " (get-cf ?f) crlf))

	