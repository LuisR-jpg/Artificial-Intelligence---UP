//The C++ implementation of a binary tree with the heap invariant is called priority queue
//Insertar O(logn)
//Eliminar O(logn)
//Top O(1)
#include <bits/stdc++.h>
//#include <heap>
using namespace std;
int main(){
  priority_queue<int> heap;
  heap.push(5);
  heap.push(10);
  heap.top(); //Returns 10
  heap.pop();
  heap.top(); //Returns 5
  heap.pop();
  heap.size(); //0
  return 0;
}
