#lang sicp

; Ex 1.46

(define (iterative-improve good-enough improve)
  (lambda (guess) (if (good-enough guess)
                      guess
                      ((iterative-improve good-enough improve) (improve guess)))))

; sqrt procedure redefined
(define (sqrt x)
  (define (good-enough guess)
    (< (abs (- (square guess) x))
       tolerance))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough improve) 1.0))

; fixed-point procedure redefined
(define (fixed-point f first-guess)
  (define (good-enough guess)
    (< (abs (- guess (f guess)))
       tolerance))
  (define (improve guess)
    (f guess))
  ((iterative-improve good-enough improve) first-guess))

; Supporting procedures
(define tolerance 0.000001)
(define (square x) (* x x))
(define (average a b)
  (/ (+ a b) 2.0))
