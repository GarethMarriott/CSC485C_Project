#include <iostream>
#include <stdio.h>
#include <fstream>
#include <sstream>
#include <vector>
#include <string>

using namespace std;


int main()
{
    vector<vector<int>> test;

    string curr_row;

    ifstream f("test_matrix.txt");


    std::getline(f, curr_row);
    int n = stoi(curr_row);

    test.resize(n);

    for(int i=0; getline(f, curr_row); i++){
        std::stringstream ss(curr_row);
        while(getline(ss, curr_row, ' '))
            test.at(i).push_back(stoi(curr_row));
    }

    for(int i=0; i<test.size(); i++){
        for(int j=0; j<test.at(i).size(); j++){
            printf("%d ", test.at(i).at(j));
        }
        printf("\n");
    }

    return 0;
}