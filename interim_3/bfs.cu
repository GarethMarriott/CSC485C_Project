


#include <iostream>
#include <stdio.h>
#include <fstream>
#include <sstream>
#include <vector>
#include <queue>
#include <omp.h>
#include <chrono>
#include <numeric>
// #include <thrust/host_vector.h>
// #include <thrust/device_vector.h>

using namespace std;

int const blocksize = 512;




class graph
{
   int n;
   // thrust::host_vector< thrust::host_vector<int> > distance;
   // thrust::host_vector< thrust::host_vector<int> > path;
   // thrust::host_vector< thrust::host_vector<int> > adjacency_list;
   // thrust::host_vector<int> adjacency_offset;
   // thrust::host_vector<int> adjacency_size;
   // thrust::host_vector< thrust::host_vector<bool> > discovered;
   vector< vector<int> > distance;
   vector< vector<int> > path;
   vector< vector<int> > adjacency_list;
   vector<int> adjacency_offset;
   vector<int> adjacency_size;
   vector< vector<bool> > discovered;
   public:
        void get_data(std::string filename);
        void bfs();
        void print();
        void print_path(int start, int goal);
};

// struct node
// {
//     int value;
//     int parent;
//     int depth;
//     node(int v, int p, int d)
//     {
//         value = v;
//         parent = p;
//         depth = d;
//     }
//     node(){
//       value = 0;
//       parent = 0;
//       depth = 0;
//     }
// };
__device__
struct node
{
    int value;
    int parent;
    int depth;
    // node(int v, int p, int d)
    // {
    //     value = v;
    //     parent = p;
    //     depth = d;
    // }
    // node(){
    //   value = 0;
    //   parent = 0;
    //   depth = 0;
    // }
};

__global__
void process_row( int *dev_adjacency_list , bool *dev_discovered , int *dev_path , int *dev_distance , int *dev_adjacency_offset , int *dev_adjacency_size , size_t n )
{



  int const idx = threadIdx.x + blockIdx.x * blockDim.x;
  if (idx<n) {

    // if(idx<1){
    //   for(int i=0; i<n; i++){
    //     for(int j=0; j<n; j++){
    //       printf("%d ", dev_path[i*n+j]);
    //     }
    //     printf("\n");
    //   }
    // }

    struct node* queue = (struct node*)malloc(sizeof(struct node)*n);
    int head;
    int tail;
    struct node curr;

    head = 0;
    tail = 0;

    for(int j=0; j<dev_adjacency_size[idx]; j++)
    {
        queue[tail++] = node{dev_adjacency_list[dev_adjacency_offset[idx]+j], idx, 1};
        dev_discovered[idx*n + dev_adjacency_list[dev_adjacency_offset[idx]+j]] = true;
    }


    while(head != tail)
    {
        curr = queue[head++];

        dev_path[idx*n + curr.value] = curr.parent;
        dev_distance[idx*n + curr.value] = curr.depth;

        for(int j=0; j<dev_adjacency_size[curr.value]; j++)
        {
            if(!dev_discovered[idx*n + dev_adjacency_list[dev_adjacency_offset[curr.value]+j]])
            {
                queue[tail++] = node{dev_adjacency_list[dev_adjacency_offset[curr.value]+j], curr.value, curr.depth + 1};
                dev_discovered[idx*n + dev_adjacency_list[dev_adjacency_offset[curr.value]+j]] = true;
            }
        }
      }
    free(queue);
    }
}

