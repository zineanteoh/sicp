#lang sicp

; Ex 2.43

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter (lambda (positions)
                  (safe? k positions))
                (flatmap (lambda (new-row)
                           (map (lambda (rest-of-queens)
                                  (adjoin-position new-row k rest-of-queens))
                                (queen-cols (- k 1))))
                         (enumerate-interval 1 board-size)))))
  (queen-cols board-size))

#|
When n = board-size = 8, 
For each k, the subprocedure queen-cols will recursively call queen-cols 8 times,
    as (lambda (new-row) ...) is being mapped to an enumerated list of 8 items
Therefore, it will take ~ (8^8)xT for Louis' solution to solve the eight-queen puzzle. 
|#