#include "Company.h"

Company::Company(){

}

Company::Company(std::string name) : companyName(name){

}

Company::~Company(){

}

// -------------------------------------------------------------------

void Company::addEmployeeManagement(Employee_management e){
    listEmployeeManagement.push_back(e);
}

void Company::addEmployeeManagement(std::vector<Employee_management> list){
    listEmployeeManagement.insert(std::end(listEmployeeManagement), std::begin(list), std::end(list));
}

// -------------------------------------------------------------------

void Company::addEmployeeOffice(Employee_office e){
    listEmployeeOffice.push_back(e);
}

void Company::addEmployeeOffice(std::vector<Employee_office> list){
    listEmployeeOffice.insert(std::end(listEmployeeOffice), std::begin(list), std::end(list));
}

// -------------------------------------------------------------------

void Company::addEmployeeProduction(Employee_production e){
    listEmployeeProduction.push_back(e);
}

void Company::addEmployeeProduction(std::vector<Employee_production> list){
    listEmployeeProduction.insert(std::end(listEmployeeProduction), std::begin(list), std::end(list));
    // for (int i = 0; i < list.size(); i++)
    //     addEmployeeProduction(list[i]);
        
}

// -------------------------------------------------------------------

void Company::printListEmployeeManagement(){
    for (Employee_management i : listEmployeeManagement)
        std::cout << i << '\n';
    // for (int i = 0; i < listEmployeeManagement.size(); i++){
    //     listEmployeeManagement[i].calculateSalary();
    //     std::cout << listEmployeeManagement[i] << '\n';
    // }

}

void Company::printListEmployeeOffice(){
    for (Employee_office i : listEmployeeOffice){
        std::cout << i << '\n';
    }
    // for (int i = 0; i < listEmployeeOffice.size(); i++){
    //     listEmployeeOffice[i].calculateSalary();
    //     std::cout << listEmployeeOffice[i] << '\n';
    // }
        
}

void Company::printListEmployeeProduction(){
    for (Employee_production i : listEmployeeProduction)
        std::cout << i << '\n';
    // for (int i = 0; i < listEmployeeProduction.size(); i++){
    //     listEmployeeProduction[i].calculateSalary();
    //     std::cout << listEmployeeProduction[i] << '\n';
    // }
}

// -------------------------------------------------------------------

float Company::totalSalary(){
    float sum = 0;
    if (!listEmployeeManagement.empty())
        for (Employee_management i : listEmployeeManagement)
            sum += i.getSalary();

    if (!listEmployeeOffice.empty())
        for (Employee_office i : listEmployeeOffice)
            sum += i.getSalary();

    if (!listEmployeeProduction.empty())
        for (Employee_production i : listEmployeeProduction)
            sum += i.getSalary();

    return sum;
}

bool Company::findEmployee(const std::string name){
    bool flag = false;

    if (!listEmployeeManagement.empty()){
        for (Employee_management i : listEmployeeManagement){
            if (i.getName() == name){
                flag = true;
                std::cout << i;
            }
        }
    }
        
                

    if (!listEmployeeOffice.empty()){
        for (Employee_office i : listEmployeeOffice){
            if (i.getName() == name){
                flag = true;
                std::cout << i;
            }
        }   
    }
        

    if (!listEmployeeProduction.empty()){
        for (Employee_production i : listEmployeeProduction){
            if (i.getName() == name){
                flag = true;
                std::cout << i;
            }
        }
    }
        

    return flag;           
}

void Company::testGetName(){
    if (!listEmployeeManagement.empty()){
        for (Employee_management i : listEmployeeManagement){
            std::cout << i.getName() << '\n';
        }
        std::cout << "A";
    }
        
                

    if (!listEmployeeOffice.empty()){
        for (Employee_office i : listEmployeeOffice){
            std::cout << i.getName() << '\n';
        }  
        std::cout << "B";
    }
        

    if (!listEmployeeProduction.empty()){
        for (Employee_production i : listEmployeeProduction){
            std::cout << i.getName() << '\n';
        }
        std::cout << "C";
    }
}