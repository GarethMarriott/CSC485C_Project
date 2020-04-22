#include <stdlib.h>
#include <iterator>
#include <stdio.h>
#include <iostream>
#include <sstream>      // std::stringstream, std::stringbuf
#include <vector>
#include <random>
#include <list>
#include <algorithm>

//USAGE: ./createMatrix <width/height of matrix> <mean> <SD>

// sparceness factor: percent chance a edge will be between any two nodes (1/sparceness)

int main(int argc, char const *argv[]) {
	if (argc != 4){
		std::cout << "INVALID ARGS - USAGE: ./create_matrix <width/height of matrix> <sparceness factor> <1 or 2 ( 1=baseline 2=current )>" << std::endl;
		return 0;
	}
	srand (time(NULL));

	std::stringstream s;
	s << argv[1];
	int size;
	s >> size;
	std::cout << size << std::endl;

	s.clear();
	s << argv[2];
	int mean;
	s >> mean;
	// std::cout << mean << std::endl;

	s.clear();
	s << argv[3];
	int deviation;
	s >> deviation;
	// std::cout << deviation << std::endl;

	// printf("-----\n");

	// random device class instance, source of 'true' randomness for initializing random seed
  std::random_device rd;

  // Mersenne twister PRNG, initialized with seed from previous random device instance
  std::mt19937 gen(rd());

	std::normal_distribution<double> distribution(mean,deviation);

	std::list<int> numOfEdges;

	for (int i = 0; i < size; i++) {
		int number = 0;
		while (number < 1 && number < size-5) {
			number = std::round(distribution(gen));
			// printf("%d\n", number);
		}
		numOfEdges.push_back(number);

		std::list<int> adjacent_numbers;

		for (int j = 0; j < number; j++) {
			int edgeTo = rand() % size;
			bool found = (std::find(adjacent_numbers.begin(), adjacent_numbers.end(), edgeTo) != adjacent_numbers.end());
			if (found && edgeTo > 0 && edgeTo != i) {
				j--;
			}else{
				adjacent_numbers.push_back(edgeTo);
			}
		}

		adjacent_numbers.unique();
		adjacent_numbers.sort();

		// for (size_t num = 0; num < adjacent_numbers.size(); num++) {
		// 	printf("%d ", adjacent_numbers[num]);
		// }
		// printf("\n");
		for (auto it=adjacent_numbers.begin(); it!=adjacent_numbers.end(); ++it){
    	std::cout << *it << ' ';
		}
		std::cout << '\n';

	}
	// printf("avg: %f\n", (std::accumulate(numOfEdges.begin(), numOfEdges.end(), 0.0) / numOfEdges.size()));
	return 0;
}


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
