#include <iostream>
#include <string>
#include <fstream>
#include <vector>
using namespace std;
int arr[1000000] = {0};
vector<int> va, vb;
void llenar(){
  ifstream jaja;
  for(int i = 0; i < 2; i++ ){
    if( !i ) jaja.open("f1.txt", ios::in);
    else{
      jaja.close();
      jaja.open("f2.txt", ios::in);
    }
    string a;
    while( !jaja.eof() ){
      getline(jaja, a);
      int l = 0;
      for(int j = 0; j < a.size(); j++){
	if(a[j] == ':' || j == a.size() - 1){
	  long b = stol(a.substr(l, j - l + (j == a.size() - 1? 1: 0)));
	  l = j + 1;
	  arr[b]++;
	  if( !i ) va.push_back(b);
	  else vb.push_back(b);
	}
      }
      if( !i ) va.push_back(-1);
      else vb.push_back(-1);
    }
  }
}
int main(){
  llenar();
//  for(int i = 0; i < va.size() - 1; i++){
//    cout << va[i] << " ";
//  }
//  cout << endl;
//  for(int i = 0; i < vb.size() - 1; i++){
//    cout << vb[i] << " ";
//  }
//  cout << endl;
  
  ofstream jaja;
  jaja.open("f3.txt", ios::out);
  if( jaja.fail() ){
    cout << "No se abrió el archivo." << endl;
    return 0;
  }
  int a = 0, b = 0;
  while(a < va.size() || b < vb.size()){
    while(va[a++] != -1 && arr[va[a-1]] == 1 ) jaja << va[a-1] << ":";
    while(vb[b++] != -1 && arr[va[b-1]] == 1 ) jaja << vb[b-1] << ":";
    jaja << endl;
  }
  return 0;
}
  
