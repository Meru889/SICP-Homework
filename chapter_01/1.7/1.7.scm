;Exercise 1.7:
;The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. 
;Also, in real computers, arithmetic operations are almost always performed with limited precision.
;This makes our test inadequate for very large numbers. Explain these statements, 
;with examples showing how the test fails for small and large numbers. 
;An alternative strategy for implementing good-enough? 
;is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. 
;Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?
(define (average x y) (/ (+ x y) 2))
(define (improve guess x) (average guess (/ x guess)))
(define (good-enough? guess x) (< (abs (- (square guess) x)) 0.001))
(define (sqrt-iter guess x) 
    (if (good-enough? guess x) guess (sqrt-iter (improve guess x) x)))
(define (sqrt x)
    (sqrt-iter 1.0 x))

;原程序在计算小数和大数时，因精度问题，无法得出正确的解，修改思路是将good-enough中计算差值的方式改为变化比例
;程序如下：
(define (new-good-enough? oldGuess newGuess) (< (/ (abs(- newGuess oldGuess)) oldGuess) 0.001))
(define (improve guess x) (average guess (/ x guess)))
(define (new-sqrt-iter guess x) 
    (if (new-good-enough? guess (improve guess x)) (improve guess x) (new-sqrt-iter (improve guess x) x)))
(define (new-sqrt x) (new-sqrt-iter 1.0 x))








