;Exercise 1.6

;Alyssa P. Hacker doesn’t see why if needs to be provided as a special form. 
;“Why can’t I just define it as an ordinary procedure in terms of cond?” she asks. 
;Alyssa’s friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:
(define (new-if predicate then-clause else-clause) (cond (predicate then-clause)
(else else-clause)))

;Eva demonstrates the program for Alyssa:
(new-if (= 2 3) 0 5) 5
(new-if (= 1 1) 0 5) 0

;Delighted, Alyssa uses new-if to rewrite the square-root program:
(define (sqrt-iter guess x) (new-if (good-enough? guess x)
                guess
                (sqrt-iter (improve guess x) x)))

;What happens when Alyssa attempts to use this to compute square roots? Explain.

;解释器抱怨说函数的递归层数太深了，超过了最大的递归深度，它不能处理这样的函数。
;问题出在 sqrt-iter 函数，如果使用 trace 来跟踪它的调用过程的话，就会发现它执行了大量的递归调用，这些调用数量非常庞大，最终突破解释器的栈深度，造成错误：

;至于造成 sqrt-iter 函数出错的原因，毫无疑问就是新定义的 new-if 了。
;根据书本 12 页所说， if 语句是一种特殊形式，当它的 predicate 部分为真时， then-clause 分支会被求值，否则的话， else-clause 分支被求值，两个 clause 只有一个会被求值。
;而另一方面，新定义的 new-if 只是一个普通函数，它没有 if 所具有的特殊形式，根据解释器所使用的应用序求值规则，每个函数的实际参数在传入的时候都会被求值，因此，当使用 new-if 函数时，无论 predicate 是真还是假， then-clause 和 else-clause 两个分支都会被求值。
;可以用一个很简单的实验验证 if 和 new-if 之间的差别，如果使用 if 的话，那么以下的代码只会打印 good :
1 ]=> (if #t (display "good") (display "bad"))
good


;如果使用 new-if 的话，那么两个语句都会被打印：
1 ]=> (new-if #t (display "good") (display "bad"))
badgood

;这就说明了为什么用 new-if 重定义的 sqrt-iter 会出错：因为无论测试结果如何， sqrt-iter 都会一直递归下去。

;当然，单纯的尾递归并不会造成解释器的栈溢出，因为 scheme 解释器的实现都是带有尾递归优化的，
;但是在 new-if 的这个例子里，因为 sqrt-iter 函数的返回值要被 new-if 作为参数使用，所以对 sqrt-iter 的调用并不是尾递归，这样的话，尾递归优化自然也无法进行了，
;因此 new-if 和 sqrt-iter 的递归会最终突破解释器的最大递归深度，从而造成错误：