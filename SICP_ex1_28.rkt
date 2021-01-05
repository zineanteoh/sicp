#lang sicp

; Ex 1.28

; The Miller-Rabin Test
; ... aka the 'unfool-able Fermat's Test'

; test all integer a from 1 to n-1
(define (miller-rabin-test-all n)
  (define (try-it a)
    (cond ((= a n) true)
          ((= (mrt-expmod a (- n 1) n) 1) (try-it (+ a 1)))
          (else false)))
  (try-it 1))

; test random integers a
(define (miller-rabin-test n)
  (define (try-it a)
    (= (mrt-expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

; if found a non-trivial-sqrt, return 0, else return x
(define (zero-if-non-trivial-sqrt x n)
  (if (non-trivial-sqrt? x n) 0 x))

(define (non-trivial-sqrt? x n)
  (and (not (= x 1))
       (not (= x (- n 1)))
       (= (remainder (square x) n) 1)))

(define (mrt-expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square
           (zero-if-non-trivial-sqrt
            (mrt-expmod base (/ exp 2) m) m))
          m))
        (else
         (remainder
          (* base (mrt-expmod base (- exp 1) m))
          m))))

(define (square x)
  (* x x))