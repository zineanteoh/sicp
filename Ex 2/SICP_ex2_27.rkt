#lang sicp

; Ex 2.27

(define (reverse items)
  (define (iter items ans)
    (if (null? items)
        ans
        (iter (cdr items) (cons (car items)
                                ans))))
  (iter items (list)))

(define (deep-reverse items)
  (define (iter items ans)
    (if (null? items)
        ans
        (iter (cdr items) (cons (if (pair? (car items))
                                    (iter (car items) '())
                                    (car items))
                                ans))))
  (iter items '()))

; TIL: '() is the same as (list)
; This allows us to create an empty list without specifying 'list' 