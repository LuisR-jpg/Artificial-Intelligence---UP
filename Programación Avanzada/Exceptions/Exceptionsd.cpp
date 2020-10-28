#include <iostream>
using namespace std;
class canGoWrong{
    public:
        canGoWrong(){
            char *pMemory = new char[9999999999999999];
            delete [] pMemory;
        }
};
int main(){
    try{
        canGoWrong wrong;
    }
    catch(bad_alloc &e){
        cout<<"Caught exception: "<< e.what()<<endl;
    }

    cout <<"Still running"<<endl;
    return 0;
}
