//Enteros
#include <iostream>
using namespace std;
class Node{
  public:
    int data;
    Node *next;
    Node(int data){
      cout << "\tNode(" << data << ")" << endl;
      this -> data = data;
      this -> next = NULL; //nullptr
    }
    ~Node(){
      cout << "\t~Node(" << data << ")" << endl;
    }
    friend ostream& operator << (ostream& output, const Node &n){
      output << "Data: " << n.data << "\tNext: " << n.next << endl;
    }
};
class SinglyLinkedList{
  public:
    Node* head;
    SinglyLinkedList(){
      head = NULL;
      cout << "\tSinglyLinkedList()" << endl;
    }
    ~SinglyLinkedList(){
      cout << "\t~SinglyLinkedList()" << endl;
      Node *a = head;
      while( a != NULL ){
	Node *b = a -> next;
	delete a;
	a = b;
      }
    }
    void insert_tail(int data){
      Node *n = new Node(data);
      if( head == NULL ) head = n;
      else{
        Node *a = head;
        while( a -> next != NULL ) a = a -> next;
        a -> next = n;
      }
    }
    friend ostream &operator << (ostream &output, const SinglyLinkedList &l){
      Node *n = l.head;
      while( n != NULL ){
	output << *n;
	n = n -> next;
      }
//      output << endl;
    }
};
int main(){
  SinglyLinkedList lista;
  lista.insert_tail(1);
  lista.insert_tail(2);
  lista.insert_tail(3);
  cout << lista;
  return 0;
}
