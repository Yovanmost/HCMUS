#include <iostream>
#include "Employee.h"
#include "Employee.cpp"
#include "Company.h"
#include "Company.cpp"

using namespace std;

void clearScreen(){
    cout << string(100, '\n' );
}

void inputSomething(){
    char tmp;
    cout << "Input something to continue: ";
    cin >> tmp;
    cin.ignore();
}

void demo1(){
    string tmp0;
    int tmp1;
    float tmp2, tmp3;
    Employee_management a(Employee("Nguyen Van A", 2020, 10000), 10, 100000);
    cout << "Input manager name: ";
    getline(cin, tmp0);
    cout << "Input mananger level: ";
    cin >> tmp1;
    cout << "Input mananger bonus: ";
    cin >> tmp2;
    cout << "Input mananger base salary: ";
    cin >> tmp3;
    a.setSalary(tmp1, tmp2, tmp3, 0);
    // cout << "Mananger salary: " << std::fixed << std::setprecision(2) << a.getSalary() << '\n';
    a.calculateSalary();
    cout << "Mananger salary: " << std::fixed << std::setprecision(2) << a.getSalary() << '\n';
    inputSomething();
}

void demo2(){
    clearScreen();
    Company cp;
    cout << "Pre-loaded list of Employee\n";
    vector<Employee_management> listManagement{{Employee("Nguyen Van A", 2020, 10000), 10, 100000},
                                                {Employee("Nguyen Van B", 2021, 11000), 9, 100000},
                                                {Employee("Nguyen Van C", 2022, 12000), 8, 100000},
                                                {Employee("Nguyen Van D", 2023, 13000), 7, 100000},
                                                {Employee("Nguyen Van E", 2024, 14000), 6, 100000}};

    for (int i = 0; i < listManagement.size(); i++){
        listManagement[i].calculateSalary();
    }        

    cp.addEmployeeManagement(listManagement);

    vector<Employee_office> listOffice{{Employee("Tran Hung A", 2020, 20000), 50, 100000},
                                        {Employee("Tran Hung B", 2021, 21000), 40, 90000},
                                        {Employee("Tran Hung C", 2022, 22000), 30, 80000},
                                        {Employee("Tran Hung D", 2023, 23000), 20, 70000},
                                        {Employee("Tran Hung E", 2024, 24000), 10, 60000}};

    for (int i = 0; i < listOffice.size(); i++){
        listOffice[i].calculateSalary();
    }
        
    cp.addEmployeeOffice(listOffice);

    vector<Employee_production> listProduction{{Employee("Vo Lien A", 2020, 30000), 5000},
                                                {Employee("Vo Lien B", 2021, 41000), 6000},
                                                {Employee("Vo Lien C", 2022, 52000), 7000},
                                                {Employee("Vo Lien D", 2023, 63000), 8000},
                                                {Employee("Vo Lien E", 2024, 74000), 9000}};

    for (int i = 0; i < listProduction.size(); i++){
        listProduction[i].calculateSalary();
    }

    cp.addEmployeeProduction(listProduction);

    cp.printListEmployeeProduction();
    cp.printListEmployeeManagement();
    cp.printListEmployeeOffice();
    


    cout << "Total Salary: " << cp.totalSalary() << '\n';
    
    cout << "Type a name to search: ";
    string tmp;
    getline(cin, tmp);
    cp.findEmployee(tmp);
}

void demo3(){
    
}

int main(){
    // demo1();
    demo2();


    return 0;
}
