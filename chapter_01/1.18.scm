(define (double n) (+ n n))
(define (halve n) (/ n 2))

(define (multiply a b) 
    (multiply-iter a b 0)
)

(define (multiply-iter a b c) 
    (cond ((= b 0) c)
        ((even? b) (multiply-iter (double a) (halve b) c))
        ((odd? b) (multiply-iter a (- b 1) (+ a c)))
    )
)

