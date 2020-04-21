for i in "$*"
do
   echo $i
done
g++ -Wall -o3 $3.cpp -o create_matrix -std=c++17 -march=native
g++ -Wall -o3 $1.cpp -o $1 -fopenmp -std=c++17 -march=native
echo 1000-100:
./create_matrix 1000 100 1 > 1000-100matrix.txt
./$1 1000-100matrix.txt $2
rm -r 1000-100matrix.txt
echo 2000-100:
./create_matrix 2000 100 1 > 2000-100matrix.txt
./$1 2000-100matrix.txt $2
rm -r 2000-100matrix.txt
echo 3000-100:
./create_matrix 3000 100 1 > 3000-100matrix.txt
./$1 3000-100matrix.txt $2
rm -r 3000-100matrix.txt
echo 4000-100:
./create_matrix 4000 100 1 > 4000-100matrix.txt
./$1 4000-100matrix.txt $2
rm -r 4000-100matrix.txt
echo 5000-100:
./create_matrix 5000 100 1 > 5000-100matrix.txt
./$1 5000-100matrix.txt $2
rm -r 5000-100matrix.txt
echo 6000-100:
./create_matrix 6000 100 1 > 6000-100matrix.txt
./$1 6000-100matrix.txt $2
rm -r 6000-100matrix.txt
echo 7000-100:
./create_matrix 7000 100 1 > 7000-100matrix.txt
./$1 7000-100matrix.txt $2
rm -r 7000-100matrix.txt
echo 8000-100:
./create_matrix 8000 100 1 > 8000-100matrix.txt
./$1 8000-100matrix.txt $2
rm -r 8000-100matrix.txt
echo 9000-100:
./create_matrix 9000 100 1 > 9000-100matrix.txt
./$1 9000-100matrix.txt $2
rm -r 9000-100matrix.txt
echo '---sparceness 100 done---'
echo 5000-1000:
./create_matrix 5000 1000 1 > 5000-1000matrix.txt
./$1 5000-1000matrix.txt $2
rm -r 5000-1000matrix.txt
echo 6000-1000:
./create_matrix 6000 1000 1 > 6000-1000matrix.txt
./$1 6000-1000matrix.txt $2
rm -r 6000-1000matrix.txt
echo 7000-1000:
./create_matrix 7000 1000 1 > 7000-1000matrix.txt
./$1 7000-1000matrix.txt $2
rm -r 7000-1000matrix.txt
echo 8000-1000:
./create_matrix 8000 1000 1 > 8000-1000matrix.txt
./$1 8000-1000matrix.txt $2
rm -r 8000-1000matrix.txt
echo 9000-1000:
./create_matrix 9000 1000 1 > 9000-1000matrix.txt
./$1 9000-1000matrix.txt $2
rm -r 9000-1000matrix.txt
echo 10000-1000:
./create_matrix 10000 1000 1 > 10000-1000matrix.txt
./$1 10000-1000matrix.txt $2
rm -r 10000-1000matrix.txt
echo 20000-1000:
./create_matrix 20000 1000 1 > 20000-1000matrix.txt
./$1 20000-1000matrix.txt $2
rm -r 20000-1000matrix.txt
echo 30000-1000:
./create_matrix 30000 1000 1 > 30000-1000matrix.txt
./$1 30000-1000matrix.txt $2
rm -r 30000-1000matrix.txt
echo 40000-1000:
./create_matrix 40000 1000 1 > 40000-1000matrix.txt
./$1 40000-1000matrix.txt $2
rm -r 40000-1000matrix.txt
