package main

func main() {
	sumOfTwoBigNum(30, 33, 31)
}

func sumOfTwoBigNum(x, y, z int) int {
	return sum(bigger(x, y), bigger(smaller(x, y), z))
}

func bigger(x, y int) int {
	if x > y {
		return x
	}
	return y
}

func smaller(x, y int) int {
	if x < y {
		return x
	}
	return y
}

func sum(a, b int) int {
	return a + b
}
