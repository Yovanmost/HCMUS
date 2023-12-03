#include "Ball.h"

Ball* Ball::getInstance(){
    if (instance == nullptr)
        instance = new Ball();
    return instance;
}

Ball* Ball::getInstance(int spd, int sze){
    if (instance == nullptr)
        instance = new Ball(spd, sze);
    return instance;
}

void Ball::deleteInstance(){
    if (instance){
        delete instance;
        instance = nullptr;
    }
}

Ball::~Ball(){

}

int Ball::getSpeed(){
    return speed;
}
void Ball::setSpeed(int spd){
    this->speed = spd;
}

int Ball::getSize(){
    return size;
}

void Ball::setSize(int sze){
    this->size = sze;
}

