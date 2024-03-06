#ifndef EMPLOYEE_MANAGEMENT_H
#define EMPLOYEE_MANAGEMENT_H

#pragma once
#include "Employee.h"

class Employee_management : public Employee{
private:
    Employee employee;
    int level;
    float bonus;
public:
    Employee_management();
    Employee_management(Employee, int);
    Employee_management(Employee, float);
    Employee_management(Employee, int, float);
    Employee_management(Employee_management &p);

    ~Employee_management();
};

#endif