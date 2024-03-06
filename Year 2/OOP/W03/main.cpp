#include <iostream>
#include "Stack.h"
#include "Fraction.h"
#include "Student.h"
#include "Course.h"

using namespace std;

void ClearScreen(){
    cout << string(100, '\n' );
}

void inputSomething(){
    char tmp;
    cout << "Input something to continue: ";
    cin >> tmp;
    cin.ignore();
}

void demo1_1_int(){
    cout << "\nBai 1 - int --------------- \n";
    int n;
    cout << "Input stack size: ";
    cin >> n;
    cin.ignore();
    Stack<int> a(n);
    char k;
    do {
        ClearScreen();
        cout << "Stack (" << n << " numbers):\n";
        // printStack();
        cout << "0 to end, 1 for push, 2 for pop\n";
        cout << "Stack: ";
        a.printStack();
        if (a.isEmpty())
            cout << "Top value: nothing\n";
        else cout << "Top value: " << a.getTop() << '\n';
        cout << "Enter: ";
        cin >> k;
        cin.ignore();
        switch (k)
        {
        case '1':
            int c;
            cout << "Push? ";
            cin >> c;
            cin.ignore();
            a.push(c);
            break;
        case '2':
            a.pop();
            break;
        case '0':  
            return;
        default:
            cout << "Enter again\n";
            break;
        }
        
    } while (k != '0');
}

void demo1_2_fraction(){
    ClearScreen();
    cout << "\nBai 1 - fraction --------------- \n";
    int n;
    cout << "Input stack size: ";
    cin >> n;
    cin.ignore();
    Stack<Fraction> a(n);
    char k;
    do {
        ClearScreen();
        cout << "Stack (" << n << " numbers):\n";
        // printStack();
        cout << "0 to end, 1 for push, 2 for pop\n";
        cout << "Stack: ";
        a.printStack();
        if (a.isEmpty())
            cout << "Top value: nothing\n";
        else cout << "Top value: " << a.getTop() << '\n';
        cout << "Enter: ";
        cin >> k;
        cin.ignore();
        Fraction c;
        switch (k)
        {
        case '1':
            cout << "Push? ";
            c.input();
            // cin >> c;
            // cin.ignore();
            a.push(c);
            break;
        case '2':
            a.pop();
            break;
        case '0':  
            return;
        default:
            cout << "Enter again\n";
            break;
        }
        
    } while (k != '0');
}

void demo2(){
    ClearScreen();
    cout << "\nBai 2 --------------- \n";
    Student a;
    Student b("22127xxx", 0, "Nguyen Van B");

    double tmp;

    cout << "Student b: " << b;
    cout << "Student a: " <<  a << "Input student a\n";
    cin >> a;
    cout << a;
    
    cout << "|a's grade: " << a.getGrade() << " vs b's grade: " << b.getGrade() << "|\n";
    cout << "Change a's grade: ";
    cin >> tmp;
    a.setGrade(tmp);
    cin.ignore();
    cout << "Change b's grade: ";
    cin >> tmp;
    b.setGrade(tmp);
    cin.ignore();
    cout << "|a's grade: " << a.getGrade() << " vs b's grade: " << b.getGrade() << "|\n";
    inputSomething();
}

void demo3_1(){
    ClearScreen();
    cout << "\nBai 3 --------------- \n";
    Course c("CS101", "OOP");
    vector<Student> list{{"0001", 4.9, "Nguyen Van A"},
                        {"0002", 5.6, "Nguyen Thi B"},
                        {"0003", 7.8, "Tran Van C"},
                        {"0004", 8.5, "Hoang Van D"},
                        {"0005", 9.4, "Vo Lang E"},
                        {"0006", 10, "O Long Vien"}};
    c.enroll(list);
    cout << "|List of student|\n";
    c.showList();
    inputSomething();
    ClearScreen();

    cout << "|Save to OOP_course.txt|\n\n";
    c.saveFile();

    cout << "|List of excellent student (grade >= 9)|\n";
    c.showList(EXCELLENT);
    inputSomething();
    ClearScreen();

    cout << "|Sort ascending by name|\n";
    c.sortByName(ASCEND);
    c.showList();
    inputSomething();
    ClearScreen();

    cout << "|Sort descending by grade|\n";
    c.sortByGrade(DESCEND);
    c.showList();
    inputSomething();
    ClearScreen();

    cout << "|Unenroll Student with ID 0005|";
    c.unEnroll("0005");
    c.showList();    
    inputSomething();
    ClearScreen();
}

void demo3_2(){
    Course tmp;
    cout << "|Load data from OOP_course.txt file|\n";
    tmp.loadFile("OOP_course.txt");
    tmp.showList();
}


int main(){
    demo1_1_int();
    demo1_2_fraction();
    demo2();
    demo3_1();
    demo3_2();
}