for i in "$*"
do
   echo $i
done
g++ -Wall -o3 create_matrix.cpp -o create_matrix -std=c++17 -march=native
./create_matrix 10000 1000 1 > test_header.hpp
g++ -Wall -o3 $1.cpp -o $1 -std=c++17 -fopenmp -march=native
echo compiled
perf stat -d -d -d ./$1
echo 10000 1000
./create_matrix 10000 100 1 > test_header.hpp
g++ -Wall -o3 $1.cpp -o $1 -std=c++17 -fopenmp -march=native
echo compiled
perf stat -d -d -d ./$1
echo 10000 100
./create_matrix 20000 1000 1 > test_header.hpp
g++ -Wall -o3 $1.cpp -o $1 -std=c++17 -fopenmp -march=native
echo compiled
perf stat -d -d -d ./$1
echo 20000 1000
./create_matrix 20000 100 1 > test_header.hpp
g++ -Wall -o3 $1.cpp -o $1 -std=c++17 -fopenmp -march=native
echo compiled
perf stat -d -d -d ./$1
echo 20000 100
./create_matrix 30000 1000 1 > test_header.hpp
g++ -Wall -o3 $1.cpp -o $1 -std=c++17 -fopenmp -march=native
echo compiled
perf stat -d -d -d ./$1
echo 30000 1000
./create_matrix 30000 100 1 > test_header.hpp
g++ -Wall -o3 $1.cpp -o $1 -std=c++17 -fopenmp -march=native
echo compiled
perf stat -d -d -d ./$1
echo 30000 100
./create_matrix 40000 1000 1 > test_header.hpp
g++ -Wall -o3 $1.cpp -o $1 -std=c++17 -fopenmp -march=native
echo compiled
perf stat -d -d -d ./$1
echo 40000 1000
./create_matrix 40000 100 1 > test_header.hpp
g++ -Wall -o3 $1.cpp -o $1 -std=c++17 -fopenmp -march=native
echo compiled
perf stat -d -d -d ./$1
echo 40000 100
./create_matrix 50000 1000 1 > test_header.hpp
g++ -Wall -o3 $1.cpp -o $1 -std=c++17 -fopenmp -march=native
echo compiled
perf stat -d -d -d ./$1
echo 50000 1000
./create_matrix 50000 100 1 > test_header.hpp
g++ -Wall -o3 $1.cpp -o $1 -std=c++17 -fopenmp -march=native
echo compiled
perf stat -d -d -d ./$1
echo 50000 100
