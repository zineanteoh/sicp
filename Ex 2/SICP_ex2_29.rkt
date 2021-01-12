#lang sicp

; Ex 2.29

; Note: Scheme Community has more elegant solutions.
; Below is my first attempt at the problem.
; The operator (cond) is extremely powerful

(define (make-mobile left right) (list left right))
(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (car (cdr mobile)))

(define (make-branch length structure) (list length structure))
(define (branch-length branch) (car branch))
(define (branch-structure branch) (car (cdr branch)))

(define (total-weight mobile)
  (define (weight branch)
    (let ((structure (branch-structure branch)))
      (if (number? structure)
        structure
        (total-weight structure))))
  (+ (weight (left-branch mobile))
     (weight (right-branch mobile))))

(define (torque branch)
    (let ((structure (branch-structure branch))
          (length (branch-length branch)))
      (if (number? structure)
          (* length structure)
          (* length (total-weight structure)))))

(define (balanced? mobile)
  (define (submobiles-balanced? branch)
    (let ((structure (branch-structure branch)))
      (if (not (number? structure))
          (balanced? structure)
          #t)))
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (and (= (torque left)
            (torque right))
         (submobiles-balanced? left)
         (submobiles-balanced? right))))

#|
Very little changes required!
Just need to change right-branch and branch-structure: 
(define (right-branch mobile) (cdr mobile))
(define (branch-structure branch) (cdr branch))

Before: (car (cdr x))
After:  (cdr x)

This is because (list A B) results in two boxes
The first box is the pair (A, *pointer to 2nd box)
The second box is the pair (B, #nil)
To get B, we perform (car (cdr x))

While (cons A B) results in one box
The box of the pair (A, B)
To get B, we perform (cdr x)
|#

