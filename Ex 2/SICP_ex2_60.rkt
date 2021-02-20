#lang sicp

; Ex 2.60

; Complexity remains Big-O(n)
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

; Complexity becomes Big-O(1) from Big-O(n)
(define (adjoin-set x set) (cons x set))

; Complexity remains Big-O(n^2)
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

; Complexity becomes Big-O(n), where n is the size of set (assuming set1 and set2 are equal in size)
(define (union-set set1 set2) (append set1 set2))
