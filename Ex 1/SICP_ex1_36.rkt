#lang sicp

; Ex 1.36

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (good-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess count)
    (display count)
    (display " : ")
    (display guess)
    (newline)
    (let ((next (f guess)))
     (if (good-enough? guess next)
         next
         (try next (+ count 1)))))
  (try first-guess 0))
(define (average a b)
  (/ (+ a b)
     2))

#|
(fixed-point (lambda (x) (+ 1 (/ 1 x)))
             1.0)

w/o average damping: 
x^x = 1000
x = log base x (1000)
x = log10(1000) / log10(x)

w/ average damping:
(average x
         (log 1000 / log x))
|#

; w/o average damping: 
(fixed-point (lambda (x) (/ (log 1000)
                            (log x)))
             1.01)
; w/ average damping: 
(fixed-point (lambda (x) (average x (/ (log 1000)
                                       (log x))))
             1.01)
