#include <iostream>
using namespace std;
template <class t>
class Stack{
  public:
    class Node{
      public: 
	t data;
	Node *next;
	Node(t data){
	  this -> data = data, this -> next = NULL;
	  cout << "\tNode(" << data << ")" << endl;
	}
	~Node(){
	  cout << "\t~Node(" << data << ")" << endl;
	}
	friend ostream &operator << (ostream &output, Node &n){
	  output << "Data: " << n.data << endl;
	  return output;
	}
    };
    Node *first;
    Stack(){
      first = NULL;
      cout << "\tStack()" << endl;
    }
    ~Stack(){
      Node *a = first, *b;
      while( a ){
	b = a -> next;
	delete a;
	a = b;
      }
      cout << "\t~Stack()" << endl;
    }
    void push(t data){
      Node *n = new Node(data);
      n -> next = first;
      first = n;
    }
    t pop(){
      if( !first ) return 0;
      Node *a = first;
      t b = a -> data;
      first = first -> next;
      delete a;
      return b;
    }
    t top(){
      if( !first ) return 0;
      return first -> data;
    }
    bool isEmpty(){
      return !first;
    }
};
int main(){
  Stack<int> s;
  cout << (s.isEmpty()? "True": "False") << endl;
  for(int i = 0; i < 10; i++)
    s.push(i);
  cout << s.top() << endl;
  cout << s.top() << endl;
  cout << (s.isEmpty()? "True": "False") << endl;
  for(int i = 0; i < 15; i++)
    cout << s.pop() << endl;
  cout << (s.isEmpty()? "True": "False") << endl;
  return 0;
}
