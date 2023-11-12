#ifndef OXY_H
#define OXY_H

#pragma once

#include <iostream>
#include <math.h>

class Oxy{
private:
    double x;
    double y;
public:
    Oxy();
    // Oxy(double, double);
    ~Oxy();
    void input();
    void output();
    double distance(Oxy);
    double getX();
    double getY();
    void setX(double);
    void setY(double);
        
    
};

#endif