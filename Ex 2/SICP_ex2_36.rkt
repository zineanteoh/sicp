#lang sicp

; Ex 2.36

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map (lambda (x)
                                       (car x))
                                     seqs))
            (accumulate-n op init (map (lambda (x)
                                         (cdr x))
                                       seqs)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
