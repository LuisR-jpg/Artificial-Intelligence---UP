#include <iostream>
#include <string>
#include <fstream>
#include <vector>
using namespace std;
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
////  int a = 0, b = 0;
////  while(a < va.size() || b < vb.size()){
////    while(va[a++] != -1 && arr[va[a-1]] == 1 ) jaja << va[a-1] << ":";
////    while(vb[b++] != -1 && arr[va[b-1]] == 1 ) jaja << vb[b-1] << ":";
////    jaja << endl;
////  }
  while(va.size() || vb.size()){
    cout << "hola" << endl;
    int arr[10000] = {0};
    for(auto i = va.begin(); i != va.end(); i++){
      if( *i == -1 ) break;
      arr[*i]++;
    }
    for(auto i = vb.begin(); i != vb.end(); i++){
      if( *i == -1 ) break;
      arr[*i]++;
    }
    for(auto i = va.begin(); i != va.end(); i++){
      if( *va.begin() == -1 ) break;
      if( arr[*va.begin()] == 1 ) jaja << (i == va.begin()? "": ":") << *va.begin();
      va.erase(va.begin());
    }
    for(auto i = vb.begin(); i != vb.end(); i++){
      if( *vb.begin() == -1 ) break;
      if( arr[*vb.begin()] == 1 ) jaja << (i == vb.begin()? "": ":") << *vb.begin();
      vb.erase(vb.begin());
    }
    jaja << endl;
    if( va.size() ) va.erase(va.begin());
    if( vb.size() ) vb.erase(vb.begin());
    cout << endl;
//    for(auto i = va.begin(); *i != -1 && i != va.end(); i++){
//      if(arr[*i] == 1) jaja << (i == va.begin()? "": ":") << *i;
//      if(va.size()) va.erase(va.begin());
//    }
  }
//  jaja.close();
//  ifstream jeje;
//  jeje.open("f3.txt", ios::in);
//  if(jeje.fail()) return 0;
//  while( !jeje.eof() ){
//    string a;
//    getline(jeje, a);
//    cout << a << endl;
//  }
//  jeje.close();
  return 0;
}
