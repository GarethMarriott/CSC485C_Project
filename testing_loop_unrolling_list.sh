# Gareth Marriott & Aiden Bull
# UVIC 2020
#
# This program uses create_list.cpp which preforms a check at each possible
# directed edge with a 1/sparceness chance of that edge existing.
# This gives the create_list list a distribution baised off of the size of the
# sample. This binomial distribution can be approximented to normal with a
# Mean of: (n/sparceness) and a SD: (n(sparceness - 1)/sparceness^2)
#
# Args: <Number of Cores>

if [ "$#" -ne 1 ]; then
  echo "Usage: sh testing_loop_unrolling_list.sh <#ofCores>" >&2
  exit 1
fi
g++ -Wall -o3 create_list.cpp -o create_list -std=c++17 -march=native
g++ -Wall -o3 bfs_loop_unrolling_list.cpp -o bfs -fopenmp -std=c++17 -march=native
echo
echo Number of Cores used $1
echo
echo n=1000 sparceness=100:
./create_list 1000 100 1 > 1000-100matrix.txt
./bfs 1000-100matrix.txt $1
rm -r 1000-100matrix.txt
echo
echo n=2000 sparceness=100:
./create_list 2000 100 1 > 2000-100matrix.txt
./bfs 2000-100matrix.txt $1
rm -r 2000-100matrix.txt
echo
echo 3000 sparceness=100:
./create_list 3000 100 1 > 3000-100matrix.txt
./bfs 3000-100matrix.txt $1
rm -r 3000-100matrix.txt
echo
echo 4000 sparceness=100:
./create_list 4000 100 1 > 4000-100matrix.txt
./bfs 4000-100matrix.txt $1
rm -r 4000-100matrix.txt
echo
echo 5000 sparceness=100:
./create_list 5000 100 1 > 5000-100matrix.txt
./bfs 5000-100matrix.txt $1
rm -r 5000-100matrix.txt
echo
echo 6000 sparceness=100:
./create_list 6000 100 1 > 6000-100matrix.txt
./bfs 6000-100matrix.txt $1
rm -r 6000-100matrix.txt
echo
echo 7000 sparceness=100:
./create_list 7000 100 1 > 7000-100matrix.txt
./bfs 7000-100matrix.txt $1
rm -r 7000-100matrix.txt
echo
echo 8000 sparceness=100:
./create_list 8000 100 1 > 8000-100matrix.txt
./bfs 8000-100matrix.txt $1
rm -r 8000-100matrix.txt
echo
echo 9000 sparceness=100:
./create_list 9000 100 1 > 9000-100matrix.txt
./bfs 9000-100matrix.txt $1
rm -r 9000-100matrix.txt
echo
echo 10000 sparceness=100:
./create_list 10000 100 1 > 10000-100matrix.txt
./bfs 10000-100matrix.txt $1
rm -r 10000-100matrix.txt
echo
echo '---sparceness 100 done---'
echo
echo 1000 sparceness=1000:
./create_list 1000 1000 1 > 1000-1000matrix.txt
./bfs 1000-1000matrix.txt $1
rm -r 1000-1000matrix.txt
echo
echo 2000 sparceness=1000:
./create_list 2000 1000 1 > 2000-1000matrix.txt
./bfs 2000-1000matrix.txt $1
rm -r 2000-1000matrix.txt
echo
echo 3000 sparceness=1000:
./create_list 3000 1000 1 > 3000-1000matrix.txt
./bfs 3000-1000matrix.txt $1
rm -r 3000-1000matrix.txt
echo
echo 4000 sparceness=1000:
./create_list 4000 1000 1 > 4000-1000matrix.txt
./bfs 4000-1000matrix.txt $1
rm -r 4000-1000matrix.txt
echo
echo 5000 sparceness=1000:
./create_list 5000 1000 1 > 5000-1000matrix.txt
./bfs 5000-1000matrix.txt $1
rm -r 5000-1000matrix.txt
echo
echo 6000 sparceness=1000:
./create_list 6000 1000 1 > 6000-1000matrix.txt
./bfs 6000-1000matrix.txt $1
rm -r 6000-1000matrix.txt
echo
echo 7000 sparceness=1000:
./create_list 7000 1000 1 > 7000-1000matrix.txt
./bfs 7000-1000matrix.txt $1
rm -r 7000-1000matrix.txt
echo
echo 8000 sparceness=1000:
./create_list 8000 1000 1 > 8000-1000matrix.txt
./bfs 8000-1000matrix.txt $1
rm -r 8000-1000matrix.txt
echo
echo 9000 sparceness=1000:
./create_list 9000 1000 1 > 9000-1000matrix.txt
./bfs 9000-1000matrix.txt $1
rm -r 9000-1000matrix.txt
echo
echo 10000 sparceness=1000:
./create_list 10000 1000 1 > 10000-1000matrix.txt
./bfs 10000-1000matrix.txt $1
rm -r 10000-1000matrix.txt
echo
echo 20000 sparceness=1000:
./create_list 20000 1000 1 > 20000-1000matrix.txt
./bfs 20000-1000matrix.txt $1
rm -r 20000-1000matrix.txt
echo
echo 30000 sparceness=1000:
./create_list 30000 1000 1 > 30000-1000matrix.txt
./bfs 30000-1000matrix.txt $1
rm -r 30000-1000matrix.txt
echo
echo 40000 sparceness=1000:
./create_list 40000 1000 1 > 40000-1000matrix.txt
./bfs 40000-1000matrix.txt $1
rm -r 40000-1000matrix.txt
