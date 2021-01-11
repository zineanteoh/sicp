#lang sicp

; Supporting Procedures
(define (count-change amount) (cc amount 5))
(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else (+ (cc amount
                     (except-first-denomination
                      coin-values))
                 (cc (- amount
                        (first-denomination
                         coin-values))
                     coin-values)))))

; Ex 2.19

(define (first-denomination coin-values)
  (car coin-values))
(define (except-first-denomination coin-values)
  (cdr coin-values))
(define (no-more? coin-values)
  (null? coin-values))

#|
No:
(cc 100 (list 1 50 25 10 5))
is equivalent to
(cc 100 (list 1 5 10 25 50))

This is because every combination of coins is
taken into consideration, regardless of the order
of denominations of the coin-values. 

|#

