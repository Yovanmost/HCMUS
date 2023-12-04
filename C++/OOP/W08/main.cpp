#include <iostream>
#include <vector>
#include "Ball.h"
#include "Circuit.h"
#include "Ball.cpp"
#include "Circuit.cpp"

using namespace std;

Ball* Ball::instance = nullptr;

void demo1(){
    int spd, sze;
    cout << "Input speed: ";
    cin >> spd;
    cout << "Input size: ";
    cin >> sze;
    Ball* testBall = Ball::getInstance(spd, sze);
    cout << "Ball speed: " << testBall->getSpeed()
        << "\nBall size: " << testBall->getSize();

    cout << "\nChange speed and size\n";
    cout << "Input speed: ";
    cin >> spd;
    cout << "Input size: ";
    cin >> sze;
    testBall->setSpeed(spd);
    testBall->setSize(sze);

    cout << "After the change:\n";
    cout << "Ball speed: " << testBall->getSpeed()
        << "\nBall size: " << testBall->getSize();

    Ball::deleteInstance();
}

/*
ex0: Au = 5, 
     Ai = 1
----A----

ex1: Au = 5, Bu = 3, 
     Ai = Bi = 1
----A----B----

ex2: Au = 5, Bu = 3, 
     Ai = Bi = 1
    ----A----
---|         |----
    ----B----

ex3: Au = 5, Bu = 3, Cu = 4, Du = 2, Eu = 1, 
     Ai = Bi = Ci = Di = Ei = 1
(series Z - the whole circuit = A + S + E)
            (series X)
            ^
            |
         ----B--------- 
----A---|              |----E-----
         ----C----D----
            |
            V
            (series Y)
(parallel S = X + Y)
*/

void demo2(){
    SingleCircuit A(5, 1), B(3, 1), C(4, 1), D(2,1), E(1, 1);
    cout << "See the example circuit in file \"Circuit_Example\" in folder \"Other\" \n";
    cout << "ex0: A's resistance: " << A.getResistance() << '\n';

    SeriesCircuit ex1;
    ex1.addCircuit(&A);
    ex1.addCircuit(&B);
    cout << "ex1 resistance: " << ex1.getResistance() << '\n';

    ParallelCircuit ex2;
    ex2.addCircuit(&A);
    ex2.addCircuit(&B);
    cout << "ex2 resistance: " << ex2.getResistance() << '\n';

    SeriesCircuit X, Y, Z;
    X.addCircuit(&B);

    Y.addCircuit(&C);
    Y.addCircuit(&D);

    ParallelCircuit S;
    S.addCircuit(&X);
    S.addCircuit(&Y);

    Z.addCircuit(&A);
    Z.addCircuit(&S);
    Z.addCircuit(&E);
    
    cout << "ex3:\n";
    cout << "Parallel S resistance: " << S.getResistance() << '\n';
    cout << "Series Z (the total circuit) resistance: " << Z.getResistance() << '\n';
}

int main(){
    // demo1();
    demo2();

    return 0;
}