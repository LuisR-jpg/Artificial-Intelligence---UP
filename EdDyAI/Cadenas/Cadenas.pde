void setup(){
  /*String txt = "xoxxooxxoxxxoxooxoxoxoxxo";
  String pat = "xoxoxxo";*/
  /*String txt = "ccaabcaabxaacaabcaabcaabcabdaa";
  String pat = "caabcaabca";*/
  /*String txt = "111100001101110011101111";
  String pat = "111";*/
  /*String txt = "aaaaooooaaoaaaooaaaoaaaa";
  String pat = "aaa";*/
  /*String txt = "abaaabaacaa";
  String pat = "aa";
  txt = txt.toLowerCase();
  pat = pat.toLowerCase();
  println(txt + "\n" + pat);
  println("Busqueda secuencial:\t", secuencial(txt, pat));
  println("Busqueda con BMH:\t", bmh(txt, pat));
  println("Busqueda con KMP:\t", kmp(txt, pat));*/
  //String c1 = "casa", c2= "taza";
  //String c1 = "escuela", c2= "estudiante";
  //String c1 = "universidad", c2= "universitario";*/
  String c1 = "escuela", c2 = "esscuela";
  println(c1, c2);
  println("Distancia con Hamming:", hamming(c1.toLowerCase(), c2.toLowerCase()));  
  println("Distancia con Levenshtein:", levenshtein(c1.toLowerCase(), c2.toLowerCase()));
}
