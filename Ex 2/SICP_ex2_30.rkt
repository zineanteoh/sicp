#lang sicp

; Ex 2.30

(define (square x) (* x x))

; #1 Direct implementation of square-tree procedure
(define (square-tree sub-tree)
  (cond ((null? sub-tree) nil)
        ((not (pair? sub-tree)) (square sub-tree))
        (else (cons (square-tree (car sub-tree))
                    (square-tree (cdr sub-tree))))))

; #2 Using map and recursion
(define (square-tree-map sub-tree)
  (map (lambda (x)
         (if (pair? x)
             (square-tree-map x)
             (square x)))
       sub-tree))

(square-tree-map (list (list 1 2) 2))
