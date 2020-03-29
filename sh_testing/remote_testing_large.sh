for i in "$*"
do
   echo $i
done
g++ -Wall -o3 create_matrix_txt.cpp -o create_matrix_txt -std=c++17 -march=native
g++ -Wall -o3 $1.cpp -o $1 -fopenmp -std=c++17 -march=native
echo 50000-10000:
./create_matrix_txt 50000 10000 1 > 50000-10000matrix.txt
./$1 50000-10000matrix.txt $2
rm -r 50000-10000matrix.txt
echo 60000-10000:
./create_matrix_txt 60000 10000 1 > 60000-10000matrix.txt
./$1 60000-10000matrix.txt $2
rm -r 60000-10000matrix.txt
echo 70000-10000:
./create_matrix_txt 70000 10000 1 > 70000-10000matrix.txt
./$1 70000-10000matrix.txt $2
rm -r 70000-10000matrix.txt
echo 80000-10000:
./create_matrix_txt 80000 10000 1 > 80000-10000matrix.txt
./$1 80000-10000matrix.txt $2
rm -r 80000-10000matrix.txt
echo 90000-10000:
./create_matrix_txt 90000 10000 1 > 90000-10000matrix.txt
./$1 90000-10000matrix.txt $2
rm -r 90000-10000matrix.txt
