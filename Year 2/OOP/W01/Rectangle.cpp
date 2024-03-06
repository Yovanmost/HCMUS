#include "Rectangle.h"

Rectangle::Rectangle(){

}

Rectangle::~Rectangle(){

}

void Rectangle::input(){
    std::cout << "Upper left\n";
    upLeft.input();
    std::cout << "Upper right\n";
    upRight.input();
    std::cout << "Bottom right\n";
    botRight.input();
    std::cout << "Bottom left\n";
    botLeft.input();    
}

void Rectangle::output(){
    std::cout << "Upper left ";
    upLeft.output();
    std::cout << "\nUpper right ";
    upRight.output();
    std::cout << "\nBottom right ";
    botRight.output();
    std::cout << "\nBottom left ";
    botLeft.output();    
}

/*compare the 4 corners' distance to the center of the rectangle 
(if all the distances are the same then this is a rectangle)*/ 
bool Rectangle::isRectangle(){
    Oxy center;
    // find the center coordinate
    center.setX((upLeft.getX() + upRight.getX() +
                botRight.getX() + botLeft.getX()) / 4);

    center.setY((upLeft.getY() + upRight.getY() +
                botRight.getY() + botLeft.getY()) / 4); 

    // std::cout << "(" << center.getX() << " " << center.getY() << ")\n";
    
    // the distance from the center of the rectangle to its 4 corners is the same
    return center.distance(upLeft) == center.distance(upRight) && 
            center.distance(upLeft) == center.distance(botRight) && 
            center.distance(upLeft) == center.distance(botLeft);
}

double Rectangle::getPerimeter(){
    if (!isRectangle())
        return 0;
    return (upLeft.distance(upRight) + upLeft.distance(botLeft)) / 2;
}

double Rectangle::getArea(){
    if (!isRectangle())
        return 0;
    return (upLeft.distance(upRight) * upLeft.distance(botLeft));
}
