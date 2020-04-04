for i in "$*"
do
   echo $i
done
g++ -Wall -o3 create_matrix_scalable.cpp -o create_matrix_scalable -std=c++17 -march=native
nvcc $1
echo 50000-1000:
./create_matrix_scalable 50000 1000 1 > 50000-1000adj.txt
./a.out 50000-1000adj.txt
rm -r 50000-1000adj.txt
echo 60000-1000:
./create_matrix_scalable 60000 1000 1 > 60000-1000adj.txt
./a.out 60000-1000adj.txt
rm -r 60000-1000adj.txt
echo 70000-1000:
./create_matrix_scalable 70000 1000 1 > 70000-1000adj.txt
./a.out 70000-1000adj.txt
rm -r 70000-1000adj.txt
echo 80000-1000:
./create_matrix_scalable 80000 1000 1 > 80000-1000adj.txt
./a.out 80000-1000adj.txt
rm -r 80000-1000adj.txt
echo 80000-1000:
./create_matrix_scalable 90000 1000 1 > 90000-1000adj.txt
./a.out 90000-1000adj.txt
rm -r 90000-1000adj.txt
echo 100000-1000:
./create_matrix_scalable 100000 1000 1 > 100000-1000adj.txt
./a.out 100000-1000adj.txt
rm -r 100000-1000adj.txt
