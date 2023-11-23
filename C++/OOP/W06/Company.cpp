#include "Company.h"

Company::Company(){

}

Company::Company(std::string name) : companyName(name){

}

Company::Company(const Company& cp){
    this->companyName = cp.companyName;
    this->listEmployee.insert(std::end(listEmployee), std::begin(cp.listEmployee), std::end(cp.listEmployee));
}

Company::~Company(){

}


void Company::addEmployee(Employee* e){
    listEmployee.push_back(e);
}

void Company::addEmployee(std::vector<Employee*> list){
    listEmployee.insert(std::end(listEmployee), std::begin(list), std::end(list));
}

void Company::printListEmployee(){
    if (listEmployee.empty()) {
        std::cout << "No employees in the company.\n";
        return;
    }

    for (int i = 0; i < listEmployee.size(); i++)
        std::cout << *listEmployee[i] << " +Salary: " << std::fixed << std::setprecision(0) << listEmployee[i]->getSalary() << '\n';
}

std::ostream& operator<<(std::ostream& out, Company& cp){
    cp.printListEmployee();
    return out;
}

// -------------------------------------------------------------------

float Company::totalSalary(){
    float sum = 0;
    for (int i = 0; i < listEmployee.size(); i++)
        sum += listEmployee[i]->getSalary();
    return sum;
}

Employee* Company::findHighestSalary(){
    int max = 0;
    Employee* p = nullptr;
    for (int i = 0; i < listEmployee.size(); i++)
        if (listEmployee[i]->getSalary() > max){
            max = listEmployee[i]->getSalary();
            p = listEmployee[i];
        }
    
    return p;
    // std::cout << *p << std::fixed << std::setprecision(0) << " +Salary: " <<  p->getSalary() << '\n';
}

int Company::countEmployeeProduction(){
    int total = 0;
    for (int i = 0; i < listEmployee.size(); i++)
        if (dynamic_cast<Employee_production*> (listEmployee[i]) != nullptr)
            total++;
    return total;
}

int Company::countEmployeeOffice(){
    int total = 0;
    for (int i = 0; i < listEmployee.size(); i++)
        if (dynamic_cast<Employee_office*> (listEmployee[i]) != nullptr)
            total++;
    return total;
}

float Company::avgSalary(){
    return totalSalary() / listEmployee.size();
}

void Company::findLessThanXSalary(float x){
    for (int i = 0; i < listEmployee.size(); i++)
        if (listEmployee[i]->getSalary() < x)
            std::cout << *listEmployee[i] << " +Salary: " << std::fixed << std::setprecision(0) << listEmployee[i]->getSalary() << '\n';
}

Employee* Company::findEmployeeByID(const std::string ID){
    // bool flag = false;
    Employee* p = nullptr;
    for (int i = 0; i < listEmployee.size(); i++)
        if (listEmployee[i]->getID() == ID){
            p = &(*listEmployee[i]);
            // flag = true;
            // std::cout << listEmployee[i] << std::fixed << std::setprecision(0) << " +Salary: " <<  listEmployee[i]->getSalary() << '\n';
            break;
        }
            
    return p;
    // if (!flag)   
    //     std::cout << "404 - not found\n";

    // return flag; 

}

Employee* Company::findEmployeeByName(const std::string name){
    // bool flag = false;
    Employee* p = nullptr;
    for (int i = 0; i < listEmployee.size(); i++)
        if (listEmployee[i]->getName() == name){
            p = &(*listEmployee[i]);
            // flag = true;
            // std::cout << listEmployee[i] << std::fixed << std::setprecision(0) << " +Salary: " <<  listEmployee[i]->getSalary() << '\n';
            break;
        }

    // if (!flag)   
    //     std::cout << "404 - not found\n";

    // return flag;           
}

int Company::countEmployeeBornInXMonth(int x){
    int total = 0;
    for (int i = 0; i < listEmployee.size(); i++)
        if (listEmployee[i]->getMonth() == 5)
            total++;
    return total;
}




void Company::testGetName(){
}





void Company::insert(){
    
}

std::vector<Employee_management> listManagement;
std::vector<Employee_office> listOffice;
std::vector<Employee_production> listProduction;

