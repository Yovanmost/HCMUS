#include "Employee.h"

Employee::Employee() : name(), yearIn(0), baseSalary(0){

}

Employee::Employee(std::string name) : name(name), yearIn(0), baseSalary(0){

}

Employee::Employee(std::string name, int yearIn) : name(name), yearIn(yearIn), baseSalary(0){

}

Employee::Employee(std::string name, int yearIn, float baseSalary) : name(name), yearIn(yearIn), baseSalary(baseSalary){

}

Employee::Employee(const Employee &p){
    this->name = p.name;
    this->yearIn = p.yearIn;
    this->baseSalary = p.baseSalary;
}

Employee::~Employee(){

}

void Employee::setBaseSalary(float baseSalary){
    this->baseSalary = baseSalary;
}

float Employee::getBaseSalary(){
    return baseSalary;
}

float Employee::calculateBaseSalary(){
    getBaseSalary();
}

std::ostream& operator<<(std::ostream& out, const Employee& e){
    std::cout << "+Name: " << e.name
                << " +Base salary: " << e.baseSalary
                << " +Year joined: " << e.yearIn;
    return out;
}

std::string Employee::getName(){
    return this->name;
}

// -------------------------------------------------------------------

Employee_production::Employee_production() : employee(), numberOfProduct(0), v(), salary(0){

}

Employee_production::Employee_production(Employee e) : employee(e), numberOfProduct(0), v(), salary(0){

}

Employee_production::Employee_production(Employee e, float salary) : employee(e), numberOfProduct(0), v(), salary(salary){

}

Employee_production::Employee_production(Employee e, int numOfProduct) : employee(e), numberOfProduct(numOfProduct), v(), salary(0){

}

Employee_production::Employee_production(const Employee_production &p){
    this->employee = p.employee;
    this->numberOfProduct = p.numberOfProduct;
    this->salary = p.salary;
}

Employee_production::~Employee_production(){

}

void Employee_production::setSalary(int numberOfProduct, float baseSalary, float salary){
    this->numberOfProduct = numberOfProduct;
    this->employee.setBaseSalary(baseSalary);
    this->salary = salary;
}

float Employee_production::getSalary(){
    return this->salary;
}

float Employee_production::calculateSalary(){
    float baseSalary = this->employee.getBaseSalary();
    this->salary = baseSalary + numberOfProduct * v;
    return this->salary;
}

std::ostream& operator<<(std::ostream& out, const Employee_production& e){
    std::cout << e.employee 
                << " +Number of product: " << e.numberOfProduct
                << " +Salary: " << std::fixed << std::setprecision(2) << e.salary * 1.0;
    return out;
}

// // -------------------------------------------------------------------

Employee_management::Employee_management() : employee(), level(1), bonus(0){

}

Employee_management::Employee_management(Employee e, int level) : employee(e), level(level), bonus(0), salary(0){

}

Employee_management::Employee_management(Employee e, int level, float bonus) : employee(e), level(level), bonus(bonus), salary(0){

}

Employee_management::Employee_management(Employee e, int level, float bonus, float salary) : employee(e), level(level), bonus(bonus), salary(salary){

}

Employee_management::Employee_management(const Employee_management &p){
    this->employee = p.employee;
    this->level = p.level;
    this->bonus = p.bonus;
    this->salary = p.salary;
}

Employee_management::~Employee_management(){

}

void Employee_management::setSalary(int level, float bonus, float baseSalary, float salary){
    this->level = level;
    this->bonus = bonus;
    this->employee.setBaseSalary(baseSalary);
    this->salary = salary;
}

float Employee_management::getSalary(){
    return this->salary;
}

float Employee_management::calculateSalary(){
    float baseSalary = this->employee.getBaseSalary();
    this->salary = baseSalary * level + bonus;
    return this->salary;
}

std::ostream& operator<<(std::ostream& out, const Employee_management& e){
    std::cout << e.employee
                << " +Level: " << e.level
                << " +Bonus: " << e.bonus
                << " +Salary: " << std::fixed << std::setprecision(2) << e.salary;
    return out;
}


// -------------------------------------------------------------------

Employee_office::Employee_office() : employee(), workDays(0), allowance(0){

}

Employee_office::Employee_office(Employee e, int workDays) : employee(e), workDays(workDays), allowance(0), salary(0){

}

Employee_office::Employee_office(Employee e, int workDays, float allowance) : employee(e), workDays(workDays), allowance(allowance), salary(0){

}

Employee_office::Employee_office(Employee e, int workDays, float allowance, float salary) : employee(e), workDays(workDays), allowance(allowance), salary(salary){

}

Employee_office::Employee_office(const Employee_office &p){
    this->employee = p.employee;
    this->workDays = p.workDays;
    this->allowance = p.allowance;
    this->salary = p.salary;
}

Employee_office::~Employee_office(){

}

void Employee_office::setSalary(int workDays, float allowance, float baseSalary){
    this->workDays = workDays;
    this->allowance = allowance;
    this->employee.setBaseSalary(baseSalary);
    this->salary = salary;
}

float Employee_office::getSalary(){
    return this->salary;
}

float Employee_office::calculateSalary(){
    float baseSalary = this->employee.getBaseSalary();
    this->salary = baseSalary + workDays*v + allowance;
    return this->salary;
}

std::ostream& operator<<(std::ostream& out, const Employee_office& e){
    std::cout << e.employee 
                << " +Number of work days: " << e.workDays
                << " +Allowance: " << e.allowance
                << " +Salary: " << std::fixed << std::setprecision(2) << e.salary;
    return out;
}