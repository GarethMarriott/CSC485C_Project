/*
 * Code gathered from: http://www.plexinfo.com/2017/06/implementation-of-floyd-warshall-algorithm-c.html
 */


#include <iostream>
#include <stdio.h>
#include <fstream>
#include <sstream>
#include <vector>

using namespace std;
 
class graph
{
   int n,i,j,k;
   vector< vector<int> > adjacency, distance;
   public:
        void get_data();
        void floydwarshall();
        void print();
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

    for(i=0; getline(f, curr_row); i++){
        std::stringstream ss(curr_row);
        while(getline(ss, curr_row, ' ')){
            adjacency.at(i).push_back(stoi(curr_row));
            distance.at(i).push_back(stoi(curr_row));
        }
    }

}
 
void graph::floydwarshall()
{
  
   /*for(i=1;i<=n;i++)
   {
        for(j=1;j<=n;j++)
        {
             distance[i][j]=adjacency[i][j];
        }
   }*/
 
   /* Updating distance matrix by taking intermediate vertex 'k'
      between every other vertices pair */
 
   for(k=0;k<n;k++)
   {
        for(i=0;i<n;i++)
        {
            for(j=0;j<n;j++)
            {
                if(distance.at(i).at(k)+distance.at(k).at(j)<distance.at(i).at(j))
                {
                      distance.at(i).at(j)=distance.at(i).at(k)+distance.at(k).at(j);
                }
            }
        }
   }
}
void graph::print()
{
  
  printf("\n\nThe final distance matrix is: \n\n");
  for(i=0;i<n;i++)
  {
      for(j=0;j<n;j++)
      {
          printf("%d\t\t",distance.at(i).at(j));
      }
      printf("\n");
  }
}
 
int main()
{
  graph graph;
  graph.get_data();
  graph.floydwarshall();
  graph.print();
  return 0;
}