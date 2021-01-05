#lang sicp

; Ex 1.37-39

; recursive process
(define (cont-frac n d k)
  (define (cont total count)
    (if (= count k)
        (/ total (d k))
        (/ total (+ (d count) (cont (n (+ 1 count)) (+ 1 count))))))
  (cont (n 1) 1))

; iterative process
(define (cont-frac-iter n d k)
  (define (cont-iter term count)
    (if (= count 0)
        term
        (cont-iter (/ (n count)
                      (+ (d count) term))
                   (- count 1))))
  (cont-iter 0 k))


; Ex 1.38
#|
N(i) all 1
D(i) = 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, 1, 1, 10, 1, 1, ...
y=3x-1   (2)      (5)      (8)      (11)     (14)
   1. check if (i + 1) % 3 == 0
       YES : return (i + 1) / 3 * 2
       NO : return 1
|#

(define (approx-e k)
  (define (D-i i)
    (if (= (remainder (+ i 1) 3) 0)
        (* 2 (/ (+ i 1) 3))
        1))
  (cont-frac (lambda (i) 1.0)
             D-i
             k))

; Ex 1.39
; count: 1, 3, 5, 7,... -> y = 2x - 1
(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1)
                             x
                             (- (* x x))))
             (lambda (i) (- (* 2 i) 1))
             k))

