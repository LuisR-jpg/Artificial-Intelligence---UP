//Enteros
#include <iostream>
using namespace std;
class Node{
  public:
    int data;
    Node *next;
    Node(int data){
      this -> data = data;
      this -> next = NULL; //nullptr
    }
    friend ostream& operator <<(ostream& output, const Node &n){
      output << "Data: " << n.data << "Next: " << n.next << endl;
    }
};
class SinglyLinkedList{
  public:
    Node* head;
    SinglyLinkedList(){
      
