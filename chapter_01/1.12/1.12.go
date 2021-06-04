package main

import "fmt"

func main() {
	fmt.Println(pascal(3, 2))
}

func pascal(row, col int) int {
	if !(col == 1 || col == row) {
		return pascal(row-1, col-1) + pascal(row-1, col)
	}
	return 1
}
