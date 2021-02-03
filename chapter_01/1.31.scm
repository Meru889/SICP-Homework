;过程sum是可以用高阶过程表示的大量类似抽象中最简单的一个。请写出一个类似的称为product的过程，它返回在给定范围中各点的某个函数值的乘积。请说明如何用product定义factorial。
;另请按照下面公式计算π的近似值。

;递归版本
(define (product term a next b) 
    (if (> a b) 1
        (* (term a) (product term (next a) next b))
    )
)

(define (multi a b) 
    (define (term a) a)
    (define (next a) (+ a 1))
    (product term a next b)
)

;迭代版本
(define (product1 term a next b) 
    (define (p-iter a result) 
        (if (> a b) result 
        (p-iter (next a) (* (term a) result))
    ))
   (p-iter a 1)
)

(define (multi1 a b) 
    (define (term a) a)
    (define (next a) (+ a 1))
    (product1 term a next b)
)

;运用到阶乘

(define (factorial n)
    (define (term a) a)
    (define (next a) (- a 1))
    (define (product2 term a next b) 
    (define (p-iter a result) 
        (if (= a 1) result 
        (p-iter (next a) (* (term a) result))
    ))
   (p-iter a 1)
)
    (product2 term n next 1)
)

;π的近似值
;π = 4 * (2*4*4*6*6*8... / 3*3*5*5*7...)
