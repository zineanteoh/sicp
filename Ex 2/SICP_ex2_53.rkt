#lang sicp

; Ex 2.53

|#
(list 'a 'b 'c)
> (a b c)

(list (list 'george))
> ((george))

(cdr '((x1 x2) (y1 y2)))
> ((y1 y2))
; Remember that lists are represented by box-and-pointer! 

(cadr '((x1 x2) (y1 y2)))
> (y1 y2)
; Remember that cadr means (car (cdr ...))

(pair? (car '(a short list)))
> #f

(memq 'red '((red shoes) (blue socks)))
> #f

(memq 'red '(red shoes blue socks))
> (red shoes blue socks)


#|