package main

import (
	"fmt"
	"time"
)

func main() {
	s1 := time.Now()
	fmt.Println(f(10))
	fmt.Println("f耗时：", time.Since(s1))
	s2 := time.Now()
	fmt.Println(ff(100))
	fmt.Println("f耗时：", time.Since(s2))
}

// 递归版本
func f(n int) int {
	if n < 3 {
		return n
	}
	return f(n-1) + 2*f(n-2) + 3*f(n-3)
}

// 迭代版本
func ff(n int) int {
	if n < 3 {
		return n
	}
	return ffIterator(2, 1, 0, 0, n)
}

func ffIterator(a, b, c, i, n int) int {
	if i == n {
		return c
	}
	return ffIterator(a+2*b+3*c, a, b, i+1, n)
}
