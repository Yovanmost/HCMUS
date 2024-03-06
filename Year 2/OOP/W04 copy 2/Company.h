#ifndef COMPANY_H
#define COMPANY_H

#pragma once
#include "Employee.h"
#include <vector>

class Company : public Employee_production, public Employee_management, public Employee_office{
private:
    std::string companyName;
    std::vector<Employee_management> listEmployeeManagement;
    std::vector<Employee_office> listEmployeeOffice;
    std::vector<Employee_production> listEmployeeProduction;
public:
    Company();
    Company(std::string name);
    ~Company();

    void addEmployeeManagement(Employee_management);
    void addEmployeeManagement(std::vector<Employee_management>);

    void addEmployeeOffice(Employee_office);
    void addEmployeeOffice(std::vector<Employee_office>);

    void addEmployeeProduction(Employee_production);
    void addEmployeeProduction(std::vector<Employee_production>);

    void printListEmployeeManagement();
    void printListEmployeeOffice();
    void printListEmployeeProduction();

    float totalSalary();

    bool findEmployee(const std::string);
    void testGetName();
};

#endif