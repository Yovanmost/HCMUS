#include "Employee.h"

Employee::Employee() : name(), yearIn(0), salary(0){

}

Employee::Employee(std::string name) : name(name), yearIn(0), salary(0){

}

Employee::Employee(std::string name, int yearIn) : name(name), yearIn(yearIn), salary(0){

}

Employee::Employee(std::string name, int yearIn, float salary) : name(name), yearIn(yearIn), salary(salary){

}

Employee::Employee(const Employee &p){
    this->name = p.name;
    this->yearIn = p.yearIn;
    this->salary = p.salary;
}

Employee::~Employee(){

}

void Employee::setSalary(float salary){
    this->salary = salary;
}

float Employee::getSalary(){
    return salary;
}

float Employee::calculateSalary(){
    getSalary();
}

// -------------------------------------------------------------------

Employee_production::Employee_production() : employee(), numberOfProduct(0), v(2000){

}

Employee_production::Employee_production(Employee e) : employee(e), numberOfProduct(0), v(2000){

}

Employee_production::Employee_production(std::string name, int yearIn, int numOfProduct) : employee(name, yearIn), numberOfProduct(numOfProduct), v(2000){

}

Employee_production::Employee_production(Employee e, int numOfProduct) : employee(e), numberOfProduct(numOfProduct), v(2000){

}

Employee_production::Employee_production(const Employee_production &p){
    this->employee = p.employee;
    this->numberOfProduct = p.numberOfProduct;
    this->v = p.v;

}

Employee_production::~Employee_production(){

}

void Employee_production::setSalary(int numberOfProduct, float salary){
    this->numberOfProduct = numberOfProduct;
    this->employee.setSalary(salary);
}

float Employee_production::getSalary(){
    return this->employee.getSalary();
}

float Employee_production::calculateSalary(){
    float salary = this->employee.getSalary();
    this->employee.setSalary(salary + numberOfProduct * v);
    return this->employee.getSalary();
}

// -------------------------------------------------------------------

Employee_management::Employee_management() : employee(), level(1), bonus(0){

}

Employee_management::Employee_management(Employee e, int level) : employee(e), level(level), bonus(0){

}

Employee_management::Employee_management(Employee e, float bonus) : employee(e), level(1), bonus(bonus){

}

Employee_management::Employee_management(Employee e, int level, float bonus) : employee(e), level(level), bonus(bonus){

}

Employee_management::Employee_management(const Employee_management &p){
    this->employee = p.employee;
    this->level = p.level;
    this->bonus = p.bonus;
}

Employee_management::~Employee_management(){

}

void Employee_management::setSalary(int level, float bonus, float salary){
    this->level = level;
    this->bonus = bonus;
    this->employee.setSalary(salary);
}

float Employee_management::getSalary(){
    return this->employee.getSalary();
}

float Employee_management::calculateSalary(){
    float salary = this->employee.getSalary();
    this->employee.setSalary(salary * level + bonus);
    return this->employee.getSalary();
}

// -------------------------------------------------------------------

Employee_office::Employee_office() : employee(), workDays(0), allowance(0){

}

Employee_office::Employee_office(Employee e, int workDays) : employee(e), workDays(workDays), allowance(0){

}

Employee_office::Employee_office(Employee e, float allowance) : employee(e), workDays(0), allowance(allowance){

}

Employee_office::Employee_office(Employee e, int workDays, float allowance) : employee(e), workDays(workDays), allowance(allowance){

}

Employee_office::Employee_office(const Employee_office &p){
    this->employee = p.employee;
    this->workDays = p.workDays;
    this->allowance = p.allowance;

}

Employee_office::~Employee_office(){

}

void Employee_office::setSalary(int workDays, float allowance, float salary){
    this->workDays = workDays;
    this->allowance = allowance;
    this->employee.setSalary(salary);
}

float Employee_office::getSalary(){
    return this->employee.getSalary();
}

float Employee_office::calculateSalary(){
    float salary = this->employee.getSalary();
    this->employee.setSalary(salary + workDays*v + allowance);
    return this->employee.getSalary();
}