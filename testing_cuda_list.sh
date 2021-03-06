# Gareth Marriott & Aiden Bull
# UVIC 2020
#
# Args: --none--

g++ -Wall -o3 create_list.cpp -o create_list -std=c++17 -march=native
nvcc bfs_cuda_list.cu
echo
echo n=1000 sparceness=100:
./create_list 1000 100 1 > 1000-100matrix.txt
./a.out 1000-100matrix.txt
rm -r 1000-100matrix.txt
echo
echo n=2000 sparceness=100:
./create_list 2000 100 1 > 2000-100matrix.txt
./a.out 2000-100matrix.txt
rm -r 2000-100matrix.txt
echo
echo 3000 sparceness=100:
./create_list 3000 100 1 > 3000-100matrix.txt
./a.out 3000-100matrix.txt
rm -r 3000-100matrix.txt
echo
echo 4000 sparceness=100:
./create_list 4000 100 1 > 4000-100matrix.txt
./a.out 4000-100matrix.txt
rm -r 4000-100matrix.txt
echo
echo 5000 sparceness=100:
./create_list 5000 100 1 > 5000-100matrix.txt
./a.out 5000-100matrix.txt
rm -r 5000-100matrix.txt
echo
echo 6000 sparceness=100:
./create_list 6000 100 1 > 6000-100matrix.txt
./a.out 6000-100matrix.txt
rm -r 6000-100matrix.txt
echo
echo 7000 sparceness=100:
./create_list 7000 100 1 > 7000-100matrix.txt
./a.out 7000-100matrix.txt
rm -r 7000-100matrix.txt
echo
echo 8000 sparceness=100:
./create_list 8000 100 1 > 8000-100matrix.txt
./a.out 8000-100matrix.txt
rm -r 8000-100matrix.txt
echo
echo 9000 sparceness=100:
./create_list 9000 100 1 > 9000-100matrix.txt
./a.out 9000-100matrix.txt
rm -r 9000-100matrix.txt
echo
echo 10000 sparceness=100:
./create_list 10000 100 1 > 10000-100matrix.txt
./a.out 10000-100matrix.txt
rm -r 10000-100matrix.txt
echo
echo '---sparceness 100 done---'
echo
echo 1000 sparceness=1000:
./create_list 1000 1000 1 > 1000-1000matrix.txt
./a.out 1000-1000matrix.txt
rm -r 1000-1000matrix.txt
echo
echo 2000 sparceness=1000:
./create_list 2000 1000 1 > 2000-1000matrix.txt
./a.out 2000-1000matrix.txt
rm -r 2000-1000matrix.txt
echo
echo 3000 sparceness=1000:
./create_list 3000 1000 1 > 3000-1000matrix.txt
./a.out 3000-1000matrix.txt
rm -r 3000-1000matrix.txt
echo
echo 4000 sparceness=1000:
./create_list 4000 1000 1 > 4000-1000matrix.txt
./a.out 4000-1000matrix.txt
rm -r 4000-1000matrix.txt
echo
echo 5000 sparceness=1000:
./create_list 5000 1000 1 > 5000-1000matrix.txt
./a.out 5000-1000matrix.txt
rm -r 5000-1000matrix.txt
echo
echo 6000 sparceness=1000:
./create_list 6000 1000 1 > 6000-1000matrix.txt
./a.out 6000-1000matrix.txt
rm -r 6000-1000matrix.txt
echo
echo 7000 sparceness=1000:
./create_list 7000 1000 1 > 7000-1000matrix.txt
./a.out 7000-1000matrix.txt
rm -r 7000-1000matrix.txt
echo
echo 8000 sparceness=1000:
./create_list 8000 1000 1 > 8000-1000matrix.txt
./a.out 8000-1000matrix.txt
rm -r 8000-1000matrix.txt
echo
echo 9000 sparceness=1000:
./create_list 9000 1000 1 > 9000-1000matrix.txt
./a.out 9000-1000matrix.txt
rm -r 9000-1000matrix.txt
echo
echo 10000 sparceness=1000:
./create_list 10000 1000 1 > 10000-1000matrix.txt
./a.out 10000-1000matrix.txt
rm -r 10000-1000matrix.txt
echo
echo 20000 sparceness=1000:
./create_list 20000 1000 1 > 20000-1000matrix.txt
./a.out 20000-1000matrix.txt
rm -r 20000-1000matrix.txt
echo
echo 30000 sparceness=1000:
./create_list 30000 1000 1 > 30000-1000matrix.txt
./a.out 30000-1000matrix.txt
rm -r 30000-1000matrix.txt
echo
echo 40000 sparceness=1000:
./create_list 40000 1000 1 > 40000-1000matrix.txt
./a.out 40000-1000matrix.txt
rm -r 40000-1000matrix.txt
