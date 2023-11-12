#include <iostream>
#include <string>
#include <algorithm>
#include <chrono>
#include <time.h>
#include "hashV2.h"
#include "fileReader.h"


using namespace std;

vector<string> nameList;

void printList(){
    for (int i = 0; i < nameList.size(); i++)
        cout << nameList[i] << '\n';
}

void printHashTable(string table[], int n){
    int count = 0;
    for (int i = 0; i < n; i++)
        if (!table[i].empty()){
            count++;
            cout << i << ": " << table[i] << '\n';
        }
    // cout << count;
}

void printChainingTable_LL(Node* table[], int n){
    int count = 0;
    for (int i = 0; i < n; i++){
        if (table[i] != nullptr) {
            cout << "Chain " << i << ": ";
            Node* tmp = table[i];
            while (tmp != nullptr){
                cout << tmp->name << " -> ";
                tmp = tmp->pNext;
            }
            cout << "NULL\n";
        }
    }   
}

string* createList(vector<string> listName){
    string* list = new string [listName.size()];
    for (int i = 0; i < listName.size(); i++){
        list[i]= listName[i];
    }
        
    return list;
}

void runningTimeLinearProbing(string a[], int n, vector<string> listName){
    auto start = chrono::high_resolution_clock::now();
    for (int i = 0; i < listName.size(); i++)
        getLinear(a, n, listName[i]);
    auto finish = chrono::high_resolution_clock::now();
    auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
    cout << "Linear Probing hash table searching: " << duration.count() << " ms" << '\n';            
}

void runningTimeQuadraticProbing(string a[], int n, vector<string> listName){
    auto start = chrono::high_resolution_clock::now();
    for (int i = 0; i < listName.size(); i++)
        getQuadratic(a, n, listName[i]);
    auto finish = chrono::high_resolution_clock::now();
    auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
    cout << "Quadratic Probing hash table searching: " << duration.count() << " ms" << '\n';            
}

void runningTimeChainingApproach_LL(Node* a[], int n, vector<string> listName){
    auto start = chrono::high_resolution_clock::now();
    for (int i = 0; i < listName.size(); i++)
        getChaining_LL(a, n, listName[i]);
    auto finish = chrono::high_resolution_clock::now();
    auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
    cout << "Chaining Approach hash table searching: " << duration.count() << " ms" << '\n';            
}

void runningTimeDoubleHashing(string a[], int n, vector<string> listName){
    auto start = chrono::high_resolution_clock::now();
    for (int i = 0; i < listName.size(); i++)
        getDouble(a, n, listName[i]);
    auto finish = chrono::high_resolution_clock::now();
    auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
    cout << "Double Hashing hash table searching: " << duration.count() << " ms" << '\n';            
}

int main(){
    // LOAD NAME
    string fileName = "words_alpha.txt";
    loadName(fileName, nameList);
    cout << "FINISHED LOADING\n";

    vector<string> searchingName;

    cout << "Enter 10 words\n";
    for (int i = 0; i < 10; i++){
        cout << i+1 << ": ";
        string tmp;
        getline(cin, tmp);
        searchingName.push_back(tmp);
    }
    
    // HASH TABLE -----------------------------------------------------------------------
    // INITIALIZATION -------------------------------------------------------------------
    float loadFactor = 0.7;
    int listSize = nameList.size();
    int HTsize = listSize/loadFactor;
    // cout << HTsize << '\n';
    
    string* linearTable = new string [HTsize];
    
    string* quadraticTable = new string [HTsize];
    
    Node** chainingTable = new Node* [HTsize];

    string* doubleTable = new string [HTsize];

    // SET UP AND CALCULATE RUNNING TIME ------------------------------------------------
    

    setupLinearProbing(linearTable, HTsize, nameList); 
    runningTimeLinearProbing(linearTable, HTsize, searchingName);
    delete []linearTable;

    setupQuadraticProbing(quadraticTable, HTsize, nameList);
    runningTimeQuadraticProbing(quadraticTable, HTsize, searchingName);
    delete []quadraticTable;

    setupChainingApproach_LL(chainingTable, HTsize, nameList);
    runningTimeChainingApproach_LL(chainingTable, HTsize, searchingName);
    
    setupDoubleHashing(doubleTable, HTsize, nameList);
    runningTimeDoubleHashing(doubleTable, HTsize, searchingName);
    delete []doubleTable;

    return 0;
}