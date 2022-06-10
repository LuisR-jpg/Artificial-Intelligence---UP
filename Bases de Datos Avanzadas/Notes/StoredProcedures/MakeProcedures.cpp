#include <bits/stdc++.h>
using namespace std;
int main() {
    string s;
    for(;;){
        cin >> s;
        cout << "delimiter $$" << endl;
        cout << "create procedure get_" << s << "()" << endl;
        cout << "begin" << endl;
        cout << "select *" << endl;
        cout << "from " << s << ";" << endl; 
        cout << "end$$" << endl;
        cout << "delimiter ;" << endl << endl;

    }
    return 0;
}