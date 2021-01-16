#lang sicp

; Ex 2.35

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x)
                         (if (not (pair? x)) 1 (count-leaves x)))
                       t)))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

#| old count-leaves
(define (count-leaves t)
  (cond ((null? t) 0)
        ((not (pair? t)) 1)
        (+ (count-leaves (car t))
           (count-leaves (cdr t)))))
|#