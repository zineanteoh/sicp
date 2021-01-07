#lang sicp

(define (make-interval a b) (cons a b))
(define (lower-bound x) (min (car x) (cdr x)))
(define (upper-bound x) (max (car x) (cdr x)))
; Ex 2.9
(define (width interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2))

#|
Suppose x and y are any two intervals,
... where x = (Lx, Ux) and y = (Ly, Uy)
We have (width x) = (/ (- Ux Lx) 2)
... and (width y) = (/ (- Uy Ly) 2)
And (add-interval x y)
... = (make-interval (+ Lx Ly)
                     (+ Ux Uy))
Show that (width (add-interval x y)) = (width x) + (width y)
... LHS: (width (add-interval x y))
... ...  = (width (make-interval (+ Lx Ly) (+ Ux Uy)))
... ...  = (/ (- (+ Ux Uy) (+ Lx Ly)) 2)

... RHS: (width x) + (width y)
... ...  = (+ (/ (- Ux Lx) 2) (/ (- Uy Ly) 2))
... ...  = (/ (- (+ Ux Uy) (+ Lx Ly)) 2)
LHS = width of the sum of two intervals
RHS = widths of the intervals being added
LHS = RHS, Q.E.D
Width of the sum of two interval is a function of the width of intervals being added
because both are equivalent. 
|#


#| A counter example for how the statement is not true for multiplication:
I resorted to looking for help with the last proof: 
Turns out that, if LHS is a function of RHS, then the width of two intervals
... (of width a and b, respectively) multiplied together should be
... equal to the width of two different intervals (with width a and b as well)
... mutiplied together. 
However, this is not true. Consider: 

[0, 10] x [0, 2] = [0, 20]
result: width = 10

[-5, 5] x [-1, 1] = [-5, 5]
result: width = 5

Both starting intervals have the same respective widths (5 and 1),
... but the product produces different widths.
... Thus, the statement is not true for multiplicaion. 
|#

