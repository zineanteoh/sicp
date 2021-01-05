#lang racket

; Ex 1.16
; fast, linear iterative approach
(define (expt-fast-2 b n)
  (expt-fast-iter n b 1))

(define (expt-fast-iter n b a)
  (cond ((= n 0) a)
        ((= n 1) (* a b))
        ((even? n) (expt-fast-iter (/ n 2)
                                   (* b b)
                                   a))
        (else (expt-fast-iter (- n 1)
                              b
                              (* a b)))))

; linear recursive approach
(define (expt-rec b n)
  (if (= n 0)
      1
      (* b (expt-rec b (- n 1)))))

; linear iterative approach
(define (expt b n)
  (expt-iter b n 1))

(define (expt-iter b count product)
  (if (= count 0)
      product
      (expt-iter b (- count 1) (* b product))))

; fast, logarithmic recursive approach
(define (square x)
  (* x x))
(define (expt-fast-1 b n)
  (cond ((= n 0) 1)
        ((even? n) (square (expt-fast-1 b (/ n 2))))
        (else (* b (expt-fast-1 b (- n 1))))))
