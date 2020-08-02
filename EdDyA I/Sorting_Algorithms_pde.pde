import java.util.*;
//Bubble, Selection, Insertion
int[] arr = new int[10];
//int[] arr = {9, 2, 5, 1, 3, 7, 6, 4, 8};
//int[] arr = {8, 4, 1, 7, 2, 8, 5, 2, 1, 3, 6, 9, 1, 6, 8, 5};
int n = arr.length;
void setup() {
  for ( int i = 0; i < n; i++ )
    arr[i] = (int)random(n);
  printa(arr);
  //bubble(arr);
  //selection(arr);
  //insertion(arr);
  heap(arr); //Por el input, no se ordena el primer elemento
  //quick(arr, 1, n-1);
  //fechas(5);
  //me(arr, 0, n-e;chas(5);
  printa(arr);
}
