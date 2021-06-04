;Exercise 1.8: 
;Newton’s method for cube roots is based on the fact that if y is an approximation to the cube root of x , 
;then a better approximation is given by the value
;(x/y2 +2y) / 3
;Use this formula to implement a cube-root procedure analogous to the square-root procedure. 
;(In Section 1.3.4 we will see how to implement Newton’s method in general as an abstraction of these square-root and cube-root procedures.)
(define (square x) (* x x))

(define (improve guess x) (/ (+ (/ x (square guess)) (* 2 guess)) 3)) 

(define (cube x) (* x x x))

(define (good-enough? guess x) (< (abs (- (cube guess) x)) 0.001))

(define (cube-itre guess x) (if (good-enough? guess x) guess (cube-itre (improve guess x) x)))

(define (cube-root x) (cube-itre 1.0 x))

;小数和大数求值时有问题