#ifndef BALL_H
#define BALL_H

#pragma once
#include <vector>

class Bar{

};

class Ball{
private:
    static Ball* instance;
    int speed;
    int size;

    Ball(){}
    Ball(int spd, int sze) : speed(spd), size(sze){}
public:
    
    static Ball* getInstance();
    static Ball* getInstance(int spd, int sze);

    static void deleteInstance();

    ~Ball();

    int getSpeed();
    void setSpeed(int spd);

    int getSize();
    void setSize(int sze);
};

class Brick{

};

class Game{
    std::vector<Brick*> bricks;
    Bar* bar;
    Ball* ball;
};

#endif