//TRIE. Aka: Prefix Tree
//	Data Structure used to find a word in a dictionary.
//	Find word O(m) *let m be the length of the word you are looking for

#include <bits/stdc++.h>
using namespace std;
class TrieNode{
  public:
    bool isWord;
    vector<int> ref;
    TrieNode(bool isWord = 0){
      this -> isWord = isWord;
      ref = vector<int>(26, -1);
    }
};
vector<TrieNode> Trie;
void addWord(string word, int nodeID = 0, int pos = 0){
  if(pos == word.length()) return;
  int k = Trie[nodeID].ref[word[pos]-'a'];
  if(k == -1){
    Trie[nodeID].ref[word[pos]-'a'] = k = Trie.size();
    Trie.push_back(TrieNode());
  }
  Trie[k].isWord = (pos == word.length() - 1 || Trie[k].isWord);
  addWord(word, k, pos + 1);
}
bool search(string word, int nodeID = 0, int pos = 0){
  if(pos == word.length()) return Trie[nodeID].isWord;
  int k = Trie[nodeID].ref[word[pos]-'a'];
  if(k == -1) return 0;
  return search(word, k, pos + 1);
}
int main(){
  Trie.push_back(TrieNode());
  int n, m;
  cin >> n >> m;
  string a;
  for(int i = 0; i < n; i++)
    cin >> a, addWord(a);
  for(int i=0; i<m; i++)
    cin >> a, cout << (search(a)? "YES": "NO") << endl;
  return 0;
}
