#include <iostream>
#include <iomanip>
#include "Employee.h"
#include "Employee.cpp"

using namespace std;

int main(){
    Employee_management a(Employee("Nguyen Van A", 2020, 10000), 10, 100000);
    a.calculateSalary();
    cout << std::fixed << std::setprecision(2) << a.getSalary() << '\n';

    Employee_office b(Employee("Nguyen Van B", 2021, 20000), 30, 30000);
    b.calculateSalary();
    cout << std::fixed << std::setprecision(2) << b.getSalary() << '\n';

    Employee_production c(Employee("Nguyen Van C", 2022, 30000), 5000);
    c.calculateSalary();
    cout << std::fixed << std::setprecision(2) << c.getSalary() << '\n';




    return 0;
}