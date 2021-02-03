;上面(1.29)的过程sum将产生一个线性递归。我们可以重写该过程，使之能够迭代地执行。请说明应该怎样通过填充下面的定义中缺少的表达式，完成这一工作。
(define (sum term a next b) 
    (define (iter a result) 
        (if (> a b)
            result
            (iter (next a) (+ (term a) result))
        )
    )
    (iter a 0)
)