void graph::get_data(std::string filename)
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

    adjacency_offset.resize(n);
    adjacency_size.resize(n);

    int adj_size = 0;

    for(int i=0; getline(f, curr_row); i++){
        // if (i%10 == 0) {
        //   printf("%d\n", i);
        // }

        adjacency_offset[i] = adj_size;

        std::stringstream ss(curr_row);
        while(getline(ss, curr_row, ' ')){
            adjacency_list[i].push_back(stoi(curr_row));
            adj_size++;
            //adjacency[i].push_back(stoi(curr_row));
        }

        adjacency_size[i] = adj_size - adjacency_offset[i];

    }

    //#pragma omp parallel for
    for(int i=0; i<n; i++){
        path[i].resize(n, -1);
        distance[i].resize(n, -1);
        discovered[i].resize(n, false);
    }

    // #pragma omp parallel for
    // for(int i=0; i<n; i++){
    //     for(int j=0; j<n; j++){
    //         path[i][j] = -1;
    //         distance[i][j] = -1;
    //         discovered[i][j] = false;
    //     }
    // }

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
    auto const size = sizeof(int) * n;
    auto const num_blocks = ceil( n / static_cast< float >( blocksize ) );

    int E = std::accumulate(adjacency_size.begin(), adjacency_size.end(), 0);

    int* adjacency_list_array = (int*)malloc(sizeof(int)*E);
    int index = 0;
    for (int i = 0; i < adjacency_list.size(); i++) {
      for (int j = 0; j < adjacency_list[i].size(); j++) {
        adjacency_list_array[index] = adjacency_list[i][j];
        index++;
      }
    }

    bool* discovered_array = (bool*)malloc(sizeof(bool)*n*n);
    int* path_array        = (int*)malloc(sizeof(int)*n*n);
    int* distance_array    = (int*)malloc(sizeof(int)*n*n);
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        discovered_array[i*n+j] = discovered[i][j];
        path_array[i*n+j]       = path[i][j];
        distance_array[i*n+j]   = distance[i][j];
      }
    }

    int* adjacency_offset_array = (int*)malloc(sizeof(int)*n);
    int* adjacency_size_array   = (int*)malloc(sizeof(int)*n);

    for (int i = 0; i < n; i++) {
      adjacency_offset_array[i] = adjacency_offset[i];
      adjacency_size_array[i]   = adjacency_size[i];
    }

    // for(int i=0; i<n; i++){
    //   for(int j=0; j<n; j++){
    //     printf("%d ", path_array[i*n+j]);
    //   }
    //   printf("\n");
    // }

    int* dev_adjacency_list;
    bool* dev_discovered;
    int* dev_path;
    int* dev_distance;
    int* dev_adjacency_offset;
    int* dev_adjacency_size;

    cudaMalloc( (void **) &dev_adjacency_list, sizeof(int)*E);
    cudaMalloc( (void **) &dev_discovered, sizeof(bool)*n*n);
    cudaMalloc( (void **) &dev_path, sizeof(int)*n*n);
    cudaMalloc( (void **) &dev_distance, sizeof(int)*n*n);
    cudaMalloc( (void **) &dev_adjacency_offset, sizeof(int)*n);
    cudaMalloc( (void **) &dev_adjacency_size, sizeof(int)*n);

    cudaMemcpy( dev_adjacency_list, adjacency_list_array, sizeof(int)*E, cudaMemcpyHostToDevice );
    cudaMemcpy( dev_discovered, discovered_array, sizeof(bool)*n*n, cudaMemcpyHostToDevice );
    cudaMemcpy( dev_path, path_array, sizeof(int)*n*n, cudaMemcpyHostToDevice );
    cudaMemcpy( dev_distance, distance_array, sizeof(int)*n*n, cudaMemcpyHostToDevice );
    cudaMemcpy( dev_adjacency_offset, adjacency_offset_array, sizeof(int)*n, cudaMemcpyHostToDevice );
    cudaMemcpy( dev_adjacency_size, adjacency_size_array, sizeof(int)*n, cudaMemcpyHostToDevice );

    process_row<<< num_blocks, blocksize >>>( dev_adjacency_list, dev_discovered, dev_path, dev_distance, dev_adjacency_offset, dev_adjacency_size, n );

    cudaMemcpy( path_array, dev_path, sizeof(int)*n*n, cudaMemcpyDeviceToHost );
    cudaMemcpy( distance_array, dev_distance, sizeof(int)*n*n, cudaMemcpyDeviceToHost );

    for(int i=0; i<n; i++){
      for(int j=0; j<n; j++){
        path[i][j] = path_array[i*n+j];
        distance[i][j] = distance_array[i*n+j];
      }
    }
    // thrust::device_vector< thrust::device_vector< int > > d_adjacency_list = adjacency_list;
    // thrust::device_vector< thrust::device_vector< bool > > d_discovered = discovered;
    // thrust::device_vector< thrust::device_vector< int > > d_path = path;
    // thrust::device_vector< thrust::device_vector< int > > d_distance = distance;
    // thrust::device_vector< int > d_adjacency_offset = adjacency_offset;
    // thrust::device_vector< int > d_adjacency_size = adjacency_size;
    //
    // int *dev_adjacency_list = thrust::raw_pointer_cast(&d_adjacency_list[0][0]);
    // bool *dev_discovered = thrust::raw_pointer_cast(d_discovered[0].data());
    // int *dev_path = thrust::raw_pointer_cast(d_path[0].data());
    // int *dev_distance = thrust::raw_pointer_cast(d_distance[0].data());
    // int *dev_adjacency_offset = thrust::raw_pointer_cast(d_adjacency_offset.data());
    // int *dev_adjacency_size = thrust::raw_pointer_cast(d_adjacency_size.data());


    //adjacency_list = dev_adjacency_list;
    //discovered = dev_discovered;

}



void graph::print()
{

  printf("\n\nThe adjacency list is: \n\n");
  for(int i=0;i<n;i++)
  {
      for(uint j=0;j<adjacency_list[i].size();j++)
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
  int num_threads = stoi(argv[2]);
  // omp_set_num_threads(num_threads);

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

  graph.print();
  // graph.print_path(2, 1);
  return 0;
}
