


#include <iostream>
#include <stdio.h>
#include <fstream>
#include <sstream>
#include <vector>
#include <queue>

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
    node()
    {
        value = 0;
        parent = 0;
        depth = 0;
    }
    node(int v, int p, int d)
    {
        value = v;
        parent = p;
        depth = d;
    }
};

void graph::get_data(string filename)
{
  /*string line;
  ifstream file ("test_matrix.txt");
  while(getline(file,line)){
      for(i=1;i<5;i++)
        adjacency[i][j] = (int)line;
  }


  printf("\nEnter the total number of vertices: ");
  scanf("%d",&n);
  printf("\nEnter the adjacency matrix (If there is no \nedge betweent two vertex then enter 1000): \n\n");
  for(i=1;i<=n;i++)
  {
       for(j=1;j<=n;j++)
       {
             scanf("%d", &adjacency[i][j]);
       }
  }*/

    string curr_row;

    ifstream f(filename);

    std::getline(f, curr_row);
    n = stoi(curr_row);

    //adjacency.resize(n);
    adjacency_list.resize(n);
    distance.resize(n);
    path.resize(n);
    discovered.resize(n);

    for(int i=0; getline(f, curr_row); i++){
        // if (i%10 == 0) {
        //   printf("%d\n", i);
        // }
        std::stringstream ss(curr_row);
        int j=0;
        while(getline(ss, curr_row, ' ')){
            if(stoi(curr_row) > 0){
                adjacency_list[i].push_back(j);
            }
            //adjacency[i].push_back(stoi(curr_row));
            path[i].push_back(-1);
            distance[i].push_back(-1);
            discovered[i].push_back(false);
            j++;
        }
    }

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
    //std::queue<node> q;
    struct node queue [n];
    int head;
    int tail;
    struct node curr;
    for(int i=0; i<n; i++)
    {
        //if (i%10 == 0) {
        //  cout << "\r" << i << std::flush;
        //}

        head = 0;
        tail = 0;

        for(int j=0; j<adjacency_list[i].size(); j++)
        {
            queue[tail++] = node(adjacency_list[i][j], i, 1);
            discovered[i][adjacency_list[i][j]] = true;
        }


        while(head != tail)
        {
            curr = queue[head++];

            path[i][curr.value] = curr.parent;
            distance[i][curr.value] = curr.depth;

            for(int j=0; j<adjacency_list[curr.value].size(); j++)
            {
                if(!discovered[i][adjacency_list[curr.value][j]])
                {
                    queue[tail++] = node(adjacency_list[curr.value][j], curr.value, curr.depth + 1);
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
  graph graph;
  graph.get_data(filename);
  graph.bfs();
  // graph.print();

  // Small sanity check to ensure that outputs still make sense
  //for(int i=0; i<20; i++){
  //    graph.print_path(i, i+100);
  //}
  return 0;
}
