;Exercise 1.5: 
;Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using 
;applicative-order evaluation or normal-order evaluation. He defines the following two procedures:
(define (p) (p)) 
(define (test x y) (if (= x 0) 0 y))
;then he evaluates the expression
(test 0 (p))
;What behavior will Ben observe with an interpreter that uses applicative-order evaluation? 
;What behavior will he observe with an interpreter that uses normal-order evalu- ation? 
;Explain your answer. (Assume that the evaluation rule for the special form if is the same 
;whether the interpreter is using normal or applicative order: the predicate expression is evaluated first, 
;and the result determines whether to evaluate the consequent or the alternative ex- pression.)

解答这道题的关键在于了解到应用序和正则序之间的区别
首先，可以确定的是，无论解释器使用的是什么求值方式，调用 (p) 总是进入一个无限循环(infinite loop)，因为函数 p 会不断调用自身：
在应用序中，所有被传入的实际参数都会立即被求值，因此，在使用应用序的解释器里执行 (test 0 (p)) 时，实际参数 0 和 (p) 都会被求值，
而对 (p) 的求值将使解释器进入无限循环，因此，如果一个解释器在运行 Ben 的测试时陷入停滞，那么这个解释器使用的是应用序求值模式。
另一方面，在正则序中，传入的实际参数只有在有需要时才会被求值，因此，在使用正则序的解释器里运行 (test 0 (p)) 时， 0 和 (p) 都不会立即被求值，
当解释进行到 if 语句时，形式参数 x 的实际参数(也即是 0)会被求值(求值结果也是为 0 )，然后和另一个 0 进行对比((= x 0))，
因为对比的值为真(#t),所以 if 返回 0 作为值表达式的值，而这个值又作为 test 函数的值被返回。
因为在正则序求值中，调用 (p) 从始到终都没有被执行，所以也就不会产生无限循环，因此，如果一个解释器在运行 Ben 的测试时顺利返回 0 ，那么这个解释器使用的是正则序求值模式。