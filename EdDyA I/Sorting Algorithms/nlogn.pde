//O(nlogn). 
void heap( int arr[] ){                                                                        //Se recibe sólo el arreglo para ordenar                                                        
  for( int i = 2; i < arr.length; i++ )                                                        //Recorre desde la casilla 2, porque el 0 no se toca
    for( int j = i; j > 1 && arr[j] > arr[j/2]; j /= 2 )                                       //Mientras haya hijos cuyo padre sea menor, van a estar subiendo en el heap
      swap( arr, j, j/2 );                                                                     //Swap para cambiar la posición y poder subir
  for( int i = arr.length-1; i > 0; i-- ){                                                     //Se recorren todas las casillas (el 0 no se cuenta)    
    swap( arr, 1, i );                                                                         //El elemento más grande se pasa detras de todos
    int pa = 1;                                                                                //Variables para mantener el valor de pa
    while ( (pa*2 < i && arr[pa*2]>arr[pa]) || (pa*2+1 < i && arr[pa*2+1]>arr[pa]) )           //Mientras el padre tenga al menos un hijo mayor a el
      swap( arr,                                                                               //Va a hacer swap dentro del arreglo,                                                                                   
        pa = pa*2 + (pa*2 < i && pa*2+1 < i && arr[pa*2] >= arr[pa*2+1] || pa*2+1 >= i? 0: 1), //Entre el valor del hijo mas grande
        pa/2 );                                                                                //Y su padre
  }
}
//Quick Sort O(nlogn). Peor caso de O(n2)
void quick(int[] arr, int i, int d) {         //Acepta como argumentos el arreglo para ordenar, puntero de la izquierda y derecha.
  int ai = i, ad = d, p = i-1;                //Se guardan los punteros izquierdo, derecho y se inicializa el puntero al lado del de la izquierda
  if ( d <= i ) {                             //Caso base: Si derecha es menor o igual a izquierda    
    if ( arr[p] > arr[d] ) swap( arr, p, d ); //Si los numeros a los que se apunta, están en desorden, hay que hacer swap. 
    return;                                   //Termina hilo recursivo
  }
  while ( ai < ad ) {                         //Ciclo para ajustar la posición de izquierda y derecha
    if (arr[ai] <= arr[p]) ai++;              //Irá hacía la derecha el puntero izquierdo mientras sea menor o igual al numero que apunta el pivote
    else if (arr[ad] > arr[p]) ad--;          //El derecho decrecerá mientras sea mayor al numero que apunta el pivote
    else swap(arr, ai, ad);                   //Si se atoran, hay que intercambiar los valores
  }
  int aux = arr[p] < arr[ai]? ai-1: ai;      //Se asigna un valor a auxiliar, dependiendo de si el numero encontrado es menor al pivote
  swap( arr, p, aux );                       //Se acomoda el valor del pivote en su posición final del arreglo
  if ( aux-1 > p ) quick( arr, p+1, aux-1 ); //Nueva llamada recursiva para la parte izquierda de donde se posicionó el pivote
  if ( aux+2 <= d ) quick( arr, aux+2, d );  //Nueva llamada recursiva para la parte derecha
}
//Algoritmo estable. O(nlogn)
void merge( int[] arr, int ini, int fin ) {                 //Se pasa como argumento el arreglo, y el subarreglo será delimitado por el inicio y el final 
  if ( ini >= fin ) return;                                 //Caso base: Que se toquen los indices, o el ini y fin se cambien de lado.
  int m = (ini+fin)/2;                                      //Se calcula la mitad del arreglo para particionarlo
  merge( arr, ini, m );                                     //Para cada vez que se parta el arreglo se repite el proceso con la parte izquierda
  merge( arr, m+1, fin );                                   //Para cada vez que se parta el arreglo se repite el proceso con la parte derecha
  int i = ini, j = m+1, k = 0, aux[] = new int[fin-ini+1];  //Se declaran variables para iterar dentro de cada pedazo, el principio de la izquieda, el principio de la derecha.
                                                                  //un arreglo para guardar la mezcla de ambos y su respectivo apuntador
  while ( i <= m || j <= fin )                              //Mientras aún haya elementos en algún arreglo, va a seguir en el ciclo
    aux[k++] = (i <= m && j <= fin && arr[i] <= arr[j] ) || j > fin? arr[i++]: arr[j++]; //Se inserta en aux el elemento mas pequeño que siga, cuidando que se salga del arreglo
  for ( int o = ini; o <= fin; o++ )                        //Recorre dentro del pedacito del arreglo que corresponda
    arr[o] = aux[o - ini];                                  //Respalda el auxiliar creado al arreglo original
}
