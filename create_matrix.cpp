#include <stdlib.h>
#include <iterator>
#include <stdio.h>
#include <iostream>
#include <sstream>      // std::stringstream, std::stringbuf

//USAGE: ./createMatrix <width/height of matrix> <sparceness factor>

// sparceness factor: percent chance a edge will be between any two nodes (1/sparceness)

int main(int argc, char const *argv[]) {
	if (argc != 3){
		std::cout << "INVALID ARGS - USAGE: ./createMatrix <width/height of matrix> <sparceness factor>" << std::endl;
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

	srand (time(NULL));

	for (size_t i = 0; i < count; i++) {
		for (size_t j = 0; j < count; j++) {
			if (i == j) {
				matrix[i][j] = 0;
			}else{
				if (rand() % max_rand + 1 <= 1) {
					matrix[i][j] = 1;
				}else{
					matrix[i][j] = -1;
				}
			}
		}
	}

	int percentCount = 0;
	for (size_t i = 0; i < count; i++) {
		for (size_t j = 0; j < count; j++) {
			printf("%d ", matrix[i][j]);
			if (matrix[i][j] == 1) {
				percentCount++;
			}
		}
		printf("\n");
	}

	// printf("%d\n", percentCount);
	// float percent = ((float)percentCount)/((float)((count*count)-count));
	// printf("%f\n", percent);
	// printf("percent of edges: %f\n", percent);
	return 0;
}
