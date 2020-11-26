;Exercise 1.8: 
;Newton’s method for cube roots is based on the fact that if y is an approximation to the cube root of x , 
;then a better approximation is given by the value
(x/y2 +2y) / 3
;Use this formula to implement a cube-root procedure analogous to the square-root procedure. 
;(In Section 1.3.4 we will see how to implement Newton’s method in general as an abstraction of these square-root and cube-root procedures.)
(define (square x) (* x x))

(define (improve guess x) (/ (+ (/ x (square guess)) (* 2 guess)) 3)) 


(define (good-enough? old-guess new-guess) (< (/ (abs (- new-guess old-guess)) old-guess)) 0.0001)

(define (cube-itre guess x) (if (good-enough? (improve guess x) x) (imporve guess x) (cube-itre (improve guess x) x)))

(define (cube x) (cube-itre 1.0 x))
