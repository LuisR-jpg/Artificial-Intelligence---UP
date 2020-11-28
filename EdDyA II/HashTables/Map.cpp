#include <iostream>
#include <vector>
#include <list>
#include <math.h>
using namespace std;
template<class key, class value>
class Map{
  public:
    int si;
    vector<list<pair<key, value>>> hash;
    Map(){
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
    void insert(key k, value v){
      int pos = getVal(k);
      for(auto x: hash[pos])
	if(x.first == k){
	  x.second = v;
	  return;
	}
      hash[pos].push_back(make_pair(k, v));
    }
    void remove(key k){
      int pos = getVal(k);
      if(!hash[pos].size()) return;
      auto it = hash[pos].begin();
      for(; it != hash[pos].end(); it++)
	if(it -> first == k) break;
      hash[pos].erase(it);
    }
    bool contains(key k){
      int pos = getVal(k);
      for(auto x: hash[pos])
	if(x.first == k) return true;
      return false;
    }
    value get(key k){
      int pos = getVal(k);
      for(auto x: hash[pos])
	if(x.first == k) return x.second;
      if(typeid(value) == typeid(string)) return "";
      return value(NULL);
    }
    friend ostream &operator << (ostream &output, const Map &m){
      for(int i = 0; i < m.si; i++)
	if(m.hash[i].size())
	  for(auto j: m.hash[i])
	    output << "\t(" << j.first << ", " << j.second << ")" << endl;
      return output;
    }
    ~Map(){}
};
int main(){
  Map<string, string> m;
  cout << m.contains("hola") << endl;
  m.insert("hola", "hola");
  cout << m.contains("hola") << endl;
  cout << m.get("hola") << endl;
  m.remove("haha");
  cout << m.contains("hola") << endl;
  cout << m << endl;
  m.remove("hola"); 
  cout << m.contains("hola") << endl;
  cout << m.get("hola") << endl;
  return 0;
}

