#lang sicp
(#%require (lib "27.ss" "srfi"))

; Ex 1.22, 23, 24
; write search-for-primes
(define (search-for-primes lower upper)
  (define (iter n)
    (cond ((<= n upper)
           (timed-prime-test n)
           (iter (+ n 2)))))
  (if (even? lower)
       (iter (+ lower 1))
       (iter lower)))

; checks if number is prime (and return time taken) 
(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
      (report-prime n (- (runtime) start-time))))

; checks if a number is prime
(define (prime? n)
  (= n (smallest-divisor n)))
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next-divisor test-divisor)))))
(define (next-divisor n)
  (if (even? n)
      (+ n 1)
      (+ n 2)))

; checks if a number is prime using Fermat's Test (probabilistic)
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random-integer (- n 1)))))
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

; report time taken
(define (report-prime n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline))

; support procedures
(define (square x)
  (* x x))
(define (divides? a b) (= (remainder b a) 0))
