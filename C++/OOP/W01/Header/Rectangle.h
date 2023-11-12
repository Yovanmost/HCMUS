#ifndef RECTANGLE_H
#define RECTANGLE_H

#pragma once
#include "Oxy.h"
#include "Oxy.h"

class Rectangle : public Oxy{
private:
    Oxy upLeft;
    Oxy upRight;
    Oxy botRight;
    Oxy botLeft;


public:
    Rectangle();
    ~Rectangle();
    void input();
    void output();
    bool isRectangle();
    double getPerimeter();
    double getArea();
};

#endif