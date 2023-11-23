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
    void setName(std::string name);
    float getBaseSalary();
    float calculateBaseSalary();
    virtual std::string getName();

    friend std::ostream& operator<<(std::ostream&, const Employee& e);
};

// -------------------------------------------------------------------

class Employee_production : public Employee{
private:
    // Employee employee;
    int numberOfProduct;
    int v = 2000;
    float salary;
public:
    Employee_production();
    Employee_production(const Employee &e);
    Employee_production(const Employee &e, float);
    Employee_production(const Employee &e, int);
    Employee_production(const Employee_production &p);
    ~Employee_production();

    void setSalary(int, float, float);
    float getSalary();
    float calculateSalary();

    friend std::ostream& operator<<(std::ostream&, const Employee_production& e);
};

// // -------------------------------------------------------------------

class Employee_management : public Employee{
private:
    int level;
    float bonus;
    float salary;
public:
    Employee_management();
    Employee_management(const Employee &e, int);
    Employee_management(const Employee &e, int, float);
    Employee_management(const Employee &e, int, float, float);
    Employee_management(const Employee_management &p);
    ~Employee_management();

    void setSalary(int, float, float, float);
    float getSalary();
    float calculateSalary();

    friend std::ostream& operator<<(std::ostream&, const Employee_management& e);
};

// // -------------------------------------------------------------------

class Employee_office : public Employee{
private:
    int workDays;
    float allowance;
    int v = 100000;
    float salary;
public:
    Employee_office();
    Employee_office(const Employee &e, int);
    Employee_office(const Employee &e, int, float);
    Employee_office(const Employee &e, int, float, float);
    Employee_office(const Employee_office &p);
    ~Employee_office();

    void setSalary(int, float, float);
    float getSalary();
    float calculateSalary();

    friend std::ostream& operator<<(std::ostream&, const Employee_office& e);
};

#endif