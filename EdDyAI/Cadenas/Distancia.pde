//Solución mas intuitiva, no siempre confiable. O(n)
int hamming(String st1, String st2){                        //Recibe como parámetro 2 cadenas, las que van a ser comparadas
  int dis = 0;                                              //Se inicializa el contador de diferencias
  for( int i = 0; i < min(st1.length(), st2.length()); i++ )//Se recorre cada posición desde 0 hasta la longitud más pequeña entre las dos cadenas 
    if( st1.charAt(i) != st2.charAt(i) ) dis++;             //Para cada diferencia de caractér se suma uno al contador
  return dis + abs(st2.length() - st1.length());            //Regresa el total de diferencias mas el extra que pueda tener una cadena sobre otra
}
//Solución mas robusta. O(nm)
int levenshtein(String st1, String st2){                  //Recibe como parámetro las 2 cadenas que va a comparar.
  int mat[][] = new int [st1.length()+1][st2.length()+1]; //Crea la matriz que vamos a utilizar para guardar los mejores estados
  for( int i = 1; i <= st1.length(); i++ )                //Recorre fila por fila desde 1 hasta el tamaño de la cadena 1
    for( int j = 1; j <= st2.length(); j++ )              //Recorre columna por columna desde 1 hasta el tamaño de la cadena 2
      mat[i][j] = min((j==1?i:mat[i][j-1])+1,(i==1?j:mat[i-1][j])+1,(j==1&&i==1?0:j==1?i-1:i==1?j-1:mat[i-1][j-1])+(st1.charAt(i-1)==st2.charAt(j-1)?0:1));
      /*
          Se va a asignar un estado a la matriz, el mejor caso es el valor más pequeño. Entonces a la función mínimo se le pasan 3 parametros.
            1.El primer es el valor correspondiente a la izquierda, si la casilla es un caso base se asigna el valor del renglon actual
            2.El segundo parametro es el valor de la casilla de arriba, si se encuentra en un caso base va a asignar el valor de la columna actual
            3.El último parametro es el valor de la diagonal.
              Si es la primer casilla, va a dar un 0
              Si es caso base para las columnas (j) dará el renglon anterior
              Si es caso base para los renglones (i) va a dar la columna anterior
              Si no es ningún caso base, asignará el valor de la casilla noroeste.
              Aparte se va a sumar 1, si los caracteres comparados son distintos
                
      */
  return mat[st1.length()][st2.length()];                 //Regresa el último elemento de la matriz (abajo a la derecha) es el que nos interesa.
}
