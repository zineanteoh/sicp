#lang sicp

; Ex 1.43
(define (repeated f n)
  (define (repeat func counter)
    (if (= counter 1)
        func
        (repeat (compose f func) (- counter 1))))
  (repeat f n))

; Ex 1.44
(define dx 0.00001)
(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx))
                    (f x)
                    (f (+ x dx)))
                 3)))
(define (n-fold-smoothed f n)
  ((repeated smooth n) f))

; Ex 1.45
(define (nth-root n x)
  (fixed-point ((repeated average-damp (floor (/ (log n) (log 2)))) (lambda (y) (/ x (expt y (- n 1)))))
               1.0))
#|
After some experimentation........ 
(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))
(define (cube x)
  (fixed-point (average-damp (lambda (y) (/ x y y))) 1.0))
(define (fourth x)
  (fixed-point ((repeated average-damp 2) (lambda (y) (/ x y y y))) 1.0))
(define (fifth x)
  (fixed-point ((repeated average-damp 2) (lambda (y) (/ x y y y y))) 1.0))
(define (sixth x)
  (fixed-point ((repeated average-damp 2) (lambda (y) (/ x y y y y y))) 1.0))
(define (seventh x)
  (fixed-point ((repeated average-damp 2) (lambda (y) (/ x y y y y y y))) 1.0))
(define (eigth x)
  (fixed-point ((repeated average-damp 3) (lambda (y) (/ x y y y y y y y))) 1.0))

My guess is that the # of average-damp required for n-th root is
= floor(log base 2 (n))
or
(floor (/ (log n) (log 2)))
|#


; Supporting procedures

(define (square x) (* x x))
(define (average a b)
  (/ (+ a b) 2))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))