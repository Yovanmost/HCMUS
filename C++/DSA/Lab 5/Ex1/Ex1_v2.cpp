#include <iostream>
#include <string>
#include <algorithm>
#include <chrono>
#include <time.h>
#include "hashV2.h"
#include "fileReader.h"
#include "linearAndBinarySearch_v2.h"

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

void printChainingTable(vector<string> table[], int n){
    int count = 0;
    for (int i = 0; i < n; i++){
        if (!table[i].empty()) {
            cout << "Chain " << i << ": ";
            for (int j = 0; j < table[i].size(); j++) {
                cout << table[i][j] << " -> ";
                count++;
            }
            cout << "NULL\n";
        }
    }   
    // cout << count << '\n';
}

string* createList(vector<string> listName){
    string* list = new string [listName.size()];
    for (int i = 0; i < listName.size(); i++){
        list[i]= listName[i];
    }
        
    return list;
}

// without counting the sorting algorithm
void runningTimeBinarySearch(string a[], int n){
    std::sort(a, a+n);
    auto start = chrono::high_resolution_clock::now();
    for (int i = 0; i < n; i++)
        binarySearch(a, n, a[i]);
    auto finish = chrono::high_resolution_clock::now();
    auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
    cout << "Binary search(exclude sorting): " << duration.count() << " ms" << '\n';            
}

// taking account of sorting
void runningTimeBinarySearchV2(string a[], int n){
    auto start = chrono::high_resolution_clock::now();
    std::sort(a, a+n);
    for (int i = 0; i < n; i++)
        binarySearch(a, n, a[i]);
    auto finish = chrono::high_resolution_clock::now();
    auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
    cout << "Binary search(include sorting): " << duration.count() << " ms" << '\n';            
}

void runningTimeLinearSearch(string a[], int n){
    // std::sort(a, a+n);
    auto start = chrono::high_resolution_clock::now();
    for (int i = 0; i < n; i++)
        lineaSearch(a, n, a[i]);
    auto finish = chrono::high_resolution_clock::now();
    auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
    cout << "Linear search: " << duration.count() << " ms" << '\n';            
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

void runningTimeChainingApproach(vector<string> a[], int n, vector<string> listName){
    auto start = chrono::high_resolution_clock::now();
    for (int i = 0; i < listName.size(); i++)
        getChaining(a, n, listName[i]);
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
    string fileName = "names.txt";
    loadName(fileName, nameList);
    cout << "FINISHED LOADING\n";

    // NOT HASHING -----------------------------------------------------------------------
    int n = nameList.size();
    string* linearSearchArray = createList(nameList);
    string* binarySearchArray = createList(nameList);
    // cout << "RUNNING\n";
    runningTimeLinearSearch(linearSearchArray, n);
    delete []linearSearchArray;
    runningTimeBinarySearch(binarySearchArray, n);
    // runningTimeBinarySearchV2(binarySearchArray, n);
    delete []binarySearchArray;
    // cout << "DONE";

    // HASH TABLE -----------------------------------------------------------------------
    float loadFactor = 0.7;
    int listSize = nameList.size();
    int HTsize = listSize/loadFactor;
    
    string* linearTable = new string [HTsize];
    
    string* quadraticTable = new string [HTsize];
    
    vector<string> chainingTable[HTsize];
    
    string* doubleTable = new string [HTsize];
    

    setupLinearProbing(linearTable, HTsize, nameList);
    // printHashTable(linearTable, HTsize);
    runningTimeLinearProbing(linearTable, HTsize, nameList);
    // getLinear(linearTable, HTsize, "Ronaldo");
    delete []linearTable;

    setupQuadraticProbing(quadraticTable, HTsize, nameList);
    // printHashTable(quadraticTable, HTsize);
    runningTimeQuadraticProbing(quadraticTable, HTsize, nameList);
    delete []quadraticTable;

    setupChainingApproach(chainingTable, HTsize, nameList);
    runningTimeChainingApproach(chainingTable, HTsize, nameList);
    // printChainingTable(chainingTable, HTsize);
    
    setupDoubleHashing(doubleTable, HTsize, nameList);
    runningTimeDoubleHashing(doubleTable, HTsize, nameList);
    // printHashTable(doubleTable, HTsize);
    delete []doubleTable;

    cout << HTsize;

    return 0;
}