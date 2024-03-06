#include <iostream>
#include <string>
#include <algorithm>
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

Node* createList(vector<string> listName){
    Node* list = new Node [listName.size()];
    for (int i = 0; i < listName.size(); i++){
        list[i].key = i;
        list[i].name = listName[i];
    }
        
    return list;
}

void searchBinary(){

}


int main(){
    string fileName = "list.txt";
    loadName(fileName, nameList);

    float loadFactor = 0.7;
    int listSize = nameList.size();
    int HTsize = listSize/loadFactor;
    
    Node* linearTable = new Node [HTsize];
    
    Node* quadraticTable = new Node [HTsize];
    
    vector<Node> chainingTable[HTsize];
    
    Node* doubleTable = new Node [HTsize];
    
    Node* linearSearchArray = createList(nameList);
    Node* binarySearchArray = createList(nameList);

    setupLinearProbing(linearTable, HTsize, nameList);
    printHashTable(linearTable, HTsize);
    delete []linearTable;

    setupQuadraticProbing(quadraticTable, HTsize, nameList);
    printHashTable(quadraticTable, HTsize);
    delete []quadraticTable;

    setupChainingApproach(chainingTable, HTsize, nameList);
    printChainingTable(chainingTable, HTsize);
    
    setupDoubleHashing(doubleTable, HTsize, nameList);
    printHashTable(doubleTable, HTsize);
    delete []doubleTable;

    return 0;
}