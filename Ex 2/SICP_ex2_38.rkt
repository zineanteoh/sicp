#lang sicp

; Ex 2.38


; Used to double check answers
; turns out that I got wrong on the last two statements

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))


(fold-right / 1 (list 1 2 3))
; 3/2

(fold-left / 1 (list 1 2 3))
; 1/6

(fold-right list nil (list 1 2 3))
; '(1 (2 (3 ())))

(fold-left list nil (list 1 2 3))
; '(((() 1) 2) 3)

#|
op has to have associativity and commutativity
both + and * works.

Commutativity (order):
a + b + c = c + b + a 
> going left is the same as going right

Associativity (grouping):
(a x (b x (c x d))) = (((a x b) x c) x d)
> different groupings do not affect the outcome
|#