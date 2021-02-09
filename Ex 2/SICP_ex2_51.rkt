#lang sicp
(#%require sicp-pict)

; Ex 2.51

; Analogous to beside 
(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-up
           (transform-painter
            painter1
            split-point
            (make-vect 1.0 0.5)
            (make-vect 0.0 1.0)))
          (paint-down
           (transform-painter
            painter2
            (make-vect 0.0 0.0)
            (make-vect 1.0 0.0)
            split-point)))
      (lambda (frame)
        (paint-up frame)
        (paint-down frame)))))

; In terms of beside and suitable rotation operations: 

(define (below-2 painter1 painter2)
  (lambda (frame)
    ((rotate270 (beside (rotate90 painter1)
                        (rotate90 painter2))) frame)))

