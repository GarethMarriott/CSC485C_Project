for i in "$*"
do
   echo $i
done
g++ -Wall -o3 create_adj_norm_dist.cpp -o create_matrix -std=c++17 -march=native
g++ -Wall -o3 $1.cpp -o $1 -fopenmp -std=c++17 -march=native
echo 1000:
./create_matrix 1000 $3 $4 > 1000matrix.txt
./$1 1000matrix.txt $2
rm -r 1000matrix.txt
echo 2000:
./create_matrix 2000 $3 $4 > 2000matrix.txt
./$1 2000matrix.txt $2
rm -r 2000matrix.txt
echo 3000:
./create_matrix 3000 $3 $4 > 3000matrix.txt
./$1 3000matrix.txt $2
rm -r 3000matrix.txt
echo 4000:
./create_matrix 4000 $3 $4 > 4000matrix.txt
./$1 4000matrix.txt $2
rm -r 4000matrix.txt
echo 5000:
./create_matrix 5000 $3 $4 > 5000matrix.txt
./$1 5000matrix.txt $2
rm -r 5000matrix.txt
echo 6000:
./create_matrix 6000 $3 $4 > 6000matrix.txt
./$1 6000matrix.txt $2
rm -r 6000matrix.txt
echo 7000:
./create_matrix 7000 $3 $4 > 7000matrix.txt
./$1 7000matrix.txt $2
rm -r 7000matrix.txt
echo 8000:
./create_matrix 8000 $3 $4 > 8000matrix.txt
./$1 8000matrix.txt $2
rm -r 8000matrix.txt
echo 9000:
./create_matrix 9000 $3 $4 > 9000matrix.txt
./$1 9000matrix.txt $2
rm -r 9000matrix.txt
echo 10000:
./create_matrix 10000 $3 $4 > 10000matrix.txt
./$1 10000matrix.txt $2
rm -r 10000matrix.txt
echo 20000:
./create_matrix 20000 $3 $4 > 20000matrix.txt
./$1 20000matrix.txt $2
rm -r 20000matrix.txt
echo 30000:
./create_matrix 30000 $3 $4 > 30000matrix.txt
./$1 30000matrix.txt $2
rm -r 30000matrix.txt
echo 40000:
./create_matrix 40000 $3 $4 > 40000matrix.txt
./$1 40000matrix.txt $2
rm -r 40000matrix.txt
