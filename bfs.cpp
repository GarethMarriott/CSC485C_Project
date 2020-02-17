


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
   vector< vector<int> > adjacency; //, distance; 
   vector< vector<int> > path;
   public:
        void get_data();
        void bfs();
        void print();
};

struct node
{
    int value;
    int parent;
    node(int val, int par)
    {
        value = val;
        parent = par;
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
    //distance.resize(n);
    path.resize(n);

    for(int i=0; getline(f, curr_row); i++){
        std::stringstream ss(curr_row);
        while(getline(ss, curr_row, ' ')){
            if(stoi(curr_row) < 0){
                adjacency.at(i).push_back(-1);
            }
            else
            {
                adjacency.at(i).push_back(stoi(curr_row));
            }
            path.at(i).push_back(-1);
        }
    }

    for(int i=0; i<n; i++){
        path.at(i).at(i) = i;
    }

}



void graph::bfs()
{
    std::queue<node> q;
    struct node curr = node(0, 0);
    for(int i=0; i<n; i++)
    {
        for(int j=0; j<n; j++)
        {
            if(adjacency.at(i).at(j) > 0)
            {
                q.push(node(j, i));
            }
        }


        while(!q.empty())
        {
            curr = q.front();
            q.pop();

            path.at(i).at(curr.value) = curr.parent;

            for(int j=0; j<n; j++)
            {
                if(path.at(i).at(j) < 0 && adjacency.at(curr.value).at(j) > 0)
                {
                    q.push(node(j, curr.value));
                }
            }
        }
    }
}



void graph::print()
{

  /*printf("\n\nThe adjacency matrix is: \n\n");
  for(int i=0;i<n;i++)
  {
      for(int j=0;j<n;j++)
      {
          printf("%d\t",adjacency.at(i).at(j));
      }
      printf("\n");
  }*/

  printf("\n\nThe final path matrix is: \n\n");
  for(int i=0;i<n;i++)
  {
      for(int j=0;j<n;j++)
      {
          printf("%d\t",path.at(i).at(j));
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
  return 0;
}