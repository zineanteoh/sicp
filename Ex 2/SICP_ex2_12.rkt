#lang sicp

; Supporting Procedures
(define (make-interval a b) (cons a b))
(define (lower-bound x) (min (car x) (cdr x)))
(define (upper-bound x) (max (car x) (cdr x)))
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))


; Ex 2.12
(define (make-center-percent center percent)
  (let ((w (/ (* center percent) 100.0)))
    (make-interval (- center w)
                   (+ center w))))
(define (percent interval)
  (let ((c (center interval)))
    (* (/ (- c (lower-bound interval)) c) 100)))

