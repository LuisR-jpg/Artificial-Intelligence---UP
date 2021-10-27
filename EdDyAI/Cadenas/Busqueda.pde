//Solución obvia, no optima O(nm) siendo n y m el tamaño de las cadenas.
ArrayList<Integer> secuencial(String txt, String pat){       //Se reciben sólo la cadena original y el patrón a buscar.
  ArrayList<Integer> list = new ArrayList<Integer>();        //Se declara ArrayList para guardar cuantas incidencias se encuentren.
  int j;                                                     //Se declara la variable por fuera j por fuera del for para poder evaluar su estado una vez que se salga del ciclo.
  for( int i = 0; i <= txt.length() - pat.length(); i++ ){   //Primer for que recorre la cadena original, visita casilla por casilla y desde ahí se empieza una busqueda del patrón.
    for( j = 0; j < pat.length() && pat.charAt(j) == txt.charAt(i+j); j++ ); 
    /*
        Se usa la variable declarada afuera y se encarga de que no entre a casillas fuera del patrón y mientras sigan siendo iguales los caracteres visitados va a seguir
        buscando, cuando encuentre 2 char distintos o terminé de evaluar todo el patrón se va a salir.
    */
    if( j == pat.length() ) list.add(i); //Si se encontró el patrón completo va a guardar la posicion en el ArrayList
  }   
  return list; //Regresa todas las incidencias.
}
//Boyer–Moore–Horspool algorithm, O(n + m) siendo n y m el tamaño de las cadenas. Con peor caso de O(nm)
ArrayList<Integer> bmh(String txt, String pat){              //Se reciben sólo la cadena original y el patrón a buscar.
  ArrayList list = new ArrayList<Integer>();                 //Lista de enteros para guardar las incidencias que se encuentren entre el patrón y el texto
  //int arr[] = new int[26], sal = 0, cont = 0;              //Si se garantizan puros char del alfabeto se puede ahorrar memoria
  int arr[] = new int[255], sal = 0, cont = 0;               //Si no, se debe usar un arreglo para guardar todos los elementos del ASCII, dos variables auxiliares son declaradas.
  for( int i = 0; i < pat.length() - 1; i++ )                //Se recorre todo el patrón para hacer el cálculo de posiciones, se usa el concepto de cubetas.
    //arr[(int)pat.charAt(i)-97] = pat.length() - i - 1;     //Adaptación para sólo caracteres
    arr[(int)pat.charAt(i)] = pat.length() - i - 1;          //Se asigna cada char a su valor correspondiente en el arreglo.
  while( sal + pat.length() <= txt.length() ){               //Mientras se puedan comparar los caracteres, y no se exceda el tamaño del arreglo original, va a entrar al ciclo
    while( cont < pat.length() && txt.charAt(sal) == pat.charAt(cont) ){ sal++; cont++; } //Compara e incrementa a las 2 variables mientras los caracteres sean iguales, y no exceda al patrón
    if( cont == pat.length() ) list.add(sal - pat.length()); //Si el contador llega al tamaño del patrón significa que lo encontró y lo agrega a las incidencias
    sal -= cont;                                             //Se devuelve la variable del texto a donde empezó a buscar
    //sal += arr[txt.charAt(sal + pat.length() - 1) - 97] == 0? pat.length(): arr[txt.charAt(sal + pat.length() - 1) - 97]; //Si el ultimo caracter donde se empalman las cadenas equivale 0, da un salto del tamaño del patrón
    sal += arr[txt.charAt(sal + pat.length() - 1)] == 0? pat.length(): arr[txt.charAt(sal + pat.length() - 1)];             //Y si no, le asigna el salto correspondiente
    cont = 0;                                                                                                               //Se resetea la variable para siguiente iteración
  } 
  return list;                                               //Usado para regresar todas las incidencias
}
//Knuth–Morris–Pratt algorithm. O(n + m)
ArrayList<Integer> kmp(String txt, String pat){      //Se reciben sólo la cadena original y el patrón a buscar.
  ArrayList<Integer> list = new ArrayList<Integer>();//Se declara ArrayList para guardar cuantas incidencias se encuentren.
  int reg[] = new int[pat.length()], est;            //Se declara el arreglo de regresos y una variable que va a estár navegando en él.
  reg[0] = -1;                                       //Primer elemento se inicializa en -1 como dicta el algoritmo.
  for( int i = 1; i < pat.length(); i++ ){           //Se recorre cada casilla desde la posición 1 hasta el final del patrón para precalcular el arreglo de regresos
    est = reg[i-1] + 1;                              //Se intenta asignar el valor anterior + 1 a la posición actual del arreglo 
      while( pat.charAt(est) != pat.charAt(i) ){     //Entra al while en caso de que no sea posible asignar el numero que se esperaba
      est = est == 0? -1: reg[reg[i-1]];             //Mientras no se ajuste ningún numero, va a regresarse en el arreglo. El caso base es 0 y se asigna -1.
      if( est == -1 ) break;                         //En caso de que se haya asignado el -1, debe salir del while para evitar problemas.
    }
    reg[i] = est;                                    //Se guarda el valor definitivo a nuestro arreglo de regresos.
  }
  est = 0;                                           //Comenzamos reiniciando la variable para que se mueva ahora en el arreglo original.
  for( int i = 0; i < txt.length(); i++ ){           //Recorremos todo el texto donde se quiere encontrar el patrón.
    while( txt.charAt(i) != pat.charAt(est) ){       //Mismo caso, va a entrar al while si no se puede usar el valor esperado.
      est = est == 0? -1: reg[est-1] + 1;            //Si estamos en el caso base (0) se asigna el -1, si no va a seguir intentando en el regreso.
      if( est < 0 ) break;                           //Para evitar problemas, salimos si vale menos de 0
    }
    if( est == pat.length() -1 ) list.add(i + 1 - pat.length()); //Al momento de salir, si se logró llevar estado al tamaño del patrón significa que funcionó y se guarda el valor de la incidencia en la lista.
    est = (est == pat.length() - 1? reg[est-1] + 1: est) + 1; //Si se llegó al final del patrón se hace un regreso, si no se queda como está y al final se le suma 1 para que intente en la siguiente casilla.
  }
  return list;                                       //Al final se regresa la lista de incidencias.  
}
