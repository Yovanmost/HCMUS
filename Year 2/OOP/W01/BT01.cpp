#include <iostream>
#include "Fraction.h"
#include "Fraction.cpp"

using namespace std;

int main(){
    Fraction a,b;

    cout << "Fraction a\n";
    a.input();
    cout << "Fraction b\b";
    b.input();
    
    Fraction tmp1, tmp2, tmp3, tmp4;
    tmp1 = a.add(b);
    tmp2 = a.subtract(b);
    tmp3 = a.multiply(b);
    tmp4 = a.divide(b);
    
    cout << "Addition:\n";
    tmp1.printWithADash();
    tmp1.printWithoutADash();

    cout << "Subtraction:\n";
    tmp2.printWithADash();
    tmp2.printWithoutADash();


    cout << "Multiplication:\n";
    tmp3.printWithADash();
    tmp3.printWithoutADash();

    cout << "Division:\n";
    tmp4.printWithADash();
    tmp4.printWithoutADash();

    return 0;
}