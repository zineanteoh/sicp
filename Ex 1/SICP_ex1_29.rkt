#lang sicp

; Ex 1.29 - Integration with Simpson's Rule

; f is a procedure aka the function itself
; a is lower bound
; b is upper bound
; n is the # of summation terms
(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (next-one x)
    (+ x h))
  (define (next-two x)
    (+ x h h))
  
  (* (/ h 3.0)
     (+ (f a)
        (* 4.0
           (sum f (+ a h) next-two b))
        (* 2.0
           (sum f (+ a h h) next-two b))
        (f b))))  ; odd # from 1 to n-1

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube x) (* x x x))

#|
     (+ (sum f a next-one b) ; all # from 0 to n
        (sum f (+ a h h) next-two b) ; even # from 1 to n-2
        (* 2.0
           (sum f (+ a h) next-two b)


(define (simpson-integral f a b n)
  (define h
    (/ (- b a) n))
  (define (s-next x)
    (+ x h))
  (define (multiplier k)
    (cond ((or (= k 0) (= k n)) 1)
          ((even? k) 2)
          (else 4)))
  (define (new-f)
    (* multiplier
       ))

  
  (define (f-input k)
    (+ a (* k h)))
  
  (define (s-term)
    (f a))
  
  (* (/ h 3)
     (sum new-f a s-next b)

     ; ...
     (+ (f (f-input 0))
        (sum s-term a s-next b)
        (f (f-input n)))))
|#
