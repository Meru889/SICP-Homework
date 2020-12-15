;Exercise 1.10: 
;the following procedure computes a mathematical function called Ackermann’s function.
(define (A x y) (cond ((= y 0) 0)
((= x 0) (* 2 y))
((= y 1) 2)
(else (A (- x 1) (A x (- y 1))))))

;What are the values of the following expressions?

(A 1 10)
;解(A 1 10)
(A (- 1 1) (A 1 (- 10 1)))
(A 0 (A 1 9)
(* 2 (A 1 9))
(* 2 (* 2 (A 18)))
(* 2 (* 2 (* 2 (A 1 7))))
(* 2 (* 2 (* 2 (* 2 (A 1 6)))))
(* 2 (* 2 (* 2 (* 2 (* 2 (A 1 5))))))
(* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (A 1 4)))))))
(* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (A 1 3))))))))
(* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (A 1 2)))))))))
(* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (A 1 1))))))))))
(* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 2)))))))))
= 2的10次方 = 1024

(A 2 4)
;解(A 2 4)
(A 1 (A 2 3))
(A 1 (A 1 (A 2 2)))
(A 1 (A 1 (A 1 (A 2 1))))
(A 1 (A 1 (A 1 2)))
(A 1 (A 1 4))
(A 1 16)
= 2的16次方 = 65536

(A 3 3)
; 解(A 3 3)
(A 2 (A 3 2))
(A 2 (A 2 (A 3 1)))
(A 2 (A 2 2))
(A 2 (A 1 (A 2 1)))
(A 2 (A 1 2))
(A 2 4)
= 2的16次方 = 65536


;Consider the following procedures, where A is the procedure defined above:
(define (f n) (A 0 n))   ; 2n
(define (g n) (A 1 n))   ; 2的n次方
(define (h n) (A 2 n))   ; 2的n*n次方
(define (k n) (* 5 n n)) ; 5*n的二次方

;Give concise mathematical definitions for the functions computed by the procedures f, g, and h 
;for positive integer values of n. For example, (k n) computes 5n2.
