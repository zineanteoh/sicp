#lang sicp

; Supporting Procedures
(define (length list)
  (if (null? list)
      0
      (+ 1 (length (cdr list)))))

; Ex 2.18

(define (reverse start_list)
  (define (iter-add list1 list2)
    (if (null? list1)
        list2
        (iter-add (cdr list1) (cons (car list1) list2))))
  (iter-add start_list (list)))

; Idea:
#|
list1 (list 1 2 3) and list2 ()

iter-add will gradually reverse the list1 by taking
first element of list1 and appending to beginning of list2

i.e.
list1:        list2:
(1 2 3 4) and ()
(2 3 4)   and (1)
(3 4)     and (2 1)
(4)       and (3 2 1)
()        and (4 3 2 1)

then list2 will be outputted when list1 is empty
|#