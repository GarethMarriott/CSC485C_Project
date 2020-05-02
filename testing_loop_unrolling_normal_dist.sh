# Gareth Marriott & Aiden Bull
# UVIC 2020
# Determines the number of directed edges outwards for each node by a normal
# distribution with Mean and SD provided as args
#
# Args: <Mean> <SD> <Number of Cores>

if [ "$#" -ne 3 ]; then
  echo "Usage: sh testing_loop_unrolling_normal_dist.sh <Mean> <SD> <Number of Cores>" >&2
  exit 1
fi
g++ -Wall -o3 create_list_normal_dist.cpp -o create_list -std=c++17 -march=native
g++ -Wall -o3 bfs_loop_unrolling_list.cpp -o bfs -fopenmp -std=c++17 -march=native
echo n=1000:
./create_list 1000 $1 $2 > 1000matrix.txt
./bfs 1000matrix.txt $3
rm -r 1000matrix.txt
echo n=2000:
./create_list 2000 $1 $2 > 2000matrix.txt
./bfs 2000matrix.txt $3
rm -r 2000matrix.txt
echo n=3000:
./create_list 3000 $1 $2 > 3000matrix.txt
./bfs 3000matrix.txt $3
rm -r 3000matrix.txt
echo n=4000:
./create_list 4000 $1 $2 > 4000matrix.txt
./bfs 4000matrix.txt $3
rm -r 4000matrix.txt
echo n=5000:
./create_list 5000 $1 $2 > 5000matrix.txt
./bfs 5000matrix.txt $3
rm -r 5000matrix.txt
echo n=6000:
./create_list 6000 $1 $2 > 6000matrix.txt
./bfs 6000matrix.txt $3
rm -r 6000matrix.txt
echo n=7000:
./create_list 7000 $1 $2 > 7000matrix.txt
./bfs 7000matrix.txt $3
rm -r 7000matrix.txt
echo n=8000:
./create_list 8000 $1 $2 > 8000matrix.txt
./bfs 8000matrix.txt $3
rm -r 8000matrix.txt
echo n=9000:
./create_list 9000 $1 $2 > 9000matrix.txt
./bfs 9000matrix.txt $3
rm -r 9000matrix.txt
echo n=10000:
./create_list 10000 $1 $2 > 10000matrix.txt
./bfs 10000matrix.txt $3
rm -r 10000matrix.txt
echo n=20000:
./create_list 20000 $1 $2 > 20000matrix.txt
./bfs 20000matrix.txt $3
rm -r 20000matrix.txt
echo n=30000:
./create_list 30000 $1 $2 > 30000matrix.txt
./bfs 30000matrix.txt $3
rm -r 30000matrix.txt
echo n=40000:
./create_list 40000 $1 $2 > 40000matrix.txt
./bfs 40000matrix.txt $3
rm -r 40000matrix.txt
echo n=50000:
./create_list 50000 $1 $2 > 50000matrix.txt
./bfs 50000matrix.txt $3
rm -r 50000matrix.txt
echo n=60000:
./create_list 60000 $1 $2 > 60000matrix.txt
./bfs 60000matrix.txt $3
rm -r 60000matrix.txt
echo n=70000:
./create_list 70000 $1 $2 > 70000matrix.txt
./bfs 70000matrix.txt $3
rm -r 70000matrix.txt
echo n=80000:
./create_list 80000 $1 $2 > 80000matrix.txt
./bfs 80000matrix.txt $3
rm -r 80000matrix.txt
echo n=90000:
./create_list 90000 $1 $2 > 90000matrix.txt
./bfs 90000matrix.txt $3
rm -r 90000matrix.txt
echo n=100000:
./create_list 100000 $1 $2 > 100000matrix.txt
./bfs 100000matrix.txt $3
rm -r 100000matrix.txt
