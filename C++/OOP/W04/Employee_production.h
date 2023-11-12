#ifndef EMPLOYEE_PRODUCTION_H
#define EMPLOYEE_PRODUCTION_H

#pragma once
#include "Employee.h"

class Employee_production : public Employee{
private:
    Employee employee;
    int numberOfProduct;
    int v;
public:
    Employee_production();
    Employee_production(Employee);
    Employee_production(std::string, int, int);
    Employee_production(Employee, int);
    Employee_production(Employee_production &p);


    ~Employee_production();
};

#endif