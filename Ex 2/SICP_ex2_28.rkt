#lang sicp

; Ex 2.28

(define (fringe tree)
  (if (pair? tree)
      (append (fringe (car tree)) (fringe (cdr tree)))
      (if (not (null? tree))
          (list tree)
          tree)))

#|
To get the fringe of any branch,
simply append its left branch to its right branch
(as long as the branches are pairs)

If the branches are not pairs, we have reached the leaves.
Thus, we simply return (list tree) if it is not nil
or (list) if it is nil.

^ Note: if we return (list tree) w/o checking if tree is nil,
        we may get (list nil) = (()) instead of (). Thus,
        (null? tree) is essential. 

|#