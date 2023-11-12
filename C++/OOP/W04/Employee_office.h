#ifndef EMPLOYEE_OFFICE_H
#define EMPLOYEE_OFFICE_H

#pragma once
#include "Employee.h"

class Employee_office : public Employee{
private:
    Employee employee;
    int workDays;
    int allowance;

public:
    Employee_office();
    ~Employee_office();
};



#endif