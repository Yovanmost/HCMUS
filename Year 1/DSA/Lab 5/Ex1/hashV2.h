#pragma once
#include <iostream>
#include <string>
#include <vector>
// #include "fileReader.h"
#define TABLE_SIZE 10
#define ADDITION 0
#define REMOVAL 1
#define FIND 2
#define LOAD_FACTOR 0.7

using namespace std;

// struct Node{
//     unsigned long long key = 0;
//     string name;
// };

// djb2_hash
unsigned long long hashCode(string str){
    unsigned long long hash = 5381;
    int i = 0;
    while (i < str.size()){
        hash = ((hash << 5) + hash + (int)str[i++]);
    }
    
    return hash;
}

unsigned long long sdbm_hash(string str) {
    unsigned long long hash = 0;
    int i = 0;

    while (i < str.size())
        hash = (int)str[i++] + (hash << 6) + (hash << 16) - hash;

    return hash;
}



unsigned long long Jenkins_one_at_a_time_hash(string str)
{
    unsigned long long hash, i;
    for(hash = i = 0; i < str.length(); ++i)
    {
        hash += str[i];
        hash += (hash << 10);
        hash ^= (hash >> 6);
    }
    hash += (hash << 3);
    hash ^= (hash >> 11);
    hash += (hash << 15);
    return hash;
}

/*  
    **************
    LINEAR PROBING
    **************
*/

int linearIndex(string table[], int n, string name, short func){
    int idex = hashCode(name) % n;

    // find the available slot to add
    if (func == ADDITION){
        while (!table[idex].empty()){
            idex = (idex + 1) % n; // Move to the next slot 
            // cout << name << '\n';
        }
           
        return idex;
    }

    // find the name 
    if (func == FIND){
        while (!table[idex].empty()){
            if (table[idex] == name)
                return idex;
            idex = (idex + 1) % n;
        }
        return -1;
    }
    // return idex;
}

void addLinear(string table[], int n, string name){
    int idex = linearIndex(table, n, name, ADDITION);
    table[idex] = name;
}


void setupLinearProbing(string hashTable[], int tableSize, vector<string> listOfNames){
    for (int i = 0; i < listOfNames.size(); i++){
        addLinear(hashTable, tableSize, listOfNames[i]);
    }   
}

// for searching
bool getLinear(string table[], int n, string name){
    int idex = linearIndex(table, n, name, FIND);
    if (idex < 0){
        cout << "Nothing\n";
        return false;
    }   
    // cout << idex << "|" << name << '\n';
    return true;
}

/*
    *****************
    QUADRATIC PROBING
    *****************
*/

int quadraticIndex(string table[], int n, string name, short func){
    int idex = hashCode(name) % n;
    int step = 1;

    // find the available slot to add
    if (func == ADDITION){
        while (!table[idex].empty()){
            idex = (idex + step*step) % n; // Move quadratic steps
            step++;
        }
           
        return idex;
    }

    // find the name 
    if (func == FIND){
        while (!table[idex].empty()){
            if (table[idex] == name)
                return idex;
            idex = (idex + step*step) % n;
            step++;
        }
        return -1;
    }
    // return idex;
}

void addQuadratic(string table[], int n, string name){
    int idex = quadraticIndex(table, n, name, ADDITION);
    table[idex]= name;
}

void setupQuadraticProbing(string hashTable[], int tableSize, vector<string> listOfNames){
    for (int i = 0; i < listOfNames.size(); i++){
        addQuadratic(hashTable, tableSize, listOfNames[i]);
    }
}

bool getQuadratic(string table[], int n, string name){
    int idex = quadraticIndex(table, n, name, FIND);
    if (idex < 0){
        cout << "Nothing\n";
        return false;
    }   
    // cout << idex << "|" << name << '\n';
    return true;
}

/*
    *****************
    CHAINING APPROACH
    *****************
*/

int chainingIndex(vector<string> table[], int n, string name){
    int idex = hashCode(name) % n;
    return idex;
}

void addChaining(vector<string> table[], int n, string name){
    int idex = chainingIndex(table, n, name);
    // string tmp = {hashCode(name), name};
    string tmp;
    tmp = name;
    table[idex].push_back(tmp);
}

void setupChainingApproach(vector<string> table[], int n, vector<string> listOfNames){
    for (int i = 0; i < listOfNames.size(); i++){
        addChaining(table, n, listOfNames[i]);
    }
}

bool getChaining(vector<string> table[], int n, string name){
    int idex = chainingIndex(table, n, name);
    if (table[idex].empty()){
        return false;
    }  
    // int i = 0;
    for (int i = 0; i < table[idex].size(); i++)
        if (table[idex][i]== name){
            // cout << "Index: " << idex << " at node: " << i << " " << name << '\n';
            return true;    
        }
    return false;
}

/*
    **************
    DOUBLE HASHING
    **************
*/

// int doubleIndex(string table[], int n, string name, short func){
//     int idex = (hashCode(name)) % n;
//     int step = 1;

//     // find the available slot to add
//     if (func == ADDITION){
//         while (!table[idex].empty()){
//             idex = (hashCode(name) + (step++)*sdbm_hash(name)) % n; 
//         }
           
//         return idex;
//     }

//     // find the name 
//     if (func == FIND){
//         while (!table[idex].empty()){
//             if (table[idex] == name)
//                 return idex;
//             idex = (hashCode(name) + (step++)*sdbm_hash(name)) % n; 
//         }
//         return -1;
//     }
//     // return idex;
// }

int doubleIndex(string table[], int n, string name, short func){
    int idex = (hashCode(name)) % n;
    int step = 1;

    // find the available slot to add
    if (func == ADDITION){
        while (!table[idex].empty()){
            idex = (hashCode(name) + (step++)*Jenkins_one_at_a_time_hash(name)) % n; 
        }
           
        return idex;
    }

    // find the name 
    if (func == FIND){
        while (!table[idex].empty()){
            if (table[idex] == name)
                return idex;
            idex = (hashCode(name) + (step++)*Jenkins_one_at_a_time_hash(name)) % n; 
        }
        return -1;
    }
    // return idex;
}

void addDouble(string table[], int n, string name){
    int idex = doubleIndex(table, n, name, ADDITION);
    table[idex] = name;
}

void setupDoubleHashing(string hashTable[], int tableSize, vector<string> listOfNames){
    for (int i = 0; i < listOfNames.size(); i++){
        addDouble(hashTable, tableSize, listOfNames[i]);
    }
}

bool getDouble(string table[], int n, string name){
    int idex = doubleIndex(table, n, name, FIND);
    if (idex < 0){
        cout << "Nothing\n";
        return false;
    }   
    // cout << idex << "|" << name << '\n';
    return true;
}






