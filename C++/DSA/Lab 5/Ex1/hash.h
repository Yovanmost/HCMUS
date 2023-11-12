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

struct Node{
    unsigned long long key = 0;
    string name;
};

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

/*  
    **************
    LINEAR PROBING
    **************
*/

int linearIndex(Node table[], int n, string name, short func){
    int idex = hashCode(name) % n;

    // find the available slot to add
    if (func == ADDITION){
        while (table[idex].key != 0)
           idex = (idex + 1) % n; // Move to the next slot 
        return idex;
    }

    // find the name 
    if (func == FIND){
        while (table[idex].key != 0){
            if (table[idex].name == name)
                return idex;
            idex = (idex + 1) % n;
        }
        return -1;
    }
    // return idex;
}

void addLinear(Node table[], int n, string name){
    int idex = linearIndex(table, n, name, ADDITION);
    table[idex].key = hashCode(name);
    table[idex].name = name;
}


void setupLinearProbing(Node hashTable[], int tableSize, vector<string> listOfNames){
    for (int i = 0; i < listOfNames.size(); i++){
        addLinear(hashTable, tableSize, listOfNames[i]);
    }   
}

// for searching
bool getLinear(Node table[], int n, string name){
    int idex = linearIndex(table, n, name, FIND);
    if (idex < 0){
        cout << "Nothing\n";
        return false;
    }   
    cout << idex << "|" << name;
    return true;
}

/*
    *****************
    QUADRATIC PROBING
    *****************
*/

int quadraticIndex(Node table[], int n, string name, short func){
    int idex = hashCode(name) % n;
    int step = 1;

    // find the available slot to add
    if (func == ADDITION){
        while (table[idex].key != 0){
            idex = (idex + step*step) % n; // Move quadratic steps
            step++;
        }
           
        return idex;
    }

    // find the name 
    if (func == FIND){
        while (table[idex].key != 0){
            if (table[idex].name == name)
                return idex;
            idex = (idex + step*step) % n;
            step++;
        }
        return -1;
    }
    // return idex;
}

void addQuadratic(Node table[], int n, string name){
    int idex = quadraticIndex(table, n, name, ADDITION);
    table[idex].key = hashCode(name);
    table[idex].name = name;
}

void setupQuadraticProbing(Node hashTable[], int tableSize, vector<string> listOfNames){
    for (int i = 0; i < listOfNames.size(); i++){
        addQuadratic(hashTable, tableSize, listOfNames[i]);
    }
}

bool getQuadratic(Node table[], int n, string name){
    int idex = quadraticIndex(table, n, name, FIND);
    if (idex < 0){
        cout << "Nothing\n";
        return false;
    }   
    cout << idex << "|" << name;
    return true;
}

/*
    *****************
    CHAINING APPROACH
    *****************
*/

int chainingIndex(vector<Node> table[], int n, string name){
    int idex = hashCode(name) % n;
    return idex;
}

void addChaining(vector<Node> table[], int n, string name){
    int idex = chainingIndex(table, n, name);
    // Node tmp = {hashCode(name), name};
    Node tmp;
    tmp.key = hashCode(name);
    tmp.name = name;
    table[idex].push_back(tmp);
}

void setupChainingApproach(vector<Node> table[], int n, vector<string> listOfNames){
    for (int i = 0; i < listOfNames.size(); i++){
        addChaining(table, n, listOfNames[i]);
    }
}

bool getChaining(vector<Node> table[], int n, string name){
    int idex = chainingIndex(table, n, name);
    if (table[idex].empty()){
        return false;
    }  
    int i = 0;
    for (int i = 0; i < table[idex].size(); i++)
        if (table[idex][i].name == name){
            cout << "Index: " << idex << " at: " << i << " " << name;
            return true;    
        }
    return false;
}

/*
    **************
    DOUBLE HASHING
    **************
*/

int doubleIndex(Node table[], int n, string name, short func){
    int idex = (hashCode(name)) % n;
    int step = 1;

    // find the available slot to add
    if (func == ADDITION){
        while (table[idex].key != 0){
            idex = (hashCode(name) + (step++)*sdbm_hash(name)) % n; 
        }
           
        return idex;
    }

    // find the name 
    if (func == FIND){
        while (table[idex].key != 0){
            if (table[idex].name == name)
                return idex;
            idex = (hashCode(name) + (step++)*sdbm_hash(name)) % n; 
        }
        return -1;
    }
    // return idex;
}

void addDouble(Node table[], int n, string name){
    int idex = doubleIndex(table, n, name, ADDITION);
    table[idex].key = hashCode(name);
    table[idex].name = name;
}

void setupDoubleHashing(Node hashTable[], int tableSize, vector<string> listOfNames){
    for (int i = 0; i < listOfNames.size(); i++){
        addDouble(hashTable, tableSize, listOfNames[i]);
    }
}

bool getDouble(Node table[], int n, string name){
    int idex = doubleIndex(table, n, name, FIND);
    if (idex < 0){
        cout << "Nothing\n";
        return false;
    }   
    cout << idex << "|" << name;
    return true;
}






