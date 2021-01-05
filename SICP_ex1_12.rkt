#lang racket

; row and column start from 0
; (pascal 0 0) gives 1
; (pascal 4 2) gives 6...

(define (pascal r c)
  (cond ((or (> c r) (< c 0)) 0)
        ((= r 0) 1)
        ((or (= c 0) (= c (- r 1))) 1)
        (else (+ (pascal (- r 1) (- c 1))
                 (pascal (- r 1) c)))))

(define (display-pascal-layer layer)
  (define (col-iter i)
    (display (pascal layer i))
    (display "   ")
    (if (= i (- layer 1))
        (display "\n")
        (col-iter (+ i 1))))
  (col-iter 0))

(define (display-pascal n)
  (define (display-iter layer)
    (display-pascal-layer layer)
    (if (= layer (+ n 1))
        (display "")
        (display-iter (+ layer 1))))
  (display-iter 1))