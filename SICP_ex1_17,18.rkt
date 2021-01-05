#lang racket

; Ex 1.17
; logarithmic, recursive approach
(define (*-fast a b)
  (cond ((= b 1) a)
        ((even? b) (double (*-fast a (halve b))))
        (else (+ a
                 (*-fast a
                         (- b 1))))))

(define (double x)
  (+ x x))

(define (halve x)
  (if (even? x)
      (/ x 2)
      -1))

; Ex 1.18
; logarithmic, iterative approach

(define (*-fast-2 a b)
  (*-fast-iter a b 0))

(define (*-fast-iter a b sum)
  (cond ((= a 1) (+ sum b))
        ((even? a) (*-fast-iter (/ a 2)
                                (* b 2)
                                sum))
        (else (*-fast-iter (/ (- a 1) 2)
                           (* b 2)
                           (+ sum b)))))

