#include "Employee_production.h"

Employee_production::Employee_production() : employee(), numberOfProduct(0), v(2000){

}

Employee_production::Employee_production(Employee e) : employee(e), numberOfProduct(0), v(2000){

}

Employee_production::Employee_production(std::string name, int yearIn, int numOfProduct) : employee(name, yearIn), numberOfProduct(numOfProduct), v(2000){

}

Employee_production::Employee_production(Employee e, int numOfProduct) : employee(e), numberOfProduct(numOfProduct), v(2000){

}

Employee_production::Employee_production(Employee_production &p){
    this->employee = p.employee;
    this->numberOfProduct = p.numberOfProduct;
    this->v = p.v;

}



Employee_production::~Employee_production(){

}