# Gareth Marriott & Aiden Bull
# UVIC 2020
#
# Args: <Mean> <SD>

if [ "$#" -ne 2 ]; then
  echo "Usage: sh testing_cuda_normal_dist.sh <Mean> <SD>" >&2
  exit 1
fi
g++ -Wall -o3 create_list_normal_dist.cpp -o create_list -std=c++17 -march=native
nvcc bfs_cuda_list.cu
echo
echo n=1000:
./create_list 1000 $1 $2 > 1000matrix.txt
./a.out 1000matrix.txt
rm -r 1000matrix.txt
echo n=2000:
./create_list 2000 $1 $2 > 2000matrix.txt
./a.out 2000matrix.txt
rm -r 2000matrix.txt
echo n=3000:
./create_list 3000 $1 $2 > 3000matrix.txt
./a.out 3000matrix.txt
rm -r 3000matrix.txt
echo n=4000:
./create_list 4000 $1 $2 > 4000matrix.txt
./a.out 4000matrix.txt
rm -r 4000matrix.txt
echo n=5000:
./create_list 5000 $1 $2 > 5000matrix.txt
./a.out 5000matrix.txt
rm -r 5000matrix.txt
echo n=6000:
./create_list 6000 $1 $2 > 6000matrix.txt
./a.out 6000matrix.txt
rm -r 6000matrix.txt
echo n=7000:
./create_list 7000 $1 $2 > 7000matrix.txt
./a.out 7000matrix.txt
rm -r 7000matrix.txt
echo n=8000:
./create_list 8000 $1 $2 > 8000matrix.txt
./a.out 8000matrix.txt
rm -r 8000matrix.txt
echo n=9000:
./create_list 9000 $1 $2 > 9000matrix.txt
./a.out 9000matrix.txt
rm -r 9000matrix.txt
echo n=10000:
./create_list 10000 $1 $2 > 10000matrix.txt
./a.out 10000matrix.txt
rm -r 10000matrix.txt
echo n=20000:
./create_list 20000 $1 $2 > 20000matrix.txt
./a.out 20000matrix.txt
rm -r 20000matrix.txt
echo n=30000:
./create_list 30000 $1 $2 > 30000matrix.txt
./a.out 30000matrix.txt
rm -r 30000matrix.txt
echo n=40000:
./create_list 40000 $1 $2 > 40000matrix.txt
./a.out 40000matrix.txt
rm -r 40000matrix.txt
echo n=50000:
./create_list 50000 $1 $2 > 50000matrix.txt
./a.out 50000matrix.txt
rm -r 50000matrix.txt
echo n=60000:
./create_list 60000 $1 $2 > 60000matrix.txt
./a.out 60000matrix.txt
rm -r 60000matrix.txt
echo n=70000:
./create_list 70000 $1 $2 > 70000matrix.txt
./a.out 70000matrix.txt
rm -r 70000matrix.txt
echo n=80000:
./create_list 80000 $1 $2 > 80000matrix.txt
./a.out 80000matrix.txt
rm -r 80000matrix.txt
echo n=90000:
./create_list 90000 $1 $2 > 90000matrix.txt
./a.out 90000matrix.txt
rm -r 90000matrix.txt
echo n=100000:
./create_list 100000 $1 $2 > 100000matrix.txt
./a.out 100000matrix.txt
rm -r 100000matrix.txt
