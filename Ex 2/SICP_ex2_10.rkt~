#lang sicp

; Supporting procedures
(define (make-interval a b) (cons a b))
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

; Ex 2.10

(define (div-interval x y)
  (let ((u (upper-bound y))
        (l (lower-bound y)))
    (if (= (* u l) 0)
        (display "Error. Division by zero")
        (make-interval (/ 1.0 u)
                       (/ 1.0 l)))))
