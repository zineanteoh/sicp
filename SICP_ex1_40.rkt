#lang sicp

; Ex 1.40
(define (cubic a b c)
  (lambda (x) (+ (cube x)
                 (* a (square x))
                 (* b x)
                 c)))

; Supporting procedures: 

(define (square x) (* x x))
(define (cube x) (* x (square x)))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define dx 0.00001)
(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))

#|
newtons-method:
    let the function G(x) be the function obtained from newton-transform
    then apply fixed-point on G(x) to find x s.t. x = G(x)
    this will be the approximation to the root of g(x). 
|#
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (average v1 v2)
  (/ (+ v1 v2) 2))
(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

#|
More ways to define sqrt procedure:
(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))
(define (sqrt x)
  (newtons-method (lambda (y) (- (square y) x)) 1.0))
(define (sqrt x)
  (fixed-point-of-transform (lambda (y) (/ x y))
                            average-damp
                            1.0))
|#

(define (sqrt x)
  (fixed-point-of-transform (lambda (y) (- (square y) x))
                            newton-transform
                            1.0))