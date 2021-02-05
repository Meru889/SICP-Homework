;请说明，sum和product都是另一称为accumulate的更一般的概念的特殊情况，accumulate使用某些一般性的累计函数组合起一系列项：
;(accumulate combiner null-value term a next b)
;combiner过程，它描述如何将当前项与前面各项的积累结果组合起来。
;null-value参数，它描述在所有的项都用完时的基本值。
;请写出accumulate，并说明我们能怎样基于简单的调用accumulate，定义出sum和product来。

(define (accumulate combiner null-value term a next b)
    (cond (> a b) null-value 
        (combiner (term a) (accumulate combiner null-value term (next a) next b))
    )
)

(define (iter a result))

(define (accmulate combiner null-value term a next b) 
    (cond (> a b) null-value 
        (iter (next a) (combiner (term a) null-value))
    )
)

(define (sum term a next b) 
    (accumulate addall 0 term a next b)
)
