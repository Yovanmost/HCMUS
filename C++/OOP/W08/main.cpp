#include <iostream>
#include "Ball.h"
#include "Ball.cpp"

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

int main(){
    demo1();

    return 0;
}