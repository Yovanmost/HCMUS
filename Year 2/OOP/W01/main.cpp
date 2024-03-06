#include <iostream>
#include "Fraction.h"
#include "Date.h"
#include "Oxy.h"
#include "Rectangle.h"
#include "Student.h"

using namespace std;

void demo1(){
    Fraction a, b;
    a.input();
    a.printWithADash();
    a.printWithoutADash();

    b.input();
    b.printWithADash();
    b.printWithoutADash();

    Fraction tmp;
    tmp = a.add(b);
    cout << "a + b = ";
    tmp.printWithADash();

    tmp = a.subtract(b);
    cout << "a - b = ";
    tmp.printWithADash();

    tmp = a.multiply(b);
    cout << "a * b = ";
    tmp.printWithADash();

    tmp = a.divide(b);
    cout << "a : b = ";
    tmp.printWithADash();

    cout << '\n';
}

void demo2(){
    Date a, b;

    cout << "Date a: ";
    a.input(20,10,2023);
    a.output();

    cout << "Date b: ";
    b.input(30,10,2023);
    b.output();
    
    cout << "Increase 1 day: ";
    a.increaseOneDay();
    a.output();

    cout << "Decrease 1 day: ";
    b.decreaseOneDay();
    b.output();
    
    int t = 0;
    cout << "Input n to increase a and decrease b n days: ";
    cin >> t;
    a.increaseNDays(t);
    cout << "Date a: ";
    a.output();
    b.decreaseNDays(t);
    cout << "Date b: ";
    b.output();

    if (a.compare(b) < 0)
        cout << "a smaller than b";
    if (a.compare(b) > 0)
        cout << "a bigger than b";
    else cout << "a is the same as b";

    cout << "\n\n";
}

void demo3(){
    Oxy a, b;
    cout << "Point a: ";
    a.input();
    a.output();
    cout << '\n';

    cout << "Point b: ";
    b.input();
    b.output();
    cout << '\n';

    cout << "Distance from a to b: " << a.distance(b);

    cout << "\n\n";
}

void demo4(){
    Rectangle a;
    a.input();
    a.output();
    if (a.isRectangle()){
        cout << "\nThis is a rectangle\n";
        cout << "Perimeter: " << a.getPerimeter() << '\n';
        cout << "Area: " << a.getArea() << '\n';
    }
    else cout << "\nNot a rectangle\n";

    cout << '\n';
}

void demo5(){
    Student a;
    a.input();
    a.output();
    cout << '\n';
}


int main(){

    //Bài 1
    cout << "Bai 1 ---------------\n";
    demo1();

    //Bài 2
    cout << "Bai 2 ---------------\n";
    demo2();
    
    // Bài 3
    cout << "Bai 3 ---------------\n";
    demo3();

    // Bài 4
    cout << "Bai 4 ---------------\n";
    demo4();

    // Bài 5
    cout << "Bai 5 ---------------\n";
    demo5();

    return 0;
}