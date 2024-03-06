#ifndef EMPLOYEE_H
#define EMPLOYEE_H

#pragma once
#include <string>

class Employee{
private:
    std::string name;
    int yearIn;
    float salary;

public:
    Employee();
    Employee(std::string);
    Employee(std::string, int);
    Employee(std::string, int, float);
    Employee(const Employee& p);
    ~Employee();

    void setSalary(float salary);
    float getSalary();
    float calculateSalary();
};

// -------------------------------------------------------------------

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
    Employee_production(const Employee_production &p);
    ~Employee_production();

    void setSalary(int, float);
    float getSalary();
    float calculateSalary();
};

// -------------------------------------------------------------------

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
    Employee_management(const Employee_management &p);
    ~Employee_management();

    void setSalary(int, float, float);
    float getSalary();
    float calculateSalary();
};

// -------------------------------------------------------------------

class Employee_office : public Employee{
private:
    Employee employee;
    int workDays;
    float allowance;
    int v = 100000;
public:
    Employee_office();
    Employee_office(Employee, int);
    Employee_office(Employee, float);
    Employee_office(Employee, int, float);
    Employee_office(const Employee_office &p);
    ~Employee_office();

    void setSalary(int, float, float);
    float getSalary();
    float calculateSalary();
};

#endif