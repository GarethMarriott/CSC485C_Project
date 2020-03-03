for i in "$*"
do
   echo $i
done
g++ -Wall -o3 create_matrix.cpp -o create_matrix -std=c++17 -march=native
./create_matrix 1000 10 1 > test_header.hpp
g++ -Wall -o3 $1.cpp -o $1 -std=c++17 -fopenmp -march=native
perf stat -d -d -d ./$1
echo 1000 10
./create_matrix 1000 100 1 > test_header.hpp
g++ -Wall -o3 $1.cpp -o $1 -std=c++17 -fopenmp -march=native
perf stat -d -d -d ./$1
echo 1000 100
./create_matrix 2000 10 1 > test_header.hpp
g++ -Wall -o3 $1.cpp -o $1 -std=c++17 -fopenmp -march=native
perf stat -d -d -d ./$1
echo 2000 10
./create_matrix 2000 100 1 > test_header.hpp
g++ -Wall -o3 $1.cpp -o $1 -std=c++17 -fopenmp -march=native
perf stat -d -d -d ./$1
echo 2000 100
./create_matrix 3000 10 1 > test_header.hpp
g++ -Wall -o3 $1.cpp -o $1 -std=c++17 -fopenmp -march=native
perf stat -d -d -d ./$1
echo 3000 10
./create_matrix 3000 100 1 > test_header.hpp
g++ -Wall -o3 $1.cpp -o $1 -std=c++17 -fopenmp -march=native
perf stat -d -d -d ./$1
echo 3000 100
./create_matrix 4000 10 1 > test_header.hpp
g++ -Wall -o3 $1.cpp -o $1 -std=c++17 -fopenmp -march=native
perf stat -d -d -d ./$1
echo 4000 10
./create_matrix 4000 100 1 > test_header.hpp
g++ -Wall -o3 $1.cpp -o $1 -std=c++17 -fopenmp -march=native
perf stat -d -d -d ./$1
echo 4000 100
./create_matrix 5000 10 1 > test_header.hpp
g++ -Wall -o3 $1.cpp -o $1 -std=c++17 -fopenmp -march=native
perf stat -d -d -d ./$1
echo 5000 10
./create_matrix 5000 100 1 > test_header.hpp
g++ -Wall -o3 $1.cpp -o $1 -std=c++17 -fopenmp -march=native
perf stat -d -d -d ./$1
echo 5000 100
