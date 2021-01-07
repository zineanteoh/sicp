#lang sicp

; Ex 2.6

(define zero
  (lambda (f) (lambda (x) x)))

#| Use substitution to find one: 
(add-1 zero)
(lambda (f) (lambda (x) (f ((zero f) x))))
(lambda (f) (lambda (x) (f ((lambda (x1) x1) x))))
(lambda (f) (lambda (x) (f x)))
|#
(define one
  (lambda (f) (lambda (x) (f x))))

#| Use substitution to find two:
(add-1 one)
(lambda (f) (lambda (x) (f ((one f) x))))
(lambda (f) (lambda (x) (f ((lambda (x1) (f x1)) x))))
(lambda (f) (lambda (x) (f (f x))))
|#

(define two
  (lambda (f) (lambda (x) (f (f x)))))

; There is a pattern. Thus three and four must be: 
(define three
  (lambda (f) (lambda (x) (f (f (f x))))))
(define four
  (lambda (f) (lambda (x) (f (f (f (f x)))))))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
(define (add a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))
; Figuring out 'add' procedure (TOOK ME A LONG TIME):
; ... 1. Observe 'add-1' procedure,
; ... 2. Notice how to add one level of (f x) to n levels, 
; ...    (f inner-level) is used, where inner-level = ((n f) x)
; ... 3. The procedure (add a b) needs to add 'a' levels
; ...    to 'b' levels
; ... 4. The 'b' levels can be obtained by mimicking the inner-level
; ...    of 'add-1' by letting n = b: ((b f) x)
; ... 6. Apply this inner-level to the existing 'a' levels: (a f)
; ... 7. Combine together (outer-level inner-level) to get
; ...    = ((a f) ((b f) x))
; ... 8. Not entirely confident, but after checking it, it does work! 



; Check that (add a b) works
#|
(add two two)
(lambda (f) (lambda (x) ((two f) ((two f) x))))
(lambda (f) (lambda (x) ((lambda (x1) (f (f x1))) ((lambda (x2) (f (f x2))) x))))
(lambda (f) (lambda (x) ((lambda (x1) (f (f x1))) (f (f x)))))
(lambda (f) (lambda (x) (f (f (f (f x)))))) ; YES IT WORKS
|#

; Working draft (to find 'add') below... it's a mess

#|
; with just lambda f
(add two two)
(lambda (f) ((two f) ((two f) x)))
(lambda (f) ((lambda (x1) (f (f x1))) ((lambda (x2) (f (f x2))) x)))
(lambda (f) ((lambda (x1) (f (f x1))) (f (f x))))
(lambda (f) (f (f (f (f x)))))

; FACTS
(lambda (f) (two f))                      = (lambda (f) (lambda (x) (f (f x))))

((two f) ((two f) x)) = (f (f ((two f) x)))
                      = (f (f (f (f x))))

((two f) x)           = (f (f x))
((two f) ((two f) x)) =

; test if (a b) works
(add two two)
(two two)
((lambda (f) (...))   (lambda (f) (...)))
(lambda (x) (Ff (Ff x))), where Ff is (lambda (F) (lambda (x) (F (F x))))
... (Ff x) becomes (lambda (x1) (x (x x1)))
... (Ff (Ff x))
... -> (Ff (lambda (x1) (x (x x1))))
... -> (lambda (x2) ((lambda (x1) (x (x x1))) ((lambda (x1) (x (x x1))) x2)))
... -> (lambda (x2) ((lambda (x1) (x (x x1))) (x (x x2))))
... -> (lambda (x2) (x (x (x (x x2)))))
... -> (lambda (x) (f (f (f (f x)))))

(add-1 zero) = (add one zero) = (lambda (f) (lambda (x) (f x)))


; test if (lambda (f) (a b)) works
(add two two)
(lambda (f) (two two))
(lambda (f) ((lambda (fa) (lambda (xa) (fa (fa xa)))) (lambda (fb) (lambda (xb) (fb (fb xb))))))
(lambda (f) (lambda (xa) (FB (FB xa))))
... FB is (lambda (fb) (lambda (xb) (fb (fb xb))))
... (FB xa) is (lambda (xb) (xa (xa xb)))
(lambda (f) (lambda (xa) (FB (lambda (xb) (xa (xa xb))))))
(lambda (f) (lambda (xa) (FB (lambda (xb) (xa (xa xb))))))
... (FB junk) is (lambda (xb) (junk (junk xb)))
... (lambda (xb) ((lambda (xb) (xa (xa xb))) ((lambda (xb) (xa (xa xb))) xb)))
... (lambda (xb) ((lambda (xb) (xa (xa xb))) (xa (xa xb))))
... (lambda (xb) ((lambda (xb) (xa (xa xb))) (xa (xa xb)))) ; can the first two xa be regarded as identical from the last two xa?
... (lambda (xb) (xa (xa (xa (xa xb))))) ; if the above is true, then this statement follows
... (lambda (f) (xa (xa (xa (xa f)))))

; test if (lambda (f) (lambda (x) (a b))) works
(add two two)
(lambda (f) (lambda (x) (two two)))
(lambda (f) (lambda (x) ((lambda (fa) (lambda (xa) (fa (fa xa)))) (lambda (fb) (lambda (xb) (fb (fb xb)))))))
(lambda (f) (lambda (x) (lambda (xa) (FB (FB xa)))))
... where FB = (lambda (fb) (lambda (xb) (fb (fb xb))))
... (FB xa)      = (lambda (xb) (xa (xa xb)))
... (FB (FB xa)) = (FB (lambda (xb) (xa (xa xb)))) 
... ...          = (lambda (xc) ((lambda (xb) (xa (xa xb))) ((lambda (xb) (xa (xa xb))) xc)))
... ...          = (lambda (xc) ((lambda (xb) (xa (xa xb))) (xa (xa xc))))
... ...          = (lambda (xc) ((lambda (xb) (xa1 (xa1 xb))) (xa (xa xc))))
... ...          = (lambda (xc) (xa1 (xa1 (xa (xa xc)))))
(lambda (f) (lambda (x) (lambda (xa) (lambda (xc) (xa1 (xa1 (xa (xa xc))))))))

; test if (a ((b f) x)) works
(add two two)
(lambda (f) (lambda (x) (two ((two f) x))))
(lambda (f) (lambda (x) ((lambda (f) (lambda (x) (f (f x)))) (((lambda (f1) (lambda (x1) (f1 (f1 x1)))) f) x))))
(lambda (f) (lambda (x) ((lambda (f) (lambda (x) (f (f x)))) ((lambda (x1) (f (f x1))) x))))
(lambda (f) (lambda (x) ((lambda (f) (lambda (x) (f (f x)))) (f (f x)))))
(lambda (f) (lambda (x) ((lambda (f1) (lambda (x1) (f1 (f1 x1)))) (f (f x)))))
(lambda (f) (lambda (x) (lambda (x1) ((f (f x)) ((f (f x)) x1)))))
(lambda (f) (lambda (x) (lambda (x1) ((f (f x)) ((f (f x)) x1)))))

|#