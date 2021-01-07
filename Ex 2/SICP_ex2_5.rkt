#lang sicp

; Ex 2.5

(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (car z)
  (reduce 0 z 2))

(define (cdr z)
  (reduce 0 z 3))

(define (reduce c z b)
  (if (= (remainder z b) 0)
      (reduce (+ c 1) (/ z b) b)
      c))

(define (logb b x)
  (/ (log x)
     (log b)))

#| A rather brute forced abstraction approach
(define (reduce n base-to-eliminate)
  (if (= (remainder n base-to-eliminate) 0)
      (reduce (/ n base-to-eliminate) base-to-eliminate)
      (round (logb (/ 6 base-to-eliminate) n))))
|#
