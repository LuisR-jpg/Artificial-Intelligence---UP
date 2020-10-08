#include <iostream>
using namespace std;
template<class t>
class Dequeue{
  public: 
    class Node{
      public: 
        Node *prev, *next;
        t data;
      Node(t data){
        this -> data = data;
        prev = next = NULL;
        cout << "\tNode(" << data << ")" << endl;
      }
      ~Node(){
        cout << "\t~Node(" << data << ")" << endl;
      }
    };
    Node *first, *last;
    Dequeue(){
      first = last = NULL;
      cout << "\tDequeue()" << endl;
    }
    ~Dequeue(){
      Node *a = first, *b;
      while( a ){
	b = a -> next;
	delete a;
	a = b;
      }
      cout << "\t~Dequeue()" << endl;
    }
    void push_front(t data){
      Node *n = new Node(data);
      if( !first ) last = n;
      n -> next = first;
      first = n;
    }
    void push_back(t data){
      Node *n = new Node(data);
      if( !last ) first = n;
      n -> prev = last;
      last = n;
    }
    t pop_front(){
      if( !first ) return (t)NULL;
      Node *a = first;
      t b = a -> data;
      first = first -> next;
      delete a;
      if( first ) first -> prev = NULL;
      return b;
    }
    t pop_back(){
      if( !last ) return (t)NULL;
      Node *a = last;
      t b = a -> data;
      last = last -> prev;
      delete a;
      if( last ) last -> next = NULL;
      else first = last = NULL;
      return b;
    }
    t front(){
      if( !first ) return (t)NULL;
      return first -> data;
    }
    t back(){
      if( !last ) return (t)NULL;
      return last -> data;
    }
    bool isEmpty(){
      return !first;
    }
};
int main(){
  Dequeue<int> d;
  cout << (d.isEmpty()? "Vacia": "Llena") << endl;
  for(int i = 0; i < 10; i++)
    d.push_back(i);
  cout << (d.isEmpty()? "Vacia": "Llena") << endl;
  for(int i = 0; i < 10; i++)
    cout << d.back();
  cout << (d.isEmpty()? "Vacia": "Llena") << endl;
  for(int i = 0; i < 10; i++)
    cout << d.pop_back() << endl;
  cout << (d.isEmpty()? "Vacia": "Llena") << endl;
  for(int i = 0; i < 10; i++)
    d.push_front(i);
  cout << (d.isEmpty()? "Vacia": "Llena") << endl;
  for(int i = 0; i < 10; i++)
    cout << d.front();
  cout << (d.isEmpty()? "Vacia": "Llena") << endl;
  for(int i = 0; i < 10; i++)
    cout << d.pop_front() << endl;
  cout << (d.isEmpty()? "Vacia": "Llena") << endl;
  return 0;
}
