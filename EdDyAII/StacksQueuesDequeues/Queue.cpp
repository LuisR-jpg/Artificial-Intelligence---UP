//Regresa t(NULL) cuando vacío y funciona solo para tipos de datos primitivso
#include <iostream>
using namespace std;
template<class t>
class Queue{
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
    Node *first, *last;
    Queue(){
      first = last = NULL;
      cout << "\tQueue()" << endl;
    }
    ~Queue(){
      Node *a = first, *b;
      while( a ){
	b = a -> next;
	delete a;
	a = b;
      }
      cout << "\t~Queue()" << endl;
    }
    void push(t data){
      Node *n = new Node(data);
      if( !first ) first = n;
      else last -> next = n;
      last = n;
    }
    t top(){
      if( !first ) return (t)NULL;
      return first -> data;
    }
    t pop(){
      if( !first ) return (t)NULL;
      Node *a = first;
      first = first -> next;
      t b = a -> data;
      delete a;
      return b;
    }
    bool isEmpty(){
      return !first;
    }
};
int main(){
  Queue<char> q;
  cout << (q.isEmpty()? "True": "False") << endl;
  for( int i = 0; i < 10; i++ )
    q.push(i + 'a');
  cout << q.top() << endl;
  cout << q.top() << endl;
  cout << (q.isEmpty()? "True": "False") << endl;
  for( int i = 0; i < 15; i++ )
    cout << q.pop() << endl;
  cout << (q.isEmpty()? "True": "False") << endl;
  return 0;
}
