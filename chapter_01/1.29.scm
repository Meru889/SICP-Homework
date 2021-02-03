;辛普森求积分
(define (sum term a next b) 
    (if (> a b) 0
    (+ (term a) (sum term (next a) next b))
    )
)

(define (simpson f a b n) 
    (define h (/ (- b a) n))
    
    (define (y k) (f (+ a (* k h))))
    
    (define (fa k) 
        (cond ((or (= k 0) (= k n)) 1)
            ((odd? k) 4)
            (else 2)))
    
    (define (next k) (+ k 1))
    (define (term k) (* (y k) (fa k)))
    (* (/ h 3) (sum term 0 next n ))
)

(define (cube x) (* x x x))