#lang racket

; pascal displays the element at row r, col c
(define (pascal r c)
  (cond ((or (> c r) (< c 0) (< r 0)) 0)
        ((= r 0) 1)
        ((or (= c 0) (= c r)) 1)
        (else (+ (pascal (- r 1) (- c 1))
                 (pascal (- r 1) c)))))

; pascal-row displays the entire row r
(define (pascal-row r)
  (define (pascal-row-iter i)
    (display (pascal r i))
    (display "   ")
    (if (= i r)
        (display "\n")
        (pascal-row-iter (+ i 1))))
  (pascal-row-iter 0))

; pascal-triangle displays the entire triangle up to row n
(define (pascal-triangle n)
  (define (pascal-triangle-iter i)
    (pascal-row i)
    (if (= i n)
        (display "")
        (pascal-triangle-iter (+ i 1))))
  (pascal-triangle-iter 0))
