#lang racket

;SICP Exercise 1

;Ex 1.1
#|
10
12
8
3
6
19
#f
4
16
6
16
|#

;Ex 1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
     (* 3 (- 6 2) (- 2 7)))

;Ex 1.3
(define (square x) (* x x))
(define (sum-of-squares a b)
    (+ (square a) (square b)))
(define (f a b c)
    (cond ((and (<= a b) (<= a c)) (sum-of-squares b c))
          ((and (<= b c) (<= b a)) (sum-of-squares a c))
          (else (sum-of-squares a b))))

;Ex 1.4
#|
The procedure a-plus-abs-b takes in two arguments, namely a and b
It checks if b is greater than 0. If it is, returns a + b
Else, returns a - b
Mathematically, this is equivalent to a + |b|
|#

;Ex 1.5
#|
1. Applicative-Order Evaluation will evaluate arguments first, then procedures
(test 0 (p))
(test 0 p)
Error. Evaluation of (p) will be an endless recursion

2. Normal-Order Evaluation will evaluate procedures first
(test 0 (p))
(if (= 0 0) 0 (p))
0
Here (p) is ignored due to the evaluation rule of 'if'
|#


