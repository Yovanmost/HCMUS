#ifndef COMPANY_H
#define COMPANY_H

#pragma once
#include "Employee.h"
#include <vector>

class Company : public Employee{
private:
    std::string companyName;
    // 1.
    std::vector<Employee*> listEmployee;
public:
    // std::vector<Employee*> listEmployee;
    Company();
    Company(std::string name);
    Company(const Company& cp);
    ~Company();

    void addEmployee(Employee*);
    void addEmployee(std::vector<Employee*>);

    // 2.
    void insert();
    friend std::istream& operator>>(std::istream& in, Company& cp);

    // 3.
    void printListEmployee();
    friend std::ostream& operator<<(std::ostream& out, Company& cp);

    // 4.
    float totalSalary();
    // 5.
    Employee* findHighestSalary();
    // 6.
    int countEmployeeProduction();
    // 7.
    int countEmployeeOffice();
    // 8.
    float avgSalary();
    // 9.
    void findLessThanXSalary(float x);
    // 10.
    Employee* findEmployeeByID(const std::string);
    // 11.
    Employee* findEmployeeByName(const std::string);
    // 12.
    int countEmployeeBornInXMonth(int x);
    
    

    

    

    
    

    void testGetName();
};

#endif