#lang sicp

; Ex 1.30
; perform summation iteratively, rather than recursively

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (+ (term a) result))))
  (iter a 0))

(define (cube x) (* x x x))

(define (inc c) (+ c 1))