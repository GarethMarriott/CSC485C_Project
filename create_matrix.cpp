#include <stdlib.h>
#include <iterator>
#include <stdio.h>
#include <iostream>
#include <sstream>      // std::stringstream, std::stringbuf

//USAGE: ./createMatrix <width/height of matrix> <range of random>

int main(int argc, char const *argv[]) {
	if (argc != 3){
		std::cout << "INVALID ARGS - USAGE: ./createMatrix <width/height of matrix> <range of random>" << std::endl;
		return 0;
	}
	std::stringstream s;
	s << argv[2];
	size_t max_rand;
	s >> max_rand;

	s.clear();
	s << argv[1];
	size_t count;
	s >> count;
	std::cout << count << std::endl;

	int matrix[count][count];

	for (size_t i = 0; i < count; i++) {
		for (size_t j = 0; j < count; j++) {
			if (i == j) {
				matrix[i][j] = 0;
			}else{
				matrix[i][j] = rand() % max_rand + 1;
			}
		}
	}

	for (size_t i = 0; i < count; i++) {
		for (size_t j = 0; j < count; j++) {
			printf("%d ", matrix[i][j]);
		}
		printf("\n");
	}
	return 0;
}
