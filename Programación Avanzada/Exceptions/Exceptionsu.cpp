#include <iostream>
using namespace std;

void mightGoWrong(){
    bool error = true;
    bool error2 = true;

    if(error){
        throw "8";
        //throw "Something get wrong";
    }

    if(error2){
        throw "Something get wrong";
    }

}

int main(){
    try{
        mightGoWrong();
    }
    catch(int e){
       cout<<"Error code:" << e << endl; 
    }
    catch(char const *e){
        cout<<"Error message: " << e << endl; 
    }

    cout<<"Still running"<<endl;
    return 0;
}
