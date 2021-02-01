#lang sicp
(#%require sicp-pict)

; Ex 2.48

(define make-segment cons)
(define start-segment car)
(define end-segment cdr)

; Supporting procedures

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame)
         (start-segment segment))
        ((frame-coord-map frame)
         (end-segment segment))))
     segment-list)))