std::istream& operator>>(std::istream& in, Company& cp){
    int n;

    std::string tmpName;
    int tmpYearIn;
    float tmpBaseSalary;
    std::string tmpID;
    int tmpMonth;
    
    // clear all data for new one
    listManagement.clear();
    listOffice.clear();
    listProduction.clear();
    cp.listEmployee.clear();

    std::cout << "Number of Employee manager: ";
    in >> n;
    in.ignore();
    
    for (int i = 0; i < n; i++){
        // basic info
        std::cout << "Employee " << i+1 << '\n';
        std::cout << "Input name: ";
        std::getline(in, tmpName);
        

        std::cout << "Input year in: ";
        in >> tmpYearIn;  

        std::cout << "Input base salary: ";
        in >> tmpBaseSalary;

        std::cout << "Input birth month: ";
        in >> tmpMonth;
        in.ignore();

        std::cout << "Input ID: ";
        std::getline(in, tmpID);

        // unique info
        int tmpLevel;
        std::cout << "Input level: ";
        in >> tmpLevel;

        float tmpBonus;
        std::cout << "Input bonus: ";
        in >> tmpBonus;
       
        Employee_management tmpM{Employee(tmpName, tmpYearIn, tmpBaseSalary, tmpID, tmpMonth), tmpLevel, tmpBonus};
        tmpM.calculateSalary();
        listManagement.push_back(tmpM);
        // std::cout << tmpM << '\n';

        in.ignore();
    }

    std::cout << "Number of Employee production: ";
    in >> n;
    in.ignore();

    for (int i = 0; i < n; i++) {
        // basic info
        std::cout << "Employee " << i+1 << '\n';
        std::cout << "Input name: ";
        std::getline(in, tmpName);

        std::cout << "Input year in: ";
        in >> tmpYearIn;

        std::cout << "Input base salary: ";
        in >> tmpBaseSalary;

        std::cout << "Input birth month: ";
        in >> tmpMonth;
        in.ignore();

        std::cout << "Input ID: ";
        std::getline(in, tmpID);

        // unique info
        int tmpNumberOfProduct;
        std::cout << "Input number of products: ";
        in >> tmpNumberOfProduct;

        Employee_production tmpP{Employee(tmpName, tmpYearIn, tmpBaseSalary, tmpID, tmpMonth), tmpNumberOfProduct};
        tmpP.calculateSalary();
        listProduction.push_back(tmpP);

        in.ignore();
    }

    std::cout << "Number of Employee office: ";
    in >> n;
    in.ignore();

    for (int i = 0; i < n; i++) {
        // basic info
        std::cout << "Employee " << i+1 << '\n';
        std::cout << "Input name: ";
        std::getline(in, tmpName);

        std::cout << "Input year in: ";
        in >> tmpYearIn;

        std::cout << "Input base salary: ";
        in >> tmpBaseSalary;

        std::cout << "Input birth month: ";
        in >> tmpMonth;
        in.ignore();

        std::cout << "Input ID: ";
        std::getline(in, tmpID);

        // unique info
        int tmpWorkDays;
        std::cout << "Input work days: ";
        in >> tmpWorkDays;

        float tmpAllowance;
        std::cout << "Input allowance: ";
        in >> tmpAllowance;

        Employee_office tmpO{Employee(tmpName, tmpYearIn, tmpBaseSalary, tmpID, tmpMonth), tmpWorkDays, tmpAllowance};
        tmpO.calculateSalary();
        listOffice.push_back(tmpO);

        in.ignore();
    }

    // after this function gone
    // everything is gone too
    // this means that the addresses of the vectors
    // does not exist anymore

    std::vector<Employee*> list;

    for (int i = 0; i < listManagement.size(); i++)
        list.push_back(&listManagement[i]);
        
    for (int i = 0; i < listProduction.size(); i++)
        list.push_back(&listProduction[i]);

    for (int i = 0; i < listOffice.size(); i++)
        list.push_back(&listOffice[i]);
    
    // std::cout << *list[0] << '\n'
    //         << listManagement[0];

    cp.addEmployee(list);

    return in;
}




