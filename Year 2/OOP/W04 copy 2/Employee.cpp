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

void Employee::setName(std::string name){
    this->name = name;
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

Employee_production::Employee_production() : Employee(), numberOfProduct(0), v(), salary(0){

}

Employee_production::Employee_production(const Employee &e) : Employee(e), numberOfProduct(0), v(), salary(0){

}

Employee_production::Employee_production(const Employee &e, float salary) : Employee(e), numberOfProduct(0), v(), salary(salary){

}

Employee_production::Employee_production(const Employee &e, int numOfProduct) : Employee(e), numberOfProduct(numOfProduct), v(), salary(0){

}

Employee_production::Employee_production(const Employee_production &p) : Employee(p), numberOfProduct(p.numberOfProduct), salary(p.salary){
    
}

Employee_production::~Employee_production(){

}

void Employee_production::setSalary(int numberOfProduct, float baseSalary, float salary){
    this->numberOfProduct = numberOfProduct;
    Employee::setBaseSalary(baseSalary);
    this->salary = salary;
}

float Employee_production::getSalary(){
    return this->salary;
}

float Employee_production::calculateSalary(){
    float baseSalary = Employee::getBaseSalary();
    this->salary = baseSalary + numberOfProduct * v;
    return this->salary;
}

std::ostream& operator<<(std::ostream& out, const Employee_production& e){
    std::cout << (Employee)e
                << " +Number of product: " << e.numberOfProduct
                << " +Salary: " << std::fixed << std::setprecision(2) << e.salary * 1.0;
    return out;
}

// -------------------------------------------------------------------

Employee_management::Employee_management() : Employee(), level(1), bonus(0){

}

Employee_management::Employee_management(const Employee &e, int level) : Employee(e), level(level), bonus(0), salary(0){

}

Employee_management::Employee_management(const Employee &e, int level, float bonus) : Employee(e), level(level), bonus(bonus), salary(0){

}

Employee_management::Employee_management(const Employee &e, int level, float bonus, float salary) : Employee(e), level(level), bonus(bonus), salary(salary){

}

Employee_management::Employee_management(const Employee_management &p) : Employee(p), level(p.level), bonus(p.bonus), salary(p.salary){

}

Employee_management::~Employee_management(){

}

void Employee_management::setSalary(int level, float bonus, float baseSalary, float salary){
    this->level = level;
    this->bonus = bonus;
    Employee::setBaseSalary(baseSalary);
    this->salary = salary;
}

float Employee_management::getSalary(){
    return this->salary;
}

float Employee_management::calculateSalary(){
    float baseSalary = Employee::getBaseSalary();
    this->salary = baseSalary * level + bonus;
    return this->salary;
}

std::ostream& operator<<(std::ostream& out, const Employee_management& e){
    std::cout << (Employee)e
                << " +Level: " << e.level
                << " +Bonus: " << e.bonus
                << " +Salary: " << std::fixed << std::setprecision(2) << e.salary;
    return out;
}


// // -------------------------------------------------------------------

Employee_office::Employee_office() : Employee(), workDays(0), allowance(0){

}

Employee_office::Employee_office(const Employee &e, int workDays) : Employee(e), workDays(workDays), allowance(0), salary(0){

}

Employee_office::Employee_office(const Employee &e, int workDays, float allowance) : Employee(e), workDays(workDays), allowance(allowance), salary(0){

}

Employee_office::Employee_office(const Employee &e, int workDays, float allowance, float salary) : Employee(e), workDays(workDays), allowance(allowance), salary(salary){

}

Employee_office::Employee_office(const Employee_office &p) : Employee(p),  workDays(p.workDays), allowance(p.allowance), salary(p.salary){

}

Employee_office::~Employee_office(){

}

void Employee_office::setSalary(int workDays, float allowance, float baseSalary){
    this->workDays = workDays;
    this->allowance = allowance;
    Employee::setBaseSalary(baseSalary);
    this->salary = salary;
}

float Employee_office::getSalary(){
    return this->salary;
}

float Employee_office::calculateSalary(){
    float baseSalary = Employee::getBaseSalary();
    this->salary = baseSalary + workDays*v + allowance;
    return this->salary;
}

std::ostream& operator<<(std::ostream& out, const Employee_office& e){
    std::cout << (Employee)e
                << " +Number of work days: " << e.workDays
                << " +Allowance: " << e.allowance
                << " +Salary: " << std::fixed << std::setprecision(2) << e.salary;
    return out;
}