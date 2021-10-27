#include <bits/stdc++.h>
using namespace std;
mutex mX;
const int THREADS = 4; //Número máximo de hilos.
int a[1000], maxG = INT_MIN; 
void f(int j, int l, int r){
  int m = INT_MIN;
  for(int i = l; i < r; i++) //Itera del rango [l, r)
    m = max(a[i], m); //Se actualiza el máximo en rango de iteración.
	mX.lock(); //Se bloquea la memoria para segura modificación.
	cout << "Hilo " << j << ": [" << l << ", " << r << ") -> " << m << endl;
  maxG = max(maxG, m); //Se actualiza el valor máximo global.
	mX.unlock(); //Se desbloquea la memoria.
}
int main(){
  int n;
	thread threads[THREADS];
  cin >> n;
  for(int i = 0; i < n; cin >> a[i++]);
  int p = n/THREADS + (n % THREADS != 0); //Se calcula el tamaño óptimo del subarreglo asignado a cada hilo.
  for(int i = 0, j = 0; i < n; i += p, j++){ 
		threads[j] = thread(f, j, i, min(i + p, n)); //Se inicializa cada hilo con su rango correspondiente.
		threads[j].join();
	}
  cout << "Maximo Global: " << maxG << endl;
  return 0;
}


