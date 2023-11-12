#include "Oxy.h"

Oxy::Oxy(){

}

// Oxy::Oxy(double x, double y){
//     this->x = x;
//     this->y = y;
// }

Oxy::~Oxy(){

}

void Oxy::input(){
    std::cout << "X: ";
    std::cin >> this->x;
    std::cout << "Y: ";
    std::cin >> this->y;
}

void Oxy::output(){
    std::cout << "(" << x << ", " << y << ")";
}

double Oxy::distance(Oxy another){
    return sqrt(pow(another.x - x, 2) + pow(another.y - y, 2));
}

double Oxy::getX(){
    return x;
}

double Oxy::getY(){
    return y;
}

void Oxy::setX(double x){
    this->x = x;
}

void Oxy::setY(double y){
    this->y = y;
}