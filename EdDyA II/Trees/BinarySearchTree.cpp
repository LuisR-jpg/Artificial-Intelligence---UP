#include <iostream>
using namespace std;
class BST{
  public: 
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
    Node *root;
    BST(){
      root = NULL;
      cout << "\tBST()" << endl;
    } 
    ~BST(){
      cout << "\tBST()" << endl;
    }
    void insert(int data){
      node *n = new Node(data);
      if(!root){
	root = n;
	return;
      }
      Node a = root;
      for(;;){
	if(a -> data <= n -> data){
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
}
}
}; 
