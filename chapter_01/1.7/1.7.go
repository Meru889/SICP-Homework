package main

import (
	"fmt"
	"math"
)

func main() {
	b := 0.00009
	//a := sqrtItemGuess1(b)
	c := sqrtItemGuessNew1(b)
	fmt.Println(c)
}

func sqrtItem(x, guess float64) float64 {
	if goodEnough(x, guess) {
		return guess
	}
	return sqrtItem(x, improveGuess(x, guess))
}

func sqrtItemNew(x, guess float64) float64 {
	if goodEnoughScale(improveGuess(x, guess), guess) {
		return guess
	}
	return sqrtItemNew(x, improveGuess(x, guess))
}

func sqrtItemGuess1(x float64) float64 {
	return sqrtItem(x, 1)
}

func sqrtItemGuessNew1(x float64) float64 {
	return sqrtItemNew(x, 1)
}

func goodEnough(x, guess float64) bool {
	fmt.Println(math.Abs(x - math.Pow(guess, 2)))
	if math.Abs(x-math.Pow(guess, 2)) < 0.0001 {
		return true
	}
	return false
}

func goodEnoughScale(newGuess, oldGuess float64) bool {
	flag := false
	if math.Abs(newGuess-oldGuess)/oldGuess < 0.001 {
		flag = true
	}
	return flag
}

func improveGuess(x, guess float64) float64 {
	return avg2(guess, x/guess)
}

func avg2(a, b float64) float64 {
	return (a + b) / 2
}
