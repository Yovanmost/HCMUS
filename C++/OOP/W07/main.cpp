#include <iostream>
#include <string>
#include "Fraction.h"
#include "Array.h"
#include "FileHandler.h"
#include "IntegerFormatException.h"
#include "Date.h"
#include "Time.h"
#include "Stack.h"
#include "Queue.h"

#include "Fraction.cpp"
#include "Array.cpp"
#include "FileHandler.cpp"
#include "IntegerFormatException.cpp"
#include "Date.cpp"
#include "Time.cpp"

using namespace std;

void demo1(){

    int numerator;
    int denominator;
    Fraction f;
    
    try{
        cout << "1. DividedByZeroException\n";
        cout << "Input numerator: ";
        cin >> numerator;
        cout << "Input denominator: ";
        cin >> denominator;
        cin.ignore();
        f.setValue(numerator, denominator);
        f.printWithADash();
    }
    catch (DividedByZeroException& e) {
        cerr << e.what() << '\n';
    }
}

void demo2(){
    int arr[] = { 2, -7, 8, 9 };
    int size = 4;
    int index = 7;
    try{
        cout << "2. IndexOutOfRangeException\n";
        if (index < 0 || index >= size)
        throw IndexOutOfRangeException(index, size);
        cout << arr[index] << endl;
    }
    catch (IndexOutOfRangeException& e) {
        cerr << e.what() << '\n';
    }
}

void demo3(){
    string fileName;
    try{
        cout << "3. FileNotFoundException\n";
        cout << "Input file name: ";
        getline(cin, fileName);
        FileHandler f(fileName);
        f.openFileForReading();
        while (!f.endFile())
            cout << f.readData() << '\n';
    }
    catch (FileNotFoundException& e) {
        cerr << e.what() << '\n';
    }
}

void demo4(){
    string str;
    int result = 0;
    
    try{
        cout << "4. IntegerFormatException\n";
        cout << "Input string to format to integer: ";
        getline(cin, str);
        for (char digit : str){
            if (isdigit(digit)){
                result = result * 10 + (digit - '0');
            } 
            else {
                // Handle non-digit characters if needed
                throw IntegerFormatException();
            }
        }
        cout << result;
    }
    catch (IntegerFormatException& e) {
        cerr << e.what() << '\n';
    }
    
}

void demo5(){
    int d,m,y;

    try{
        cout << "5. DateFormatException\n";
        cout << "Input day: ";
        cin >> d;
        cout << "Input month: ";
        cin >> m;
        cout << "Input year: ";
        cin >> y;
        cin.ignore();
        Date theDay(d, m, y);
        cout << theDay.day << '/' << theDay.month << '/' << theDay.year << '\n';
    }
    catch(const DateFormatException& e){
        cerr << e.what() << '\n';
    }       
}

void demo6(){
    int s,m,h;

    try{
        cout << "6. TimeFormatException\n";
        cout << "Input second: ";
        cin >> s;
        cout << "Input minute: ";
        cin >> m;
        cout << "Input hour: ";
        cin >> h;
        cin.ignore();
        Time t(s,m,h);
        cout << t.second << ':' << t.minute << ':' << t.hour << '\n';
    }
    catch(const TimeFormatException& e){
        cerr << e.what() << '\n';
    }   
}

void demo7_1_Stack(){
    // system("cls");
    int n;
    cout << "Input stack size: ";
    cin >> n;
    cin.ignore();
    Stack<int> a(n);
    char k;
    try{
        do {
            system("cls");
            cout << "Stack (" << n << " numbers):\n";
            // printStack();
            cout << "0 to end, 1 for push, 2 for pop, 3 for top value\n";
            cout << "Stack: ";
            a.printStack();
            cout << "\nEnter: ";
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
            case '3':
                cout << "Top value: " << a.getTop() << '\n';
                break;
            case '0':  
                return;
            default:
                cout << "Enter again\n";
                break;
            }
            
        } while (k != '0');
    }
    catch (StackException& e){
        cerr << e.what() << '\n';
    }
    
}

void demo7_2_Queue(){
    // system("cls");
    int n;
    cout << "Input queue size: ";
    cin >> n;
    cin.ignore();
    Queue<int> a(n);
    char k;
    try{
        do {
            system("cls");
            cout << "Queue (" << n << " numbers):\n";
            cout << "0 to end, 1 for enqueue, 2 for dequeue, 3 for top value\n";
            cout << "Queue: ";
            a.printQueue();
            cout << "\nEnter: ";
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
            case '3':
                cout << "Front value: " << a.getFrontValue() << '\n';
                
                break;
            case '0':  
                return;
            default:
                cout << "Enter again\n";
                break;
            }
            
        } while (k != '0');
    }
    catch (QueueException& e){
        cerr << e.what() << '\n';
    }        
}

int main(){
    // Bai 1
    demo1();
    cout << '\n';

    // Bai 2
    demo2();
    cout << '\n';

    // Bai 3
    demo3();
    cout << '\n';

    // Bai 4
    demo4();
    cout << '\n';

    // Bai 5
    demo5();
    cout << '\n';

    // Bai 6
    demo6();
    cout << '\n';

    // Bai 7
    demo7_1_Stack();
    cout << '\n';
    demo7_2_Queue();
    


    return 0;
}