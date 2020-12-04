;Exercise 1.9: 
;Each of the following two procedures defines a method for adding two positive integers in terms of the procedures inc, which increments its argument by 1, and dec, which decrements its argument by 1.
(define (+ a b)
(if (= a 0) b (inc (+ (dec a) b))))

(define (+ a b)
(if (= a 0) b (+ (dec a) (inc b))))
;Using the substitution model, illustrate the process gener- ated by each procedure in evaluating (+ 4 5). Are these processes iterative or recursive?

;recursive
(define (+ a b)
(if (= a 0) b (inc (+ (dec a) b))))

;代入数值看计算过程
(+ 4 6)
(inc (+ 3 6))
(inc (inc (+ 2 6)))
(inc (inc (inc (+ 1 6))))
(inc (inc (inc (inc (+ 0 6)))))
(inc (inc (inc (inc 6))))
(inc (inc (inc 7)))
(inc (inc 8))
(inc 9)
10
;从计算过程中可以很明显地看到伸展和收缩两个阶段，且伸展阶段所需的额外存储量和计算所需的步数都正比于参数 a ，说明这是一个线性递归计算过程。

;iterative
(define (+ a b)
(if (= a 0) b (+ (dec a) (inc b))))

;代入数值看计算过程
(+ 4 6)
(+ 3 7)
(+ 2 8)
(+ 1 9)
10
;从计算过程中可以看到，这个版本的 plus 函数只使用常量存储大小，且计算所需的步骤正比于参数 a ，说明这是一个线性迭代计算过程。
