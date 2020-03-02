#include <stdlib.h>
#include <iterator>
#include <stdio.h>
#include <iostream>
#include <sstream>      // std::stringstream, std::stringbuf
#include <vector>
#include <string>

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



/*
string curr_row;

ifstream f(filename);

std::getline(f, curr_row);
n = stoi(curr_row);

//adjacency.resize(n);
adjacency_list.resize(n);
distance.resize(n);
path.resize(n);
discovered.resize(n);

for(int i=0; getline(f, curr_row); i++){
		// if (i%10 == 0) {
		//   printf("%d\n", i);
		// }
		std::stringstream ss(curr_row);
		int j=0;
		while(getline(ss, curr_row, ' ')){
				if(stoi(curr_row) > 0){
						adjacency_list[i].push_back(j);
				}
				//adjacency[i].push_back(stoi(curr_row));
				path[i].push_back(-1);
				distance[i].push_back(-1);
				discovered[i].push_back(false);
				j++;
		}
}

for(int i=0; i<n; i++){
		path[i][i] = i;
		distance[i][i] = 0;
		discovered[i][i] = true;
}




 * Parallel method to calculate outlier points, i.e., those that lie at least a
 * distance of _r_ from any other point in the dataset.
 * E.g., given points {<2,1>, <1,2>, <2,2>, <5,5>, <1,6>} and a range of 1
 * returns {<5,5>, <1,6>}.


#include <iostream>  // std::cout, std::endl;
#include <algorithm> // std::copy_if()
#include <chrono>    // timing libraries
#include <omp.h>     // OpenMP header for parallelisation

#include <vector>

#include "point.hpp" // point< T > struct and associated functions


namespace { // anonymous

using coord = uint32_t;
using point_set = std::vector< point< coord > >;
using flag_set = std::vector< bool >;

// statically-defined pre-built random, uniformly-distributed dataset with independent dimensions
#include "point-data.hpp"



* Returns the subset of points that are not in the exclude_list. Sequential method.

point_set copy_if_false( flag_set const& exclude_list, point_set const& points )
{
    assert( "list lengths match" && exclude_list.size() == points.size() );

    point_set result;
    result.reserve( points.size() );

    // This should look familiar from Tuesday's (16-lockfree) lecture!
    for( auto i = 0lu, n = exclude_list.size(); i < n; ++i )
    {
        if( ! exclude_list[ i ] )
        {
            result.push_back( points[ i ] );
        }
    }

    return result;
}



* Determines in parallel which input_points are *not isolated*, given a threshold range for proximity.
* @return A flag_set indicating for each point whether or not it is non-isolated
*
* Quadratic complexity!

flag_set find_non_isolated_points( point_set input_points
                                 , coord const range )
{
    // The overall algorithmic strategy is to compare every point to every other point
    // exactly once. We maintain a set of boolean flags that indicate if a point is
    // within a range of another point; whenever two points p and q are determined
    // to be within range of each other, we set the flag for both of them.
    // At the end, the flags are set for those and only those points in range of some
    // other point.
    // This algorithm parallelises relatively well (subject to some questions of workload
    // balance), and has sequential access patterns, but it incurs a lot of work, i.e.,
    // the number of instructions is high.
    // If there is an algorithm that can compute the response in substantially (or even
    // asymptotically) fewer instructions, then we would call this algorithm *work-inefficient*.
    //
    // TODO: Can we develop a more work-efficient algorithm? I.e., one that does not do
    // n(n-1)/2 comparisons?

    flag_set in_range( input_points.size(), false );
    auto const n = input_points.size();

    // Here we use very coarse-grained parallelism. I.e., each thread gets n/t values of
    // i and then runs the entire inner loop. Because the iteration strategy is triangular
    // (i.e., j starts at i + 1), this will likely lead to poor workload balance.
    // Parallelising the inner loop instead would produce much finer-grained parallelism
    // with all parallel tasks of equal size, but there would be more overhead to assigning
    // tasks n times.
    // For a compromise, we can use the `schedule` keyword. A *static* parallelisation assigns
    // all work evenly at compile-time. This *dynamic* schedule creates work batches of 64
    // iterations. When a thread completes its current batch of 64, it grabs the next incomplete
    // batch; i.e., the work distribution self-balances. However, the cost is the dynamic
    // allocation of work; thus the compromise which often requires tuning.
    #pragma omp parallel for schedule( dynamic, 64 )
    for( auto i = 0lu; i < n; ++i )
    {
        // Note: on average, we compare every point to half the dataset!
        // TODO: How can we improve this? (Consider the sort)
        for ( auto j = i + 1; j < n; ++j )
        {
            if( within_range( input_points[ i ], input_points[ j ], range ) )
            {
                // Observe that in_range[ j ] looks like a race condition, as multiple
                // threads may write to the same address.
                // This is an example of a "safe" race, because they are writing a literal,
                // not a value that depends on the current value at the address (i.e., there
                // is no read, only write) *and* all threads would be writing the exact same
                // value.
                // I.e., no matter what order the threads access this, the result will be
                // the same.
                // This is a great example of how data-level parallelism can be exposed when
                // it *appears* that there is a contention.
                in_range[ i ] = true;
                in_range[ j ] = true;
            }
        }
    }

    return in_range;
}



Returns the subset of input_points that are not within range of any other input_points


point_set find_anomalies( point_set input_points
                        , coord const range )
{
	// sort data by distance to origin so that spatially near points
    // are physically near in array.
    // TODO: Question to class: How to take advantage of this?? ðŸ¤”
	std::sort( std::begin( input_points )
             , std::end  ( input_points )
             , sort_by_l2_to_O{} );

    return copy_if_false( find_non_isolated_points( input_points, range )
                        , input_points );
}


} // namespace anonymous



int main()
{
	auto sum = 0llu;
    auto const num_trials = 2000u;
    auto const threshold = 100u;

    auto const start_time = std::chrono::system_clock::now();

	for( auto i = 0u; i < num_trials; ++i )
    {
        // Just add up result sizes so that something is done with the output
		sum += find_anomalies( input_data, threshold ).size();
    }

    auto const end_time = std::chrono::system_clock::now();
    auto const elapsed_time = std::chrono::duration_cast<std::chrono::microseconds>( end_time - start_time );

	std::cout << "answer: " << ( sum  / static_cast< float >( num_trials ) ) << std::endl;
	std::cout << "time: " << ( elapsed_time.count() / static_cast< float >( num_trials ) ) << " us" << std::endl;
	return 0;
}

*/
