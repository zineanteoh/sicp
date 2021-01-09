#lang sicp

; NOTE: Very unsure of these 3 exercises.
; Resorted to finding help online

; Supporting Procedures
(define (make-interval a b) (cons a b))
(define (lower-bound x) (min (car x) (cdr x)))
(define (upper-bound x) (max (car x) (cdr x)))
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
(define (sub-interval x y)
  (let ((a1 (- (lower-bound x) (lower-bound y)))
        (a2 (- (lower-bound y) (lower-bound x)))
        (b1 (- (lower-bound x) (upper-bound y)))
        (b2 (- (upper-bound y) (lower-bound x)))
        (c1 (- (upper-bound x) (lower-bound y)))
        (c2 (- (lower-bound y) (upper-bound x)))
        (d1 (- (upper-bound x) (upper-bound y)))
        (d2 (- (upper-bound y) (upper-bound x))))
    (make-interval (min a1 a2 b1 b2 c1 c2 d1 d2)
                   (max a1 a2 b1 b2 c1 c2 d1 d2))))
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
(define (div-interval x y)
  (let ((u (upper-bound y))
        (l (lower-bound y)))
    (if (= (* u l) 0)
        (display "Error. Division by zero")
        (mul-interval x
                      (make-interval (/ 1.0 u)
                       (/ 1.0 l))))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent center percent)
  (let ((w (/ (* center percent) 100.0)))
    (make-interval (- center w)
                   (+ center w))))
(define (percent interval)
  (let ((c (center interval)))
    (* (/ (- c (lower-bound interval)) c) 100)))
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

; Ex 2.14
(define A (make-center-width 40000 0.001))
(define B (make-center-width 80000 0.002))
(center (par1 A B))
(percent (par1 A B))
(center (par2 A B))
(percent (par2 A B))
; Lem is right. percent is different, despite
; par1 and par2 both using
; algebraically equivalent formulae. 


; Ex 2.15

; Yes, she is right.
; This is because par1's formula has repeated occurances
; of R1 and R2, whereas variables in par2 only appear once.
; In a non-interval arithmetic system, this is not an issue. 
; However, the double occurances of R1 and R2 in par1 is
; problematic as the R1 in the numerator is not equivalent
; to the R1 in the denominator in the sense of non-interval
; arithmetic (this is also the case for R2). 
; This will lead to further uncertainty in par1's calculation
; (in fact, twice that of par2), or a broader error bounds.
; Thus, Eva lu Ator is right. 

; Ex 2.16

; The axioms of the regular algebraic system cannot be
; easily extrapolated to the world of intervals.
; The Distributive Law, for instance, works well in the
; non-interval world:
; a(b + c) = ab + ac
; But this law fails when a, b, and c are intervals.
; ... e.g.
(define a (make-interval 0 1))
(define b (make-interval -7 11))
(define c (make-interval 2 4))
; But when we compare the two: 
(mul-interval a (add-interval b c))
(add-interval (mul-interval a b) (mul-interval a c))

; As of now, I am unable to devise an
; interval-arithmetic package that is able to 
; address the added level of uncertainty when the 
; same intervals are represented numerous times
; through variables in the same mathematical expression. 

