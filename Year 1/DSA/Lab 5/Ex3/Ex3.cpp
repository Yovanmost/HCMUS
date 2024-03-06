#include <iostream>
#include <fstream>
#include "hashing.h"

using namespace std;


void readFile(string s){
    ifstream fr;
    fr.open(s);
    string tmp;
    Monster dummy;
    int i = 0;
    while (!fr.eof()){
        getline(fr, tmp, ',');
        dummy.name = tmp;
        getline(fr, tmp);
        dummy.phoneNumber = stoll(tmp);
        add(dummy.name, dummy.phoneNumber);
        // cout << hashCode(dummy.name)%10 << "||" 
        //     <<  dummy.name << " + " 
        //     << dummy.phoneNumber << '\n';
    }
    fr.close();
}

void readTable(){
    cout << "---------------------------------------------------\n";
    for (int i = 0; i < 10; i++)
        if (phoneBook[i].key > 0)
            cout << i << "|" 
                << phoneBook[i].key << '\\' 
                << phoneBook[i].name << '/' 
                << phoneBook[i].phoneNumber << '\n';
    cout << "---------------------------------------------------\n";
}

bool checkOverflow(){
    int count = 0;
    for (int i = 0; i < 10; i++)
        if (phoneBook[i].key > 0)
            count++;
    if (count >= 10)
        return true;
    return false;
}


int main(){
    string fileName = "phonebook.txt";
    readFile(fileName);
    readTable();

AGAIN:
    int k;
    char ask;
    system("cls");
    cout << "The size of the phone book is 10\n";
    cout << "1: Read the phone book\n"
        << "2: Add new monster\n"
        << "3: Delete a monster\n"
        << "4: Find a monster\n"
        << "0: to exit\n";
    readTable();
    cout << "Enter: ";
    cin >> k;
    cin.ignore();
    string monsterName;
    unsigned long long phoneNumber;
    switch (k)
    {
    case 1:
        readTable();
    break;
    
    case 2:
        if (checkOverflow()){
            cout << "Full\n";
            break;
        }
            
        cout << "Name: ";
        getline(cin, monsterName);
        cout << "Phone number: ";
        cin >> phoneNumber;
        add(monsterName, phoneNumber);
        readTable();
    break;
    
    
    case 3:
        cout << "Which monster: ";
        getline(cin, monsterName);
        remove(monsterName);
        readTable();
    break;

    case 4:
        cout << "Find who: ";
        getline(cin, monsterName);
        get(monsterName);
    break;
    
    case 0:
        return 0;
    
    default:
        cout  << "Nah";
        return 0;
        break;
    }

    cout << "Continue?(y/n) ";
    cin >> ask;
    if ((char)(tolower(ask)) == 'y')
        goto AGAIN;

    return 0;
}