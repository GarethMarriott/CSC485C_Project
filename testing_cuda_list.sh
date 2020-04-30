for i in "$*"
do
   echo $i
done
g++ -Wall -o3 create_matrix_scalable.cpp -o create_matrix_scalable -std=c++17 -march=native
nvcc $1
echo 1000-100:
./create_matrix_scalable 1000 100 1 > 1000-100adj.txt
./a.out 1000-100adj.txt
rm -r 1000-100adj.txt
echo 2000-100:
./create_matrix_scalable 2000 100 1 > 2000-100adj.txt
./a.out 2000-100adj.txt
rm -r 2000-100adj.txt
echo 3000-100:
./create_matrix_scalable 3000 100 1 > 3000-100adj.txt
./a.out 3000-100adj.txt
rm -r 3000-100adj.txt
echo 4000-100:
./create_matrix_scalable 4000 100 1 > 4000-100adj.txt
./a.out 4000-100adj.txt
rm -r 4000-100adj.txt
echo 5000-100:
./create_matrix_scalable 5000 100 1 > 5000-100adj.txt
./a.out 5000-100adj.txt
rm -r 5000-100adj.txt
echo 6000-100:
./create_matrix_scalable 6000 100 1 > 6000-100adj.txt
./a.out 6000-100adj.txt
rm -r 6000-100adj.txt
echo 7000-100:
./create_matrix_scalable 7000 100 1 > 7000-100adj.txt
./a.out 7000-100adj.txt
rm -r 7000-100adj.txt
echo 8000-100:
./create_matrix_scalable 8000 100 1 > 8000-100adj.txt
./a.out 8000-100adj.txt
rm -r 8000-100adj.txt
echo 9000-100:
./create_matrix_scalable 9000 100 1 > 9000-100adj.txt
./a.out 9000-100adj.txt
rm -r 9000-100adj.txt
echo 10000-100:
./create_matrix_scalable 10000 100 1 > 10000-100adj.txt
./a.out 10000-100adj.txt
rm -r 10000-100adj.txt
echo 20000-100:
./create_matrix_scalable 20000 100 1 > 20000-100adj.txt
./a.out 20000-100adj.txt
rm -r 20000-100adj.txt
echo 30000-100:
./create_matrix_scalable 30000 100 1 > 30000-100adj.txt
./a.out 30000-100adj.txt
rm -r 30000-100adj.txt
echo '---sparceness 100 done---'
echo 1000-1000:
./create_matrix_scalable 1000 1000 1 > 1000-1000adj.txt
./a.out 1000-1000adj.txt
rm -r 1000-1000adj.txt
echo 2000-1000:
./create_matrix_scalable 2000 1000 1 > 2000-1000adj.txt
./a.out 2000-1000adj.txt
rm -r 2000-1000adj.txt
echo 3000-1000:
./create_matrix_scalable 3000 1000 1 > 3000-1000adj.txt
./a.out 3000-1000adj.txt
rm -r 3000-1000adj.txt
echo 4000-1000:
./create_matrix_scalable 4000 1000 1 > 4000-1000adj.txt
./a.out 4000-1000adj.txt
rm -r 4000-1000adj.txt
echo 5000-1000:
./create_matrix_scalable 5000 1000 1 > 5000-1000adj.txt
./a.out 5000-1000adj.txt
rm -r 5000-1000adj.txt
echo 6000-1000:
./create_matrix_scalable 6000 1000 1 > 6000-1000adj.txt
./a.out 6000-1000adj.txt
rm -r 6000-1000adj.txt
echo 7000-1000:
./create_matrix_scalable 7000 1000 1 > 7000-1000adj.txt
./a.out 7000-1000adj.txt
rm -r 7000-1000adj.txt
echo 8000-1000:
./create_matrix_scalable 8000 1000 1 > 8000-1000adj.txt
./a.out 8000-1000adj.txt
rm -r 8000-1000adj.txt
echo 9000-1000:
./create_matrix_scalable 9000 1000 1 > 9000-1000adj.txt
./a.out 9000-1000adj.txt
rm -r 9000-1000adj.txt
echo 10000-1000:
./create_matrix_scalable 10000 1000 1 > 10000-1000adj.txt
./a.out 10000-1000adj.txt
rm -r 10000-1000adj.txt
echo 20000-1000:
./create_matrix_scalable 20000 1000 1 > 20000-1000adj.txt
./a.out 20000-1000adj.txt
rm -r 20000-1000adj.txt
echo 30000-1000:
./create_matrix_scalable 30000 1000 1 > 30000-1000adj.txt
./a.out 30000-1000adj.txt
rm -r 30000-1000adj.txt
echo 40000-1000:
./create_matrix_scalable 40000 1000 1 > 40000-1000adj.txt
./a.out 40000-1000adj.txt
rm -r 40000-1000adj.txt
