;Exercise 1.3: 
;Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

(define (squares x) (* x x))

(define (sum-squares x y) (+ (squares x) (squares y)))

(define (bigger x y) (if (> x y) x) y)
(define (smaller x y) (if (> x y) y) x)

(define (big-num-squares x y z) (
    sum-squares (bigger x y) (bigger (smaller x y) z)
    ))