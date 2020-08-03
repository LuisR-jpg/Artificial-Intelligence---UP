//Bubble Sort. O(n^2). Swap si mal acomodados
void bubble( int[] arr ) {                             //No devulve valor alguno, recibe un arreglo de enteros para ser ordenado
  int swap = 1, i;                                     //Se declara i, no está dentro del for por que da problemas con swap, swap evita iteraciones en caso de que ya esté ordenado el arreglo 
  for( int j = arr.length-1; j > 0 && swap > 0; j-- )  //Va dejando el numero mas grande hasta la derecha y no vuelve a accesar a esa casilla, el arreglo en 0 ya estará ordenado
    for ( i = 0, swap = 0; i < j; i++ ) {              //Recorre desde el principio, reinicia el contador, va checando hasta donde vaya j
      swap += arr[i] > arr[i+1]? 1: 0;                 //Si debe haber un swap se incrementa el contador
      if ( arr[i] > arr[i+1] ) swap(arr, i, i+1);      //Si el numero actual es mas grande que el de la derecha, cambian de lugar
    }
}
//Selection Sort. O(n^2). El mas pequeño a la izquierda 
void selection( int arr[] ) {         //No devuelve valor, recibe varios numeros para ordenarlos.
  int pos = 0, curr;                  //Para guardar la posición y valor
  for ( int i = 0; i < n; i++ ) {     //Recorre el arreglo completo
    curr = arr[i];                    //Se actualiza el valor del numero a reemplazar
    pos = i;                          //Se actualiza la posición actual del numero a reemplazar
    for ( int j = i+1; j < n; j++ ) { //Busca numeros mas pequeños al actual partiendo de su derecha, hasta el final
      pos = arr[j] < curr? j: pos;    //Si se encuentra un numero mas pequeño se guarda su posición
      curr = min( arr[j], curr );     //Se actualiza el valor del numero mas pequeño hasta ahora encontrado
    }
    swap( arr, i, pos );              //Una vez detectado el mas chico, se hace swap con el actual y se repite el ciclo
  }
}
//Insertion Sort. O(n^2). Mejor caso de O(n)
void insertion( int arr[] ) {                            //No devuelve valor, recibe arreglo para ser ordenado
  for ( int i = 0; i < n-1; i++ )                        //Recorre el arreglo entero, para pasar por cada número que tenga que ser insertado
    for ( int j = i+1; j > 0 && arr[j-1] > arr[j]; j-- ) //Comienza desde el numero seleccionado + 1 (Fuera de la frontera de ordenados y desordenados)
                                                           //Itera mientras sea mayor a 0, para que no se salga del arreglo y dentro de la condición igual checa si
                                                           //el numero de la izquierda es mayor, en ese caso entra al for, lleva un decremento de uno. Si no entra significa que
                                                           //que ya está en su lugar
      swap( arr, j-1, j );                               //Si entra hace el swap
}
