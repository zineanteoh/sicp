#lang sicp

; Ex 2.39

(define (reverse-r sequence)
  (fold-right (lambda (x y) (append y (list x)))
              nil
              sequence))

(define (reverse-l sequence)
  (fold-left (lambda (x y)
               (cons y x))
             nil
             sequence))

(define (fold-right op init seq)
  (if (null? seq)
      init
      (op (car seq)
          (fold-right op init (cdr seq)))))

(define (fold-left op init seq)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter init seq))