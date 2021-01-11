#lang sicp

; Supporting Procedures
(define (length l)
  (if (null? l)
      0
      (+ 1 (length (cdr l)))))
(define (remove-n l n)
  (if (= n 0)
      (cdr l)
      (append (list (car l)) (remove-n (cdr l) (- n 1)))))
(define (check-parity item1 item2)
  (= (remainder item1 2) (remainder item2 2)))

; Ex 2.20

; Approach 1: remove those with opposite parity
; aka my brute force method :) 

(define (same-parity-1 . p-list)
  (let ((first (car p-list))
        (size (length p-list)))
    (define (iter n)
      (if (>= n size)
          p-list
          (let ((item (list-ref p-list n)))
            (if (check-parity first item)
                (set! n (+ n 1))
                (begin (set! size (- size 1))
                       (set! p-list (remove-n p-list n))))
            (iter n))))
    (iter 1)))

(same-parity-1 1 2 3 4 5 6 7)
(same-parity-1 2 3 4 5 6 7)

; Approach 2: Iterate through others list w/ append
; Self implemented after some online help

(define (same-parity-2 first . others)
  (define (iter items result)
    (if (null? items)
        result
        (if (check-parity first (car items))
            (iter (cdr items) (append result (list (car items))))
            (iter (cdr items) result))))
  (iter others (list first)))

(same-parity-2 1 2 3 4 5 6 7)
(same-parity-2 2 3 4 5 6 7)

; Approach 3: Iterate through others list w/o append
; This solution is courtesy of the Scheme community

(define (same-parity-3 first . others)
  (let ((yes? (if (even? first)
                  even?
                  odd?)))
    (define (iter items result)
      (if (null? items)
          (reverse result)
          (iter (cdr items) (if (yes? (car items))
                                (cons (car items) result)
                                result))))
    (iter others (list first))))

(same-parity-3 1 2 3 4 5 6 7)
(same-parity-3 2 3 4 5 6 7)