#lang sicp

; 'product' procedure that is analogous to 'sum', recursively
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))
(define (frac-term x)
  (/ (+ x 1.0) x))
(display "(product frac-term 2 inc 8): \n")
(product frac-term 2 inc 8) ; (3/2)x(4/3)x(5/4)x...x(9/8) = 4.5

; 'product-iterative' procedure generates an iterative process
(define (product-iterative term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (* (term a)
                 result))))
  (iter a 1.0))

; 'factorial' procedure that relies on 'product'
(define (factorial n)
  (define (f-next term)
    (+ term 1))
  (define (identity x) x)
  (product identity 1 f-next n))
(display "(factorial 19): \n")
(factorial 19) ; 121645100408832000

; 'approx-pi' using 'product'
(define (approx-pi)
  (define (pi-term a)
    (/ (* (+ a 1) (+ a 1))
       (* a (+ a 2))))
  (define (pi-next a)
    (+ a 2))
  (define num-of-terms 100000) ; the higher the better the approximation
  (/ (product pi-term 1.0 pi-next num-of-terms) 2.0))
(display "(* 4 (approx-pi)): \n")
(* 4 (approx-pi))

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