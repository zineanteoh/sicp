#lang sicp

; Ex 1.32 & 33


; Ex 1.33
; 'filtered-accumulate' that is an even more general version of 'accumulate'
(define (filtered-accumulate filter combiner null-value term a next b)
  (if (filter a b)
      null-value
      (combiner (term a)
                (filtered-accumulate filter combiner null-value term (next a) next b))))


; checks if a number is prime
(define (prime? n)
  (= n (smallest-divisor n)))
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next-divisor test-divisor)))))
(define (next-divisor n)
  (if (even? n)
      (+ n 1)
      (+ n 2)))
(define (square x)
  (* x x))
(define (divides? a b) (= (remainder b a) 0))


; Ex 1.32 
; 'accumulate' procedure that is an abstraction of anything
; ... that accumulates, such as 'sum' or 'product' 
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

; iterative process for 'accumulate'
(define (accumulate-iterative combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (combiner (term a)
                        result))))
  (iter a null-value))

; 'product' procedure that is based on 'accumulate' 
(define (product term a next b)
  (accumulate-iterative * 1.0 term a next b))
(define (cube x) (* x x x))
(define (inc x) (+ x 1))

; 'sum' procedure that is based on 'accumulate'
(define (sum term a next b)
  (accumulate-iterative + 0 term a next b))

#|
; 'product' procedure that is analogous to 'sum', recursively
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

; 'product-iterative' procedure generates an iterative process
(define (product-iterative term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (* (term a)
                 result))))
  (iter a 1.0))
|# 
#|
; 'sum' procedure for reference:

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
(define (cube x) (* x x x))
(define (inc x) (+ x 1))
(display "(sum cube 0 inc 3): \n")
(sum cube 0 inc 3) ; 36
|#