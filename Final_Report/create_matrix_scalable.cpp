#include <stdlib.h>
#include <iterator>
#include <stdio.h>
#include <iostream>
#include <sstream>      // std::stringstream, std::stringbuf
#include <vector>

//USAGE: ./createMatrix <width/height of matrix> <sparceness factor>

// sparceness factor: percent chance a edge will be between any two nodes (1/sparceness)

int main(int argc, char const *argv[]) {
	if (argc != 4){
		std::cout << "INVALID ARGS - USAGE: ./create_matrix <width/height of matrix> <sparceness factor> <1 or 2 ( 1=baseline 2=current )>" << std::endl;
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

	s.clear();
	s << argv[3];
	size_t mode;
	s >> mode;
	// std::cout << mode << std::endl;

    //Unknown if necessary
	std::vector<int> matrix;
	matrix.resize(count);

	srand (time(NULL));

	for (size_t i = 0; i < count; i++) {
		for (size_t j = 0; j < count; j++) {
            if (rand() % max_rand + 1 <= 1 && i != j) {
                printf("%ld ", j);
            }
		}

        printf("\n");
	}






	// for (size_t i = 0; i < count; i++) {
	// 	for (size_t j = 0; j < count; j++) {
	// 		if (i == j) {
	// 			matrix[j] = 0;
	// 		}else{
	// 			if (rand() % max_rand + 1 <= 1) {
	// 				matrix[j] = 1;
	// 			}else{
	// 				if (mode == 1) {
	// 					matrix[j] = -1;
	// 				}else{
	// 					matrix[j] = 2;
	// 				}
	// 			}
	// 		}
	// 	}

    //     for(size_t j =0; j < count; j++){
    //         printf("%d ", matrix[j]);
    //     }
    //     printf("\n");
	// }

	/*int percentCount = 0;
	for (size_t i = 0; i < count; i++) {
		for (size_t j = 0; j < count; j++) {
			printf("%d ", matrix[i][j]);
			if (matrix[i][j] == 1) {
				percentCount++;
			}
		}
		printf("\n");
	}*/

	// printf("%d\n", percentCount);
	// float percent = ((float)percentCount)/((float)((count*count)-count));
	// printf("%f\n", percent);
	// printf("percent of edges: %f\n", percent);
	return 0;
}
