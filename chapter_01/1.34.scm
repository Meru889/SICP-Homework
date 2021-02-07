;假定我们定义了：(define (f g) (g 2))，
;而后就有：
;(f square) 4 
;(f (lambda(z) (* z (z+1)))) 6
;如果我们要求解释器去求值(f f)，那会发生什么情况呢？请给出解释

(f f) 
((lambda(g)(g 2)) (lambda(g)(g 2)))
((lambda(g)(g 2)) 2)
(2 2)
;解释器报错 the object 2 is not applicable