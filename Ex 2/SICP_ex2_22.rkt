#lang sicp

; Ex 2.22

#|
Louis Reasoner #1
-----------------
This is because the statement
(cons (square (car things))
      answer)
always puts the next squared item at the beginning of answer


Louis Reasoner #2
-----------------
At the first iteration, there is already an error.
(cons answer
      (square (car things)))
... attempts to do (cons nil *sth*)
A list cannot start with nil, hence this procedure
... will not produce a proper list as the answer
|#

