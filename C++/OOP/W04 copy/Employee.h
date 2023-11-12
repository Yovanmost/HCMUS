#ifndef EMPLOYEE_H
#define EMPLOYEE_H

#pragma once
#include <string>
#include <iostream>
#include <iomanip>

class Employee{
private:
    std::string name;
    int yearIn;
    float baseSalary;

public:
    Employee();
    Employee(std::string);
    Employee(std::string, int);
    Employee(std::string, int, float);
    Employee(const Employee& p);
    ~Employee();

    void setBaseSalary(float salary);
    float getBaseSalary();
    float calculateBaseSalary();
    virtual std::string getName();

    friend std::ostream& operator<<(std::ostream&, const Employee& e);
};

// -------------------------------------------------------------------

class Employee_production : public Employee{
private:
    Employee employee;
    int numberOfProduct;
    int v = 2000;
    float salary;
public:
    Employee_production();
    Employee_production(Employee);
    Employee_production(Employee, float);
    Employee_production(Employee, int);
    Employee_production(const Employee_production &p);
    ~Employee_production();

    void setSalary(int, float, float);
    float getSalary();
    float calculateSalary();

    friend std::ostream& operator<<(std::ostream&, const Employee_production& e);
    std::string getName(){
        return this->employee.getName();
    }
};

// -------------------------------------------------------------------

class Employee_management : public Employee{
private:
    Employee employee;
    int level;
    float bonus;
    float salary;
public:
    Employee_management();
    Employee_management(Employee, int);
    Employee_management(Employee, int, float);
    Employee_management(Employee, int, float, float);
    Employee_management(const Employee_management &p);
    ~Employee_management();

    void setSalary(int, float, float, float);
    float getSalary();
    float calculateSalary();

    friend std::ostream& operator<<(std::ostream&, const Employee_management& e);
    std::string getName(){
        return this->employee.getName();
    }
};

// -------------------------------------------------------------------

class Employee_office : public Employee{
private:
    Employee employee;
    int workDays;
    float allowance;
    int v = 100000;
    float salary;
public:
    Employee_office();
    Employee_office(Employee, int);
    Employee_office(Employee, int, float);
    Employee_office(Employee, int, float, float);
    Employee_office(const Employee_office &p);
    ~Employee_office();

    void setSalary(int, float, float);
    float getSalary();
    float calculateSalary();

    friend std::ostream& operator<<(std::ostream&, const Employee_office& e);
    std::string getName(){
        return this->employee.getName();
    }
};

#endif