#include "test.h"
#include <iostream>

void foo::setA(int a){
    this->a = a;
}

void foo::print(){
    std::cout << a << '\n';
}