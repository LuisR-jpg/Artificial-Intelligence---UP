#include <iostream>
#include <vector>
using namespace std;
int main(){
  vector<vector<int>> mat(3, vector<int>(3, 7));
  mat[1].push_back(8);
  mat.push_back(vector<int>(10, 8));
  for( int i = 0; i < (int)mat.size(); i++ ){
    for( int j = 0; j < (int)mat[i].size(); j++ ){
      cout << mat[i][j] << " ";
    }
    cout << endl;
  }
  return 0;
}
