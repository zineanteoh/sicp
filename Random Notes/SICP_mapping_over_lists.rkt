#lang sicp

; SICP pg 143 - Mapping over lists
; Progression of 'map' --
; ... where procedures become more abstract 

; 1. Scale all items in a list by a factor
(define (scale-list items factor)
  (if (null? items)
      nil
      (cons (* (car items) factor)
            (scale-list (cdr items)
                        factor))))

; 2. Apply a procedure 'proc' to all items in a list
(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

; 3. Refine scale-list procedure by using map
(define (scale-list-2 items factor)
  (map (lambda (x) (* x factor))
       items))
