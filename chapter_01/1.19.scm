;参考 https://mathhelpforum.com/threads/o-log-n-algorithm-for-computing-fibonacci-numbers-sicp-ex-1-19.179966/
;求斐波拉契数
(define (fib n)
    (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q n)
    (cond ((= n 0)
            b)
          ((even? n)
            (fib-iter a 
                      b
                      (+ (square p) (square q))     ; 计算 p'
                      (+ (* 2 p q) (square q))      ; 计算 q'
                      (/ n 2)))
          (else
            (fib-iter (+ (* b q) (* a q) (* a p))
                      (+ (* b p) (* a q))
                      p
                      q
                      (- n 1)))))