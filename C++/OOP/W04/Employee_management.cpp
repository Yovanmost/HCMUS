#include "Employee_management.h"

Employee_management::Employee_management() : employee(), level(1), bonus(0){

}

Employee_management::Employee_management(Employee e, int level) : employee(e), level(level), bonus(0){

}

Employee_management::Employee_management(Employee e, float bonus) : employee(e), level(1), bonus(bonus){

}

Employee_management::Employee_management(Employee e, int level, float bonus) : employee(e), level(level), bonus(bonus){

}

Employee_management::Employee_management(Employee_management &p){
    this->employee = p.employee;
    this->level = p.level;
    this->bonus = p.bonus;
}

Employee_management::~Employee_management(){

}