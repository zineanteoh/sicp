#lang sicp

; Supporting procedures
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

; Ex 2.7
(define (make-interval a b) (cons a b))
(define (lower-bound x) (min (car x) (cdr x)))
(define (upper-bound x) (max (car x) (cdr x)))

; Ex 2.8
(define (sub-interval x y)
  (let ((a1 (- (lower-bound x) (lower-bound y)))
        (a2 (- (lower-bound y) (lower-bound x)))
        (b1 (- (lower-bound x) (upper-bound y)))
        (b2 (- (upper-bound y) (lower-bound x)))
        (c1 (- (upper-bound x) (lower-bound y)))
        (c2 (- (lower-bound y) (upper-bound x)))
        (d1 (- (upper-bound x) (upper-bound y)))
        (d2 (- (upper-bound y) (upper-bound x))))
    (make-interval (min a1 a2 b1 b2 c1 c2 d1 d2)
                   (max a1 a2 b1 b2 c1 c2 d1 d2))))
