#include <iostream>
using namespace std;

struct FRACTION
{
    int numerator;
    int denominator;
};

void inputFraction(FRACTION &a){
    cout << "Input numerator: ";
    cin >> a.numerator;
    cout << "Input denominator: ";
    cin >> a.denominator;
}

bool checkValid(FRACTION &a){
    if (a.denominator == 0)
        return false;
    return true;
}

int eculid(FRACTION a){
    int x;
    for (int i = 1; i <= (a.denominator < a.numerator ? a.denominator : a.numerator); i++){
        if (a.denominator % i == 0 && a.numerator % i == 0)
            x = i;
    }
    return x;
}


FRACTION simplifyFraction(FRACTION a, FRACTION &newFraction){
    int same = eculid(a);
    newFraction.denominator = a.denominator / same;
    newFraction.numerator = a.numerator / same;
}

FRACTION subtractionFraction(FRACTION a, FRACTION b){
    FRACTION c;
    c.numerator = a.numerator*b.denominator - b.numerator*a.denominator;
    c.denominator = a.denominator*b.denominator;
    return c;
}

int main(){
    FRACTION a, b, c, d;
    inputFraction(a);
    inputFraction(b);
    c = subtractionFraction(a, b);
    simplifyFraction(c, d);
    cout << d.numerator << '/' << d.denominator;
    
    
    

    return 0;
}