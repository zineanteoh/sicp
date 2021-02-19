#lang sicp

; Ex 2.55

#|
Since 'a is equivalent to (quote a), 
''a is (quote (quote a))

thus 
(car ''a) is (car (quote (quote a))) = quote


EXTRA: 
Furthermore,
(cdr ''a) is (cdr (quote (quote a))) = ((quote a)) = (a)
and
(cadr ''a) is (car (cdr (quote (quote a)))) = (car (a)) = a
|#