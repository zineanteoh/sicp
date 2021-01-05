#lang racket

;Newton's Square root method
(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

#|
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))
|#

(define (improve guess x)
  (average guess (/ x guess)))

#|
Mediocre implementations of the procedure good-enough? 
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (good-enough? guess x)
  (< (/ (abs (- (improve guess x) guess)) guess) 0.00001))
|#

(define (good-enough? guess x)
  (= (improve guess x) guess))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(sqrt 9)