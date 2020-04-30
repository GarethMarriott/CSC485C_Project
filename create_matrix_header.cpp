#include <stdlib.h>
#include <iterator>
#include <stdio.h>
#include <iostream>
#include <sstream>      // std::stringstream, std::stringbuf
#include <vector>
#include <string>
#include <random>

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
	// std::cout << count << std::endl;

	s.clear();
	s << argv[3];
	size_t mode;
	s >> mode;
	// std::cout << mode << std::endl;

	std::vector<std::vector<int>> matrix;
	matrix.resize(count);
	for (size_t i = 0; i < count; i++) {
		matrix[i].resize(count);
	}


	std::string adjacency_list = "std::vector< std::vector<int> > adj_pre = {";

	srand (time(NULL));

	bool firsti = true;
	for (size_t i = 0; i < count; i++) {
		if (firsti) {
			adjacency_list.append("{");
			firsti = false;
		}else{
			adjacency_list.append(",{");
		}

		bool firstj = true;
		for (size_t j = 0; j < count; j++) {



			if (rand() % max_rand + 1 <= 1 && j!=i) {

				if (firstj) {
					adjacency_list.append(std::to_string(j));
					firstj = false;
				}else{
					adjacency_list.append("," + std::to_string(j));
				}

			}
		}
		adjacency_list.append("}");
	}
	adjacency_list.append("};");

	// int percentCount = 0;
	// for (size_t i = 0; i < count; i++) {
	// 	for (size_t j = 0; j < count; j++) {
	// 		printf("%d ", matrix[i][j]);
	// 		if (matrix[i][j] == 1) {
	// 			percentCount++;
	// 		}
	// 	}
	// 	printf("\n");
 	std::cout << adjacency_list << std::endl;


	// printf("%d\n", percentCount);
	// float percent = ((float)percentCount)/((float)((count*count)-count));
	// printf("%f\n", percent);
	// printf("percent of edges: %f\n", percent);
	return 0;
}

// #include <iostream>
// #include <string>
// #include <random>
//
// int main()
// {
//   const int nrolls=10000;  // number of experiments
//   const int nstars=100;    // maximum number of stars to distribute
//
//   std::default_random_engine generator;
//   std::normal_distribution<double> distribution(5.0,2.0);
//
//   int p[10]={};
//
//   for (int i=0; i<nrolls; ++i) {
//     double number = distribution(generator);
//     if ((number>=0.0)&&(number<10.0)) ++p[int(number)];
//   }
//
//   std::cout << "normal_distribution (5.0,2.0):" << std::endl;
//
//   for (int i=0; i<10; ++i) {
//     std::cout << i << "-" << (i+1) << ": ";
//     std::cout << std::string(p[i]*nstars/nrolls,'*') << std::endl;
//   }
//
//   return 0;
// }
