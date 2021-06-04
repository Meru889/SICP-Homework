package main

import (
	"fmt"
	"math"
)

func main() {
	fmt.Println(cubeItemDefaultGuess(9))
}

func cubeItemDefaultGuess(x float64) float64 {
	return cubeItem(x, 1)
}

func cubeItem(x, guess float64) float64 {
	if goodEnough(guess, improveGuess(x, guess)) {
		return guess
	}
	return cubeItem(x, improveGuess(x, guess))
}

func improveGuess(x, guess float64) float64 {
	return (x/math.Pow(guess, 2) + (2 * guess)) / 3
}

func goodEnough(oldGuess, newGuess float64) bool {
	if math.Abs(oldGuess-newGuess)/oldGuess < 0.00000000001 {
		return true
	}
	return false
}
