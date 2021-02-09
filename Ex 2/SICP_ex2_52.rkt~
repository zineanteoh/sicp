#lang sicp
(#%require sicp-pict)

; Ex 2.52

; skipping part a) because I skipped ex 2.49 d) 

; part b) using only one copy of up-split and right-split
(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter n))
            (right (right-split painter n)))
        (let ((top-left up)
              (bottom-right right)
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

; part c) using square-of-four to assemble a new pattern
(define (square-limit painter n)
  (let ((quarter (corner-split painter n)))
    ((square-of-four flip-vert rotate180 identity flip-horiz) quarter)))

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

; Supporting procedures

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))




