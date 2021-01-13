#lang sicp

; Ex 2.32

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x)
                            (append (list (car s)) x))
                          rest)))))

#|
Finding the subsets of s, where s is a list of
distinct elements, can be found as follow: 

1. Let 'rest' be the subsets of all but the 1st
   element of s: (subsets (cdr s))
2. The subsets of s can then therefore be obtained
   by combining the two lists: 
     a. the list 'rest'
     b. the list 'rest', except that each subset
        includes the previously-excluded element
        (map add-1st-element-of-s rest)

subsets of s = 'rest' + ('rest' with 1st element)
The above statement holds because
the set of all subsets of s is the union of: 
a. set of all subsets excluding the 1st element
b. set of all subsets excluding the 1st element,
   where the 1st element is inserted into each subset

e.g.
(subsets (list 1 2))
(append (subsets (list 2)) (...))
(append (() (2)) (map <append 1> (() (2))))
(append (() (2)) ((1) (1 2)))
(() (2) (1) (1 2))
|_____| |_________|
  (a)  U    (b)      = set of all subsets of s

Base case: The subsets of () is simply (())
The subsets of (x) is (() (x)) for any element x

|#
