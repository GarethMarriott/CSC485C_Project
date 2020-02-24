for i in "$*"
do
   echo $i
done
g++ -Wall -o3 create_matrix.cpp -o create_matrix -std=c++17 -march=native
g++ -Wall -o3 $1.cpp -o $1 -std=c++17 -march=native
./create_matrix 5000 100 1 > 5000-100matrix.txt
chmod 777 5000-100matrix.txt
./create_matrix 6000 100 1 > 6000-100matrix.txt
chmod 777 6000-100matrix.txt
./create_matrix 7000 100 1 > 7000-100matrix.txt
chmod 777 7000-100matrix.txt
./create_matrix 8000 100 1 > 8000-100matrix.txt
chmod 777 8000-100matrix.txt
./create_matrix 9000 100 1 > 9000-100matrix.txt
chmod 777 9000-100matrix.txt
./create_matrix 10000 100 1 > 10000-100matrix.txt
chmod 777 10000-100matrix.txt
./create_matrix 20000 100 1 > 20000-100matrix.txt
chmod 777 20000-100matrix.txt
./create_matrix 30000 100 1 > 30000-100matrix.txt
chmod 777 30000-100matrix.txt
./create_matrix 40000 100 1 > 40000-100matrix.txt
chmod 777 40000-100matrix.txt
./create_matrix 50000 100 1 > 50000-100matrix.txt
chmod 777 50000-100matrix.txt
perf stat -d ./$1 5000-100matrix.txt
echo 5000-100 done
perf stat -d ./$1 6000-100matrix.txt
echo 6000-100 done
perf stat -d ./$1 7000-100matrix.txt
echo 7000-100 done
perf stat -d ./$1 8000-100matrix.txt
echo 8000-100 done
perf stat -d ./$1 9000-100matrix.txt
echo 9000-100 done
perf stat -d ./$1 10000-100matrix.txt
echo 10000-100 done
perf stat -d ./$1 20000-100matrix.txt
echo 20000-100 done
perf stat -d ./$1 30000-100matrix.txt
echo 30000-100 done
perf stat -d ./$1 40000-100matrix.txt
echo 40000-100 done
perf stat -d ./$1 50000-100matrix.txt
echo 50000-100 done
