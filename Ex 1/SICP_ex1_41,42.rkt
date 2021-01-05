#lang sicp

; Ex 1.41
(define (double g)
  (lambda (x) (g (g x))))
; (((double (double double)) inc) 5) returns 21

; Ex 1.42
(define (compose f g)
  (lambda (x) (f (g x))))







; Basic procedures

(define (square x) (* x x))
(define (inc x) (+ x 1))