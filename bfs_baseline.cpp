


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
   vector< vector<int> > adjacency, distance; 
   vector< vector<int> > path;
   public:
        void get_data();
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

void graph::get_data()
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

    ifstream f("test_matrix.txt");

    std::getline(f, curr_row);
    n = stoi(curr_row);

    adjacency.resize(n);
    distance.resize(n);
    path.resize(n);

    for(int i=0; getline(f, curr_row); i++){
        std::stringstream ss(curr_row);
        while(getline(ss, curr_row, ' ')){
            if(stoi(curr_row) < 0){
                adjacency[i].push_back(-1);
            }
            else
            {
                adjacency[i].push_back(stoi(curr_row));
            }
            path[i].push_back(-1);
            distance[i].push_back(-1);
        }
    }

    for(int i=0; i<n; i++){
        path[i][i] = i;
        distance[i][i] = 0;
    }

}


void graph::print_path(int start, int finish)
{
    int dist = distance[start][finish];
    int curr_path [dist+1];
    curr_path[dist] = finish;
    int curr = finish;
    for(int i = dist-1; i>=0; i--)
    {
        curr = path[start][curr];
        curr_path[i] = curr;
    }

    printf("\n\nShortest path from %d to %d is:\n", start, finish);
    for(int i=0; i<dist; i++){
        printf("%d, ", curr_path[i]);
    }
    printf("%d\n", curr_path[dist]);
}


void graph::bfs()
{
    std::queue<node> q;
    struct node curr = node(0, 0, 0);
    for(int i=0; i<n; i++)
    {
        for(int j=0; j<n; j++)
        {
            if(adjacency[i][j] > 0)
            {
                q.push(node(j, i, 1));
            }
        }


        while(!q.empty())
        {
            curr = q.front();
            q.pop();

            path[i][curr.value] = curr.parent;
            distance[i][curr.value] = curr.depth;

            for(int j=0; j<n; j++)
            {
                if(path[i][j] < 0 && adjacency[curr.value][j] > 0)
                {
                    q.push(node(j, curr.value, curr.depth + 1));
                }
            }
        }
    }
}



void graph::print()
{

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

int main()
{
  graph graph;
  graph.get_data();
  graph.bfs();
  graph.print();
  graph.print_path(2, 1);
  return 0;
}