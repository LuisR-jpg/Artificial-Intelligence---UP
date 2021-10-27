#include <iostream>
#include <vector>
#include <list>
#include <math.h>
#include <algorithm>
using namespace std;
template<class value>
class Set{
  public: 
    int si;
    vector<list<value>> hash;
    Set(){
      si = 1000;
      hash.resize(si);
    }
    int getVal(string s){
      long long a = 0;
      for(int i = 0; i < s.size(); i++)
	a += s[i]*pow(26, i), a %= si;
      return (int)a;
    }
    int getVal(long long a){
      return a % si;
    }
    void insert(value v){
      int pos = getVal(v);
      if(find(hash[pos].begin(), hash[pos].end(), v) == hash[pos].end())
	hash[pos].push_back(v);
    }
    void remove(value v){
      int pos = getVal(v);
      hash[pos].remove(v);
    }
    bool contains(value v){
      int pos = getVal(v);
      return (find(hash[pos].begin(), hash[pos].end(), v) != hash[pos].end());
    }
    friend ostream &operator << (ostream &output, const Set &s){
      for(int i = 0; i < s.si; i++)
	if(s.hash[i].size())
	  for(auto j: s.hash[i])
	    output << "\t(" << j << ")" << endl;
      return output;
    }
    ~Set(){}
};
int main(){
  Set<int> s;
  cout << s.contains(1010) << endl;
  s.insert(1010);
  cout << s.contains(1010) << endl;
  s.insert(1010);
  cout << s.contains(1010) << endl;
  cout << s << endl;
  s.remove(1010); 
  cout << s << endl;
  s.insert(1);
  s.insert(2);
  cout << s << endl;
  s.remove(1011);
  cout << s << endl;
  /*
  Set<string> s;
  cout << s.contains("hola") << endl;
  s.insert("hola");
  cout << s.contains("hola") << endl;
  s.insert("hola");
  cout << s.contains("hola") << endl;
  cout << s << endl;
  s.remove("hola"); 
  cout << s << endl;
  s.insert("asi");
  s.insert("es");
  cout << s << endl;
  s.remove("asiera");
  cout << s << endl;
  */
  return 0;
}
    
