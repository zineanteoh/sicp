#lang sicp

; Ex 1.27

#|
procedures required:
(fast-prime n times)
(fermat-test n)
(expmod base exp m)
|#

; fast-prime that uses fermat's method
; for a prime number n,
; and any number a < n,
; -> a^n is congruent to a mod n
(define (fast-prime n)
  (define (iter counter)
    (cond ((= counter 1) true)
          ((not (fermat-test counter n)) false)
          (else (iter (- counter 1)))))
  (iter (- n 1)))

(define (fermat-test counter n)
  (= (expmod counter n n) counter))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (square x)
  (* x x))