#include <iostream>
#include "test.h"
#include "test.cpp"

using namespace std;


int main(){
    foo obj;
    obj.setA(5);
    obj.print();
    cout << sum(4,5);
    
    
    

    return 0;
}