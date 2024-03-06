#include <iostream>
#include "Fraction.h"
#include "Stack.h"
// #include "Stack.cpp"
#include "Queue.h"
#include "Student.h"

using namespace std;

void demo1(){
    cout << "\nBai 1 --------------- \n";
    Fraction f1, f2; // 0/1
	Fraction f3(1, -7); // -1/7
	Fraction f4(f3); // Copy constructor
	Fraction f5 = f2; // Copy constructor
	Fraction f6, f7, f8; // Default constructor
	
	f6 = f3; // Operator = -> f6 = -1/7
	f7 = f1 + f5; // = 0
	f8 = f2 - f4; // = 1/7
	f3 = f1 * f7; // = 0
	f5 = f6 / f2; // Cannot divide by zero! 
	
	cout << f1 << '\n'
		<< f2 << '\n'
		<< f3 << '\n'
		<< f4 << '\n'
		<< f5 << '\n'
		<< f6 << '\n'
		<< f7 << '\n'
		<< f8 << '\n';


	if (f2 == f3) // true
		cout << "f2==f3" << endl;
	if (f3 != f1) // false
		cout << "f3!=f1" << endl;
	if (f2 >= f5) // true
		cout << "f2>=f5" << endl;
	if (f2 > f5) // true
		cout << "f2>f5" << endl;
	if (f5 <= f3) // true
		cout << "f5<=f3" << endl;
	if (f5 < f3) // false
		cout << "f5<f3" << endl;
		
	f1 = f2 + 3;
	f3 = -7 + f1; 
	f5 = 7 * f3; 
	f6 = f4 - 6;
	
	cout << f3 << endl;
	cout << f6 << endl;
	
	f1 += f5;
	f6 -= f7;
	f8 *= f1;
	f8 /= f2; // Cannot divide by zero! 
	
	cout << f8++ << endl;
	cout << ++f7 << endl;
	cout << f8-- << endl;
	cout << --f7 << endl;
	
	f3 += Fraction(11, 2);
	int x = int(f3); // 3/2 => 1
	float f = (float)f3; // 3/2 => 1.5
	
	cout << x << endl;
	cout << f << endl;
    char tmp;
    cout << "Input something to continue: ";
    cin >> tmp;
    cin.ignore();
}

void demo2(){
    system("cls");
    cout << "\nBai 2 --------------- \n";
    int n;
    cout << "Input stack size: ";
    cin >> n;
    cin.ignore();
    Stack a(n);
    char k;
    do {
        system("cls");
        cout << "Stack (" << n << " numbers):\n";
        // printStack();
        cout << "0 to end, 1 for push, 2 for pop\n";
        cout << "Stack: ";
        a.printStack();
        if (a.isEmpty())
            cout << "Top value: nothing\n";
        else cout << "Top value: " << a.getTopValue() << '\n';
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

void demo3(){
    system("cls");
    cout << "\nBai 3 --------------- \n";
    int n;
    cout << "Input queue size: ";
    cin >> n;
    cin.ignore();
    Queue a(n);
    char k;
    do {
        system("cls");
        cout << "Queue (" << n << " numbers):\n";
        cout << "0 to end, 1 for enqueue, 2 for dequeue\n";
        cout << "Queue: ";
        a.printQueue();
        if (a.isEmpty())
            cout << "Front value: nothing\n";
        else cout << "Front value: " << a.getFrontValue() << '\n';
        cout << "Enter: ";
        cin >> k;
        cin.ignore();
        switch (k)
        {
        case '1':
            int c;
            cout << "Enqueue? ";
            cin >> c;
            cin.ignore();
            a.enqueue(c);
            break;
        case '2':
            a.dequeue();
            break;
        case '0':  
            return;
        default:
            cout << "Enter again\n";
            break;
        }
        
    } while (k != '0');
    
}

void demo4(){
    system("cls");
    cout << "\nBai 4 --------------- \n";
    Student student1;
    Student student2("22127000", 10, "Nguyen Van A", "21 jump street");

    cout << "Student 1\n" << student1;
    cout << "Student 2\n" << student2;

    Student student3, student4;
    cout << "\nInput information of student 3\n";
    cin >> student3;
    cout << "\nStudent 3\n" << student3;
}

int main(){
    // Bai 1
    demo1();
    // Bai 2
    demo2();
    // Bai 3
    demo3();
    // Bai 4
    demo4();   

    return 0;
}