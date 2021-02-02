;Exercise 1.13: 
;Prove that Fib(n) is the closest integer to φn/√5, where φ = (1 + √5)/2. 
;Hint: Let ψ = (1 − √5)/2. 
;Use induction and the definition of the Fibonacci numbers (see Section 1.2.2) to prove that Fib(n) = (φ^n − ψ^n )/√5.

解决思路：
首先计算出Fib(n+1)和Fib(n+2)，得出Fib(n+2) = Fib(n) + Fib(n+1) ;
分别当n=0和n=1时代入计算 Fib(n) = (φ^n − ψ^n )/√5，得出Fib(0) = 0, Fib(1)=1,符合斐波拉契数列
因此Fib(n) = (φ^n − ψ^n )/√5 成立

要证明Fib(n) is the closest integer to φn/√5，首先要证明两者的差值绝对值小于1/2
用 (φ^n − ψ^n )/√5 - φ^n/√5 = ψ^n / √5
当n=0 1/√5<1/2 ,所以 差值小于1/2


