#include <iostream>
#include <stack>
#include <queue>
using namespace std;
template<class t>
class BST{
  public: 
    class Node{
      public: 
        t data;
        Node *left, *right;
        Node(t data){
          this -> data = data;
          this -> left = this -> right = NULL;
          cout << "\tNode(" << data << ")" << endl;
        }
        ~Node(){
          cout << "\t~Node(" << data << ")" << endl;
        }
        friend ostream &operator << (ostream &output, const Node &n){
          output << "\tData: " << n.data << endl;
          return output;
        }
    };
    Node *root;
    BST(){
      root = NULL;
      cout << "\tBST()" << endl;
    } 
    void destruir(Node *r){
      if(r -> left) destruir(r -> left);
      if(r -> right) destruir(r -> right);
      delete r;
    }
    ~BST(){
      if(root) destruir(root);
      cout << "\t~BST()" << endl;
    }
    void insert(t data){
      Node *n = new Node(data);
      if(!root){
	root = n;
	return;
      }
      for(Node *a = root; ; ){
	if(n -> data <= a -> data){
	  if(a -> left) a = a -> left;
	  else{
	    a -> left = n;
	    return;
	  }
	}
	else{
	  if(a -> right) a = a -> right;
	  else{
	    a -> right = n;
	    return;
	  }
	}
      }
    }
    bool contains(t data){
      Node *a = root;
      if( !a ) return false;
      while(a){
	if(data == a -> data) return true;
	else if(a -> left && data < a -> data) a = a -> left;
	else if(a -> right && data > a -> data) a = a -> right;
	else return false;
      }
      return false;
    }
//remove
    Node* _search(t data){
      Node *p = NULL, *n = root;
      while(n){
	if(data < n -> data) p = n, n = n -> left;
	else if(data > n -> data) p = n, n = n -> right;
	else return p;
      }
      return NULL;
    }
    void _remove(Node *p, Node *n){
      if(!(n -> left || n -> right)){
	if(!p) root = NULL;
	else if(p -> left == n) p -> left = NULL;
	else if(p -> right == n) p -> right = NULL;
      }
      else if((!n -> left && n -> right) || (n -> left && !n -> right)){
	if(!p){
	  if(n -> left) root = n -> left;
	  else if(n -> right) root = n -> right;
	}
	else if(p -> left == n){
	  if(n -> left) p -> left = n -> left;
	  else if(n -> right) p -> left = n -> right;
	}
	else if(p -> right == n){
	  if(n -> left) p -> right = n -> left;
	  else if(n -> right) p -> right = n -> right;
	}
      }
      else if(n -> left && n -> right){
	Node *pd = n, *nd = n -> left;
	while(nd -> right) pd = nd, nd = nd -> right;
	_remove(pd, nd);
	nd -> left = n -> left;
	nd -> right = n -> right; 
	if(!p) root = nd;
	else if(p -> left == n) p -> left = nd;
	else if(p -> right == n) p -> right = nd;
      }
    }
    void remove(t data){
      Node *p = _search(data), *n;
      if(p) n = (p -> left && p -> left -> data == data? p -> left: p -> right);
      else n = root;
      if(!n || n -> data != data) return;
      _remove(p, n);
      delete n;
    }
    void preOrden(){
      preOrden(root);
      cout << endl;
    } 
    void preOrden(Node *r){
      cout << r -> data << " ";
      if( r -> left ) preOrden(r -> left);
      if( r -> right ) preOrden(r -> right);
    }
    void enOrden(){
      enOrden(root);
      cout << endl;
    }
    void enOrden(Node *r){
      if( r -> left ) enOrden(r -> left);
      cout << r -> data << " ";
      if( r -> right ) enOrden(r -> right);
    }
    void postOrden(){
      postOrden(root);
      cout << endl;
    }
    void postOrden(Node *r){
      if(r -> left) postOrden(r -> left);
      if(r -> right) postOrden(r -> right);
      cout << r -> data << " ";
    }
    void DFS(){
      stack<Node*> s;
      if(root) s.push(root);
      while(s.size()){
	auto a = s.top();
	s.pop();
	cout << a -> data << " ";
	if(a -> right) s.push(a -> right);
	if(a -> left) s.push(a -> left);
      }
      cout << endl;
    }
    void BFS(){
      queue<Node*> q;
      if(root) q.push(root);
      while(q.size()){
	auto a = q.front();
	q.pop();
	cout << a -> data << " ";
	if(a -> left) q.push(a -> left);
	if(a -> right) q.push(a -> right);
      }
      cout << endl;
    }
    void print(Node *r, int i = 0){
      if(r -> left) print(r -> left, i + 1);
      for(int a = 0; a < i; a++) cout << "\t";
      cout << r -> data << endl;
      if(r -> right) print(r -> right, i + 1);
    }
    friend ostream &operator << (ostream &output, BST &tree){
      if(tree.root) tree.print(tree.root);
      else output << "Arbol Vacio" << endl;
      return output;
    }
}; 
int main(){
  /*
  BST<int> b;
  for(int i = -3; i < 12; i++)
    b.insert(i);
  b.insert(1);
  b.insert(4);
  b.insert(7);
  b.insert(9);
  b.insert(3);
  b.insert(0);
  cout << "DFS: " << endl;
  b.DFS();
  cout << "preOrden" << endl;
  b.preOrden();
  cout << "enOrden" << endl;
  b.enOrden();
  cout << "postOrden" << endl;
  b.postOrden();
  cout << "BFS: " << endl;
  b.BFS();
  cout << endl;
  for(int i = -5; i < 15; i++)
    cout << i << ":\t" << b.contains(i) << endl;
  cout << b << endl;
  //b.remove(11);
  //b.remove(0);
  cout << b << endl;
  cout << endl << endl << endl << endl;
  for(int i = -10; i < 11; i++){
    b.remove(i);
  }
  cout << b << endl;
  */
  /*
  BST<char> b;
  string a = "Anitalavalatina";
  for(auto i: a) b.insert(i);
  cout << b;
  b.BFS();
  b.DFS();
  b.preOrden();
  b.enOrden();
  b.postOrden();
  for(auto i: a) b.remove(i);
  cout << b;
  */
  int arr[] = {50, 17, 72, 12, 23, 25, 74, 16, 19};
  BST<int> b;
  for(int i = 0; i < 9; i++) b.insert(arr[i]);
  cout << b;
  b.BFS(); 
  b.DFS();
  b.preOrden();
  b.enOrden();
  b.postOrden();
  b.remove(17);
  return 0;
}
