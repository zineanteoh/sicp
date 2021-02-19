#lang sicp

; Ex 2.57

(define (augend s)
  (if (pair? (cdddr s))
      (cons '+ (cddr s))
      (caddr s)))
(define (multiplicand p)
  (if (pair? (cdddr p))
      (cons '* (cddr p))
      (caddr p)))

; Supporting Procedures

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var)))
        ((product? exp) (make-sum
                         (make-product (multiplier exp)
                                       (deriv (multiplicand exp) var))
                         (make-product (deriv (multiplier exp) var)
                                       (multiplicand exp))))
        ((exponentiation? exp) (make-product
                                (make-product (power exp)
                                              (make-exponentiation
                                               (base exp)
                                               (make-sum (power exp) -1)))
                                (deriv (base exp) var)))
        (else (error "unknown expression type: DERIV" exp))))

(define (exponentiation? x) (and (pair? x) (eq? (car x) '**)))
(define (make-exponentiation base power)
  (cond ((=number? power 0) 1)
        ((=number? power 1) base)
        (else (list '** base power))))
(define (base e) (cadr e))
(define (power e) (caddr e))
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (sum? x) (and (pair? x) (eq? (car x) '+)))
(define (product? x) (and (pair? x) (eq? (car x) '*)))
(define (=number? exp num) (and (number? exp) (= exp num)))


(define (addend s) (cadr s))
(define (multiplier p) (cadr p))
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2))
         (+ a1 a2))
        (else (list '+ a1 a2))))
(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))
