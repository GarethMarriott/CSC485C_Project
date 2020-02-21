


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
    int num = 2;

    vector< queue<node> > q;
    vector< node > curr;
    
    for(int i=0; i<num; i++)
    {
        q.push_back(queue<node>);
        curr.push_back(node(0, 0, 0));
    }

    for(int i=0; i<n; i+=num)
    {
        // if (i%10 == 0) {
        //   printf("%d\n", i);
        // }  

        for(int k=0; k<num; k++)
        {
            for(int j=0; j<adjacency_list[i+k].size(); j++)
            {
                
                    q.push(node(adjacency_list[i+k][j], i+k, 1));
                    discovered[i][adjacency_list[i+k][j]] = true;
                
            }


            while(!q.empty())
            {
                curr = q.front();
                q.pop();

                path[i+k][curr.value] = curr.parent;
                distance[i+k][curr.value] = curr.depth;

                for(int j=0; j<adjacency_list[curr.value].size(); j++)
                {
                    if(!discovered[i+k][adjacency_list[curr.value][j]])
                    {
                        q.push(node(adjacency_list[curr.value][j], curr.value, curr.depth + 1));
                        discovered[i+k][adjacency_list[curr.value][j]] = true;
                    }
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

int main()
{
  graph graph;
  graph.get_data();
  graph.bfs();
  // graph.print();
  // graph.print_path(2, 1);
  return 0;
}
