#lang sicp

; Ex 2.61

; Worst case: n steps when x is larger than the last element of the ordered set
; Best case: 1 step when x is the smaller than the first element of the ordered set

; On average, this will take half as many steps as the unordered representation

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((<= x (car set)) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

; Supporting procedures

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) #t)
        ((< x (car set)) #f)
        (else (element-of-set? x (cdr set)))))

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1))
            (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1 (intersection-set (cdr set1)
                                          (cdr set2))))
              ((< x1 x2)
               (intersection-set (cdr set1) set2))
              ((< x2 x1)
               (intersection-set set1 (cdr set2)))))))


