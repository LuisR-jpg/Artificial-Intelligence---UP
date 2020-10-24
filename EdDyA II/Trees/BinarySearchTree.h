#include <iostream>
#include <time.h>
#include <vector>
using namespace std;
class Node{
  public: 
    int data;
    Node *left, *right;
    Node(int data){
      this -> data = data;
      this -> left = this -> right = NULL;
      cout << "\tNode(" << data << ")" << endl;
    }
    ~Node(){
      cout << "\t\t~Node(" << data << ")" << endl;
    }
    friend ostream &operator << (ostream &output, const Node &n){
      output << "Data: " << n.data << endl;
      return output;
    }
};
class BST{
  public: 
    Node *root;
    BST(){
      root = NULL;
      cout << "\tBST()" << endl;
    } 
    BST(Node *root){
      this -> root = root;
    }
    ~BST(){
      cout << "\t~BST()" << endl;
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
}; 
vector<int> pre, en, post;
void preOrden(Node *r){
  pre.push_back(r -> data);
  cout << r -> data << " ";
  if( r -> left ) preOrden(r -> left);
  if( r -> right ) preOrden(r -> right);
}
void enOrden(Node *r){
  if( r -> left ) enOrden(r -> left);
  en.push_back(r -> data);
  cout << r -> data << " ";
  if( r -> right ) enOrden(r -> right);
}
void postOrden(Node *r){
  if( r -> left ) postOrden(r -> left);
  if( r -> right ) postOrden(r -> right);
  post.push_back(r -> data);
  cout << r -> data << " ";
}
BST createRandom(int n = 15){
  BST tree;
  srand(time(NULL));
  for(int i = 0; i < n; i++)
    tree.insert(rand() % 100);
  return tree;
}
