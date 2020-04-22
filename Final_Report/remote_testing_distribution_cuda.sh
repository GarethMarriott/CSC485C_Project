for i in "$*"
do
   echo $i
done
g++ -Wall -o3 create_adj_norm_dist.cpp -o create_matrix -std=c++17 -march=native
nvcc $1
echo 1000:
./create_matrix 1000 $3 $4 > 1000matrix.txt
./a.out 1000matrix.txt
rm -r 1000matrix.txt
echo 2000:
./create_matrix 2000 $3 $4 > 2000matrix.txt
./a.out 2000matrix.txt
rm -r 2000matrix.txt
echo 3000:
./create_matrix 3000 $3 $4 > 3000matrix.txt
./a.out 3000matrix.txt
rm -r 3000matrix.txt
echo 4000:
./create_matrix 4000 $3 $4 > 4000matrix.txt
./a.out 4000matrix.txt
rm -r 4000matrix.txt
echo 5000:
./create_matrix 5000 $3 $4 > 5000matrix.txt
./a.out 5000matrix.txt
rm -r 5000matrix.txt
echo 6000:
./create_matrix 6000 $3 $4 > 6000matrix.txt
./a.out 6000matrix.txt
rm -r 6000matrix.txt
echo 7000:
./create_matrix 7000 $3 $4 > 7000matrix.txt
./a.out 7000matrix.txt
rm -r 7000matrix.txt
echo 8000:
./create_matrix 8000 $3 $4 > 8000matrix.txt
./a.out 8000matrix.txt
rm -r 8000matrix.txt
echo 9000:
./create_matrix 9000 $3 $4 > 9000matrix.txt
./a.out 9000matrix.txt
rm -r 9000matrix.txt
echo 10000:
./create_matrix 10000 $3 $4 > 10000matrix.txt
./a.out 10000matrix.txt
rm -r 10000matrix.txt
echo 20000:
./create_matrix 20000 $3 $4 > 20000matrix.txt
./a.out 20000matrix.txt
rm -r 20000matrix.txt
echo 30000:
./create_matrix 30000 $3 $4 > 30000matrix.txt
./a.out 30000matrix.txt
rm -r 30000matrix.txt
echo 40000:
./create_matrix 40000 $3 $4 > 40000matrix.txt
./a.out 40000matrix.txt
rm -r 40000matrix.txt
echo 50000:
./create_matrix 50000 $3 $4 > 50000matrix.txt
./a.out 50000matrix.txt
rm -r 50000matrix.txt
echo 60000:
./create_matrix 60000 $3 $4 > 60000matrix.txt
./a.out 60000matrix.txt
rm -r 60000matrix.txt
echo 70000:
./create_matrix 70000 $3 $4 > 70000matrix.txt
./a.out 70000matrix.txt
rm -r 70000matrix.txt
echo 80000:
./create_matrix 80000 $3 $4 > 80000matrix.txt
./a.out 80000matrix.txt
rm -r 80000matrix.txt
echo 90000:
./create_matrix 90000 $3 $4 > 90000matrix.txt
./a.out 90000matrix.txt
rm -r 90000matrix.txt
echo 100000:
./create_matrix 100000 $3 $4 > 100000matrix.txt
./a.out 100000matrix.txt
rm -r 100000matrix.txt
