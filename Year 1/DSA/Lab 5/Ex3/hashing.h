#pragma once
#include <iostream>
#include <string>
#define TABLE_SIZE 10
#define ADDITION 0
#define REMOVAL 1
#define FIND 2

using namespace std;

double loadFactor = 0.7;
const int finalSize = TABLE_SIZE / loadFactor; // 10/0.7 = 14
// unsigned long long hashTable[10] = {0};

struct Monster{
    unsigned long long key = 0;
    string name;
    long long phoneNumber;
};

Monster phoneBook[14];

unsigned long long hashCode(string str){
    unsigned long long hash = 5381;
    int i = 0;
    while (i < str.size()){
        hash = ((hash << 5) + hash + (int)str[i++]);
    }
    
    return hash;
}


// map the value on to the table
// using linear probing to avoid collision
// return the index that available for insert/delete/find
int h(string name, short func){
    int idex = hashCode(name) % TABLE_SIZE;

    // find the available slot to add
    if (func == ADDITION){
        while (phoneBook[idex].key != 0)
           idex = (idex + 1) % TABLE_SIZE; // Move to the next slot 
        return idex;
    }

    // find the name 
    if (func == FIND || func == REMOVAL){
        while (phoneBook[idex].key != 0){
            if (phoneBook[idex].name == name)
                return idex;
            idex = (idex + 1) % TABLE_SIZE;
        }
        return -1;
    }
    // return idex;
}

void add(string name, long long number){
    int idex = h(name, ADDITION);
    phoneBook[idex].key = hashCode(name);
    phoneBook[idex].name = name;
    phoneBook[idex].phoneNumber = number;
}

void remove(string name){
    int idex = h(name, REMOVAL);
    if (idex < 0){
        cout << "Can not be found for deletion\n";
        return;
    }

    phoneBook[idex].key = 0;
    phoneBook[idex].name = "DELETED";
    phoneBook[idex].phoneNumber = 0;
}

void get(string name){
    int idex = h(name, FIND);
    if (idex < 0){
        cout << "Nothing\n";
        return;
    }           
    cout << "Monster name: " << phoneBook[idex].name << " | Phone number" << phoneBook[idex].phoneNumber;
}