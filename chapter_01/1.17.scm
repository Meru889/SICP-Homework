;用加法做实现迭代的乘法运算
(define (double n) (+ n n))
(define (halve x) (/ x 2))

(define (multiply a b) 
    (cond ((= b 0) 0)
    ((even? b) 
        (double (multiply a (halve b))))
    ((odd? b) 
        (+ a (multiply a (- b 1)))))
)