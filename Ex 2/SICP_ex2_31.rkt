#lang sicp

; Ex 2.31

(define (square x) (* x x))

(define (tree-map proc sub-tree)
  (map (lambda (x)
         (if (pair? x)
             (tree-map proc x)
             (proc x)))
       sub-tree))

(define (square-tree tree) (tree-map square tree))

(square-tree (list 1 2))
