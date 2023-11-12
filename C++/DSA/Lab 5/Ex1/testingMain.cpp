#include <iostream>
#include <string>
#include "hash.h"
#include "fileReader.h"
#include "linearAndBinarySearch.h"

using namespace std;

vector<string> nameList;

void printList(){
    for (int i = 0; i < nameList.size(); i++)
        cout << nameList[i] << '\n';
}

void printHashTable(Node table[], int n){
    int count = 0;
    for (int i = 0; i < n; i++)
        if (table[i].key != 0){
            count++;
            cout << i << ": " << table[i].name << '\n';
        }
    cout << count;
}

void printChainingTable(vector<Node> table[], int n){
    int count = 0;
    for (int i = 0; i < n; i++){
        if (!table[i].empty()) {
            cout << "Chain " << i << ": ";
            for (int j = 0; j < table[i].size(); j++) {
                cout << table[i][j].name << " -> ";
                count++;
            }
            cout << "NULL\n";
        }
    }   
    cout << count << '\n';
}


int main(){
    cout << "1";
    
    const int HTsize = 18500/0.7;
    cout << "a";
    Node linearTable[HTsize];
    cout << "b";
    Node quadraticTable[HTsize];
    cout << "c";
    vector<Node> chainingTable[HTsize];
    // cout << "d";
    Node doubleTable[HTsize];
    // cout << "2";
    string fileName = "list.txt";
    loadName(fileName, nameList);
    cout << "3";
    setupLinearProbing(linearTable, HTsize, nameList);
    printHashTable(linearTable, HTsize);

    setupQuadraticProbing(quadraticTable, HTsize, nameList);
    printHashTable(quadraticTable, HTsize);

    setupChainingApproach(chainingTable, HTsize, nameList);
    printChainingTable(chainingTable, HTsize);
    
    setupDoubleHashing(doubleTable, HTsize, nameList);
    printHashTable(doubleTable, HTsize);
    
    return 0;
}