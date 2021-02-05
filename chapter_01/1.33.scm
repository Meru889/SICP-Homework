;练习1.33：你可以通过引进一个处理被组合项的过滤器(filter)概念，写出一个比accumulate(1.32中)更一般的版本。
;也就是说，在计算过程中，只组合起由给定范围得到的项里的那些满足特定条件的项。这样得到的filtered-accumulate抽象取与上面累积过程同样的参数，
;再加上一个另外的描述有关过滤器的谓词参数。请写出filtered-accumulate作为一个过程，说明如何用filetered-accumulate表达以下内容：
;1. 求出再区间a到b中所有素数之和（假定你已经写出了谓词prime?）
;2. 所有小于n且相对于n为素数的正整数（即所有满足GCD(i, n)=1的整数i<n)的乘积 
;2的原文 the product of all the positive integers less than n that are relatively prime to n

;解1
(define f (accumulate combiner null-value term a next b))
(define (prime? n) 
    ;如何判断一个数为素数
)

(define (filtered-accumulate prime? f) 
    (cond (prime? a) 
        f 
    )
)

