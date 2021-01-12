#lang sicp

; Ex 2.23

; Using (begin (...) (...))
(define (for-each proc items)
  (if (null? items)
      (newline)
      (begin (proc (car items))
             (for-each proc (cdr items)))))

; Without using (begin ...)
(define (for-each-2 proc items)
  (define (call proc items)
    (proc (car items))
    (for-each-2 proc (cdr items)))
  (if (null? items)
      (newline)
      (call proc items)))
