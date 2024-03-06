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

void demoWithSampleData(){
    cout << "Demo with Sample data\n";

    Company cp;
    vector<Employee_management> listManagement{{Employee("Nguyen Van A", 2020, 10000, "01", 1), 10, 100000},
                                                {Employee("Nguyen Van B", 2021, 11000, "02", 2), 9, 100000},
                                                {Employee("Nguyen Van C", 2022, 12000, "03", 3), 8, 100000},
                                                {Employee("Nguyen Van D", 2023, 13000, "04", 4), 7, 100000},
                                                {Employee("Nguyen Van E", 2024, 14000, "05", 5), 6, 100000}};

    for (int i = 0; i < listManagement.size(); i++){
        listManagement[i].calculateSalary();
    }        

    vector<Employee_office> listOffice{{Employee("Tran Hung A", 2020, 20000, "06", 6), 50, 100000},
                                        {Employee("Tran Hung B", 2021, 21000, "07", 7), 40, 90000},
                                        {Employee("Tran Hung C", 2022, 22000, "08", 8), 30, 80000},
                                        {Employee("Tran Hung D", 2023, 23000, "09", 9), 20, 70000},
                                        {Employee("Tran Hung E", 2024, 24000, "10", 10), 10, 60000}};

    for (int i = 0; i < listOffice.size(); i++){
        listOffice[i].calculateSalary();
    }
        
    vector<Employee_production> listProduction{{Employee("Vo Lien A", 2020, 30000, "11", 11), 5000},
                                                {Employee("Vo Lien B", 2021, 41000, "12", 12), 6000},
                                                {Employee("Vo Lien C", 2022, 52000, "13", 1), 7000},
                                                {Employee("Vo Lien D", 2023, 63000, "14", 2), 8000},
                                                {Employee("Vo Lien E", 2024, 74000, "15", 3), 9000}};

    for (int i = 0; i < listProduction.size(); i++){
        listProduction[i].calculateSalary();
    }

    vector<Employee*> list;
    for (int i = 0; i < listProduction.size(); i++)
        list.push_back(&listProduction[i]);

    for (int i = 0; i < listManagement.size(); i++)
        list.push_back(&listManagement[i]);

    for (int i = 0; i < listOffice.size(); i++)
        list.push_back(&listOffice[i]);

    cp.addEmployee(list);
    // cp.printListEmployee();
    cout << "3. List Employee:\n" << cp << '\n';

    cout << fixed << setprecision(0) << "4. Total salary: " << cp.totalSalary() << '\n';
    
    cout << "5. Highest paid employee: ";
    Employee* p = cp.findHighestSalary();
    cout << *p << '\n';
        
    cout << "6. Number of Production employee: " << cp.countEmployeeProduction() << '\n';

    cout << "7. Number of Office employee: " << cp.countEmployeeOffice() << '\n';
    
    cout << fixed << setprecision(0) << "8. Avg salary: " << cp.avgSalary() << '\n';

    cout << "9. List of employee has salary less than 3,000,000: \n";
    cp.findLessThanXSalary(3000000);

    cout << "10. Find employee with ID 05:\n";
    Employee* k = cp.findEmployeeByID("05");
    cout << *k << '\n';

    cout << "11. Find employee with name \"Nguyen Van C\":\n";
    Employee* t = cp.findEmployeeByName("Nguyen Van C");
    cout << *t << '\n';

    cout << "12. Number of employee born in May: " << cp.countEmployeeBornInXMonth(5) << '\n';
}

void demoAll(){
    Company cp;
    string tmp;
    Employee* p = nullptr;

    cout << "Input company list of employee:\n";
    cin >> cp;

    int t;
do {
    cout << "3: to print list\n"
        << "4: to total salary\n"
        << "5: to find the highest paid\n"
        << "6: to find number of production employee\n"
        << "7: to find number of office employee\n"
        << "8: to find average salary\n"
        << "9: to print list of employee get paid less than 3,000,000\n"
        << "10: to find employee base on ID\n"
        << "11: to find employee base on name\n"
        << "12: to find list of employee born in May\n"
        << "0: to end\n";
    cin >> t;
    cin.ignore();
    switch (t)
    {
    case 0:
        return;
    
    case 3:
        cout << cp << '\n';
        break;
    
    case 4:
        cout << fixed << setprecision(0) << "4. Total salary: " << cp.totalSalary() << '\n';
        break;
    
    case 5:
        cout << "5. Highest paid employee: ";
        p = cp.findHighestSalary();
        cout << *p << '\n';
        break;
        
    case 6:
        cout << "6. Number of Production employee: " << cp.countEmployeeProduction() << '\n';
        break;

    case 7:
        cout << "7. Number of Office employee: " << cp.countEmployeeOffice() << '\n';
        break;
    
    case 8:
        cout << fixed << setprecision(0) << "8. Avg salary: " << cp.avgSalary() << '\n';
        break;

    case 9:
        cout << "9. List of employee has salary less than 3,000,000: \n";
        cp.findLessThanXSalary(3000000);
        break;

    case 10:
        cout << "Enter ID: ";
        getline(cin, tmp);
        cout << "10. Find employee with ID " << tmp << '\n';
        p = cp.findEmployeeByID(tmp);
        if (p)
            cout << *p << '\n';
        else cout << "404";
        break;

    case 11:
        cout << "Enter name: ";
        getline(cin, tmp);
        cout << "10. Find employee with name " << tmp << '\n';
        p = cp.findEmployeeByName(tmp);
        if (p)
            cout << *p << '\n';
        else cout << "404";
        break;

    case 12:
        cout << "12. Number of employee born in May: " << cp.countEmployeeBornInXMonth(5) << '\n';
        break;
    
    
    default:
        return;
        break;
    }   
}while (t != 0);

}

int main(){
    // Bai 1 3 4 5 6 7 8 9 10 11 12
    // demoWithSampleData();

    // Bai 1 2 3 4 5 6 7 8 9 10 11 12
    demoAll();
    


    return 0;
}
