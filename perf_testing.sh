for i in "$*"
do
   echo $i
done
g++ -Wall -o3 create_matrix.cpp -o create_matrix -std=c++17 -march=native
g++ -Wall -o3 $1.cpp -o $1 -std=c++17 -march=native
./create_matrix 1000 2 1 > 1000-2matrix.txt
chmod 777 1000-2matrix.txt
./create_matrix 1000 4 1 > 1000-4matrix.txt
chmod 777 1000-4matrix.txt
./create_matrix 1000 10 1 > 1000-10matrix.txt
chmod 777 1000-10matrix.txt
./create_matrix 1000 100 1 > 1000-100matrix.txt
chmod 777 1000-100matrix.txt
./create_matrix 2000 2 1 > 2000-2matrix.txt
chmod 777 2000-2matrix.txt
./create_matrix 2000 4 1 > 2000-4matrix.txt
chmod 777 2000-4matrix.txt
./create_matrix 2000 10 1 > 2000-10matrix.txt
chmod 777 2000-10matrix.txt
./create_matrix 2000 100 1 > 2000-100matrix.txt
chmod 777 2000-100matrix.txt
./create_matrix 3000 2 1 > 3000-2matrix.txt
chmod 777 3000-2matrix.txt
./create_matrix 3000 4 1 > 3000-4matrix.txt
chmod 777 3000-4matrix.txt
./create_matrix 3000 10 1 > 3000-10matrix.txt
chmod 777 3000-10matrix.txt
./create_matrix 3000 100 1 > 3000-100matrix.txt
chmod 777 3000-100matrix.txt
./create_matrix 4000 2 1 > 4000-2matrix.txt
chmod 777 4000-2matrix.txt
./create_matrix 4000 4 1 > 4000-4matrix.txt
chmod 777 4000-4matrix.txt
./create_matrix 4000 10 1 > 4000-10matrix.txt
chmod 777 4000-10matrix.txt
./create_matrix 4000 100 1 > 4000-100matrix.txt
chmod 777 4000-100matrix.txt
perf stat -d ./$1 1000-100matrix.txt
echo 1000-100 done
perf stat -d ./$1 1000-10matrix.txt
echo 1000-10 done
perf stat -d ./$1 1000-4matrix.txt
echo 1000-4 done
perf stat -d ./$1 1000-2matrix.txt
echo 1000-2 done
perf stat -d ./$1 2000-100matrix.txt
echo 2000-100 done
perf stat -d ./$1 2000-10matrix.txt
echo 2000-10 done
perf stat -d ./$1 2000-4matrix.txt
echo 2000-4 done
perf stat -d ./$1 2000-2matrix.txt
echo 2000-2 done
perf stat -d ./$1 3000-100matrix.txt
echo 3000-100 done
perf stat -d ./$1 3000-10matrix.txt
echo 3000-10 done
perf stat -d ./$1 3000-4matrix.txt
echo 3000-4 done
perf stat -d ./$1 3000-2matrix.txt
echo 3000-2 done
perf stat -d ./$1 4000-100matrix.txt
echo 4000-100 done
perf stat -d ./$1 4000-10matrix.txt
echo 4000-10 done
perf stat -d ./$1 4000-4matrix.txt
echo 4000-4 done
perf stat -d ./$1 4000-2matrix.txt
echo 4000-2 done
