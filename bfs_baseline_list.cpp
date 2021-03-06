


#include <iostream>
#include <stdio.h>
#include <fstream>
#include <sstream>
#include <vector>
#include <queue>
#include <chrono>


using namespace std;

class graph
{
   int n;
   vector< vector<int> > distance;
   vector< vector<int> > path;
   vector< vector<int> > adjacency_list;
   vector< vector<bool> > discovered;
   public:
        void get_data(string filename);
        void bfs();
        void print();
        void print_path(int start, int goal);
};

struct node
{
    int value;
    int parent;
    int depth;
    node(int v, int p, int d)
    {
        value = v;
        parent = p;
        depth = d;
    }
};

void graph::get_data(string filename)
{
    string curr_row;

    // std::cout << typeid(adjacency_list).name() << '\n';

    ifstream f(filename);

    std::getline(f, curr_row);
    n = stoi(curr_row);

    // for (int i = 0; i < n; i++) {
    //   for (int j = 0; j < adjacency_list[i].size(); j++) {
		//       std::cout << adjacency_list[i][j] << " ";
	  //   }
    //   std::cout << " " << '\n';
	  // }

    adjacency_list.resize(n);
    distance.resize(n);
    path.resize(n);
    discovered.resize(n);

    for(int i=0; getline(f, curr_row); i++){
        // if (i%10 == 0) {
        //   printf("%d\n", i);
        // }
        std::stringstream ss(curr_row);
        while(getline(ss, curr_row, ' ')){
            adjacency_list[i].push_back(stoi(curr_row));
            //adjacency[i].push_back(stoi(curr_row));
        }
    }

    //#pragma omp parallel for
    for(int i=0; i<n; i++){
        path[i].resize(n);
        distance[i].resize(n);
        discovered[i].resize(n);
    }

    //#pragma omp parallel for
    for(int i=0; i<n; i++){
        for(int j=0; j<n; j++){
            path[i][j] = -1;
            distance[i][j] = -1;
            discovered[i][j] = false;
        }
    }

    //#pragma omp parallel for
    for(int i=0; i<n; i++){
        path[i][i] = i;
        distance[i][i] = 0;
        discovered[i][i] = true;
    }
}


void graph::print_path(int start, int finish)
{

    if(path[start][finish] == -1)
    {
        printf("\n\nThere is no path from %d to %d\n", start, finish);
        return;
    }

    vector< int > curr_path;

    int curr = finish;

    while(curr != start)
    {
        curr_path.push_back(curr);
        curr = path[start][curr];
    }

    curr_path.push_back(curr);

    printf("\n\nShortest path from %d to %d is:\n", start, finish);
    for(int i=curr_path.size() - 1; i>0; i--){
        printf("%d, ", curr_path[i]);
    }
    printf("%d\n", curr_path[0]);
}


void graph::bfs()
{
    std::queue<node> q;
    struct node curr = node(0, 0, 0);
    for(int i=0; i<n; i++)
    {
        // if (i%10 == 0) {
        //   cout << "\r" << i << std::flush;
        // }
        for(int j=0; j<adjacency_list[i].size(); j++)
        {
            q.push(node(adjacency_list[i][j], i, 1));
            discovered[i][adjacency_list[i][j]] = true;
        }


        while(!q.empty())
        {
            curr = q.front();
            q.pop();

            path[i][curr.value] = curr.parent;
            distance[i][curr.value] = curr.depth;

            for(int j=0; j<adjacency_list[curr.value].size(); j++)
            {
                if(!discovered[i][adjacency_list[curr.value][j]])
                {
                    q.push(node(adjacency_list[curr.value][j], curr.value, curr.depth + 1));
                    discovered[i][adjacency_list[curr.value][j]] = true;
                }
            }
        }
    }
}



void graph::print()
{

  printf("\n\nThe adjacency list is: \n\n");
  for(int i=0;i<n;i++)
  {
      for(int j=0;j<adjacency_list[i].size();j++)
      {
          printf("%d\t",adjacency_list[i][j]);
      }
      printf("\n");
  }

  printf("\n\nThe distance matrix is: \n\n");
  for(int i=0;i<n;i++)
  {
      for(int j=0;j<n;j++)
      {
          printf("%d\t",distance[i][j]);
      }
      printf("\n");
  }

  printf("\n\nThe final path matrix is: \n\n");
  for(int i=0;i<n;i++)
  {
      for(int j=0;j<n;j++)
      {
          printf("%d\t",path[i][j]);
      }
      printf("\n");
  }
}

int main(int argc, char const *argv[])
{
  std::string filename(argv[1]);

  auto full_start = std::chrono::steady_clock::now();

  graph graph;
  graph.get_data(filename);

  auto start = std::chrono::steady_clock::now();

  graph.bfs();

  auto end = std::chrono::steady_clock::now();
  std::chrono::duration<long double> time = end - start;
  std::cout << "BFS run time : " << time.count() << std::endl;

  std::chrono::duration<long double> full_time = end - full_start;
  std::cout << "BFS + preprocessing run time : " << full_time.count() << std::endl;
  // graph.print();
  // graph.print_path(2, 1);
  return 0;
}
