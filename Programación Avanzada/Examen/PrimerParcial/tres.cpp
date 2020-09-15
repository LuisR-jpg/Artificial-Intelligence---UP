#include <iostream>
using namespace std;
struct quizzes{
  double midTerm, finalScore, totalScore;
};
class Student{
  public:
    long long ID;
    string Name;
    string Sex;
    quizzes Scores;

    Student();
    Student(long long, string, string, quizzes);
    void showmax(Student[], int);
    void showmin(Student[], int);
    ~Student();
};
Student::Student(){}
Student::Student(long long _ID, string _Name, string _Sex, quizzes _Scores){
  ID = _ID;
  Name = _Name;
  Sex = _Sex;
  Scores = _Scores;
}
Student::~Student(){}
void showmax(Student al[], int n){
  int p;
  double m = -5;
  for( int i = 0; i < n; i++ ){
    if( al[i].Scores.totalScore > m ){
      m = al[i].Scores.totalScore;
      p = i;
    }
  }
  cout << al[p].Name << "/" << al[p].Scores.midTerm << "/" << al[p].Scores.finalScore << "/" << al[p].Scores.totalScore << endl;
}
void showmin(Student al[], int n){
  int p;
  double m = 500000;
  for( int i = 0; i < n; i++ ){
    if( al[i].Scores.totalScore < m ){
      m = al[i].Scores.totalScore;
      p = i;
    }
  }
  cout << al[p].Name << "/" << al[p].Scores.midTerm << "/" << al[p].Scores.finalScore << "/" << al[p].Scores.totalScore << endl;
} 
int main(){
  Student group[5];
  for( int o = 0; o < 5; o++ ){
    long long i;
    string a, b;
    double x, y, z;
    cin >> i;
    cin.ignore();
    getline(cin, a);
    getline(cin, b);
    cin >> x >> y;
    quizzes aux;
    aux.midTerm = x;
    aux.finalScore = y;
    aux.totalScore = (x + y)/2;
    group[o] = Student(i, a, b, aux);
//    cout << group[o].Name << "/" << group[o].Scores.midTerm << "/" << group[o].Scores.finalScore << "/" << group[o].Scores.totalScore << endl;
  }
  showmax(group, 5);
  showmin(group, 5);
  return 0;
}
