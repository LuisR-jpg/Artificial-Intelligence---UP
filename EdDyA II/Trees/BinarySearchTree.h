#include <iostream>
#include <time.h>
#include <vector>
using namespace std;
vector<int> pre, en, post;
//template<class int>
class BST{
  public: 
class Node{
  public: 
    int data;
    Node *left, *right;
    Node(int data){
      this -> data = data;
      this -> left = this -> right = NULL;
      //cout << "\tNode(" << data << ")" << endl;
    }
    ~Node(){
      //cout << "\t~Node(" << data << ")" << endl;
    }
    friend ostream &operator << (ostream &output, const Node &n){
      output << "\tData: " << n.data << endl;
      return output;
    }
};
    Node *root;
    BST(){
      root = NULL;
      //cout << "\tBST()" << endl;
    } 
    BST(Node *r){
      root = r;
      //cout << "\tBST()" << endl;
    }
    void destruir(Node *r){
      if(r -> left) destruir(r -> left);
      if(r -> right) destruir(r -> right);
      delete r;
    }
    ~BST(){
      if(root) destruir(root);
      //cout << "\t~BST()" << endl;
    }
    void insert(int data){
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
    bool contains(int data){
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
    void preOrden(){
      preOrden(root);
    } 
    void preOrden(Node *r){
      cout << r -> data << " ";
      pre.push_back(r -> data);
      if( r -> left ) preOrden(r -> left);
      if( r -> right ) preOrden(r -> right);
    }
    void enOrden(){
      enOrden(root);
    }
    void enOrden(Node *r){
      if( r -> left ) enOrden(r -> left);
      cout << r -> data << " ";
      en.push_back(r -> data);
      if( r -> right ) enOrden(r -> right);
    }
    void postOrden(){
      postOrden(root);
    }
    void postOrden(Node *r){
      if( r -> left ) postOrden(r -> left);
      if( r -> right ) postOrden(r -> right);
      cout << r -> data << " ";
      post.push_back(r -> data);
    }
}; 
BST createRandom(int n = 15){
  BST tree;
  int arr[100] = {0};
  srand(time(NULL));
  for(int i = 0, a; i < n; i++){
    while(true){
      a = rand() % 100;
      if( !arr[a] ){
	arr[a]++;
	break;
      }
    }
    tree.insert(a);
  }
  return tree;
}
