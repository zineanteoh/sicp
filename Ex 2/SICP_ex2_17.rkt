#lang sicp

; Supporting procedures
(define (length list)
  (if (null? list)
      0
      (+ 1 (length (cdr list)))))

; Ex 2.17

(define (last-pair start_list)
  (define (iter-list l)
    (if (= (length l) 1)
        l
        (iter-list (cdr l))))
  (iter-list start_list))
