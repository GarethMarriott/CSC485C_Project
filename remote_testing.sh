create_matrix_txtfor i in "$*"
do
   echo $i
done
g++ -Wall -o3 create_matrix_txt.cpp -o create_matrix_txt -std=c++17 -march=native
g++ -Wall -o3 $1.cpp -o $1 -std=c++17 -march=native
./create_matrix_txt 5000 100 1 > 5000-100matrix.txt
./$1 5000-100matrix.txt $2
rm -r 5000-100matrix.txt
./create_matrix_txt 6000 100 1 > 6000-100matrix.txt
./$1 5000-100matrix.txt $2
rm -r 5000-100matrix.txt
./create_matrix_txt 7000 100 1 > 7000-100matrix.txt
./$1 5000-100matrix.txt $2
rm -r 5000-100matrix.txt
./create_matrix_txt 8000 100 1 > 8000-100matrix.txt
./$1 5000-100matrix.txt $2
rm -r 5000-100matrix.txt
./create_matrix_txt 9000 100 1 > 9000-100matrix.txt
./$1 5000-100matrix.txt $2
rm -r 5000-100matrix.txt
echo '---sparceness 100 done---'
./create_matrix_txt 5000 1000 1 > 5000-1000matrix.txt
./$1 5000-100matrix.txt $2
rm -r 5000-100matrix.txt
./create_matrix_txt 6000 1000 1 > 6000-1000matrix.txt
./$1 5000-100matrix.txt $2
rm -r 5000-100matrix.txt
./create_matrix_txt 7000 1000 1 > 7000-1000matrix.txt
./create_matrix_txt 8000 1000 1 > 8000-1000matrix.txt
./create_matrix_txt 9000 1000 1 > 9000-1000matrix.txt
./create_matrix_txt 10000 1000 1 > 10000-1000matrix.txt
./create_matrix_txt 20000 1000 1 > 20000-1000matrix.txt
./create_matrix_txt 30000 1000 1 > 30000-1000matrix.txt
./create_matrix_txt 40000 1000 1 > 40000-1000matrix.txt
./create_matrix_txt 50000 1000 1 > 50000-1000matrix.txt
