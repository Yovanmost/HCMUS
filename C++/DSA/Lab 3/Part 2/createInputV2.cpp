#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <random>
#include <chrono>
#include <time.h>
#include <algorithm>
#include "sortPrototype.cpp"
#include "searchPrototype.cpp"
#define long long long

using namespace std;

vector<string> listOfNames;

long createRandomNumberV2(int k){
    srand(time(0));
    return rand() % k;
}

void readFile(string s){
    ifstream fr;
    fr.open(s);
    string tmp;

    while (!fr.eof()){
        fr >> tmp;
        listOfNames.push_back(tmp);
    }

    fr.close();
}

void oneHundred(){
    int n = listOfNames.size(), i = 0;
    // cout << n;
    ofstream fw;
    fw.open("100.txt");
    srand(time(0));
    while (i++ < 99){
        fw << listOfNames[rand() % n] << '\n';
    }
    fw << listOfNames[rand() % n];
    fw.close();
}

void oneThousand(){
    int n = listOfNames.size(), i = 0;
    // cout << n;
    ofstream fw;
    fw.open("1k.txt");
    srand(time(0));
    while (i++ < 999){
        fw << listOfNames[rand() % n] << '\n';
    }
    fw << listOfNames[rand() % n];
    fw.close();
}

void tenThousand(){
    int n = listOfNames.size(), i = 0;
    // cout << n;
    ofstream fw;
    fw.open("10k.txt");
    srand(time(0));
    while (i++ < 9999){
        fw << listOfNames[rand() % n] << '\n';
    }
    fw << listOfNames[rand() % n];
    fw.close();
}

void fiftyThousand(){
    int n = listOfNames.size(), i = 0;
    // cout << n;
    ofstream fw;
    fw.open("50k.txt");
    srand(time(0));
    while (i++ < 49999){
        fw << listOfNames[rand() % n] << '\n';
    }
    fw << listOfNames[rand() % n];
    fw.close();
}

int fileSize(string s){
    ifstream fr(s);
    int i = 0;
    string tmp;
    while (!fr.eof()){
        fr >> tmp;
        i++;
    }
    fr.close();
    return i;
}

string* loadFile(string fileName){
    string* s;
    string tmp;
    int i = 0, n = fileSize(fileName);
    ifstream fr;
    fr.open(fileName);
    s = new string [n];
    
    while (!fr.eof()){
        fr >> tmp;
        s[i++] = tmp;
    }

    fr.close();
    return s;
}

void printStringArr(string* s, int n){
    for (int i = 0; i < n; i++)
        cout << s[i] << '\n';
    cout << '\n';
}

void test(string fileName, int searchType){
    string* s = loadFile(fileName);
    int n = fileSize(fileName);
    switch (searchType){
        case 1:
        {
            auto start = chrono::high_resolution_clock::now();
            for (int i = 0; i < n; i++){
                linearSearch(s, n, s[i]);
            }
            auto finish = chrono::high_resolution_clock::now();
            auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
            cout << fileName << " - " << "Linear search" << ": " << duration.count() << " ms" << '\n';
            break;
        }

        case 2:
        {
            auto start = chrono::high_resolution_clock::now();
            bubbleSort(s, n);
            for (int i = 0; i < n; i++){
                binarySearch(s, n, s[i]);
            }
            auto finish = chrono::high_resolution_clock::now();
            auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
            cout << fileName << " - " << "Bubble sort + BS" << ": " << duration.count() << " ms" << '\n';            
            break;
        }

        case 3:
        {
            auto start = chrono::high_resolution_clock::now();
            selectionSort(s, n);
            for (int i = 0; i < n; i++){
                binarySearch(s, n, s[i]);
            }
            auto finish = chrono::high_resolution_clock::now();
            auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
            cout << fileName << " - " << "Selection sort + BS" << ": " << duration.count() << " ms" << '\n';            
            break;
        }        
        
        case 4:
        {
            auto start = chrono::high_resolution_clock::now();
            insertionSort(s, n);
            for (int i = 0; i < n; i++){
                binarySearch(s, n, s[i]);
            }
            auto finish = chrono::high_resolution_clock::now();
            auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
            cout << fileName << " - " << "Insertion sort + BS" << ": " << duration.count() << " ms" << '\n';            
            break;
        }    
        
        case 5:
        {
            auto start = chrono::high_resolution_clock::now();
            mergeSort(s, 0, n-1);
            for (int i = 0; i < n; i++){
                binarySearch(s, n, s[i]);
            }
            auto finish = chrono::high_resolution_clock::now();
            auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
            cout << fileName << " - " << "Merge sort + BS" << ": " << duration.count() << " ms" << '\n';            
            break;
        }

        case 6:
        {
            auto start = chrono::high_resolution_clock::now();
            quickSort(s, 0, n-1);
            for (int i = 0; i < n; i++){
                binarySearch(s, n, s[i]);
            }
            auto finish = chrono::high_resolution_clock::now();
            auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
            cout << fileName << " - " << "Quick sort + BS" << ": " << duration.count() << " ms" << '\n';            
            break;
        }

        case 7:
        {
            auto start = chrono::high_resolution_clock::now();
            radixSort(s, n);
            for (int i = 0; i < n; i++){
                binarySearch(s, n, s[i]);
            }
            auto finish = chrono::high_resolution_clock::now();
            auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
            cout << fileName << " - " << "Radix sort + BS" << ": " << duration.count() << " ms" << '\n';            
            break;
        }

        default:
        break;
    }
    delete []s;
}

int main(){
    cout << "GENERATING TEST CASE FILES\n";
    string s = "names.txt";
    readFile(s);
    oneHundred();
    oneThousand();
    tenThousand();
    fiftyThousand();
    cout << "FINISHED GENERATING\n";
    
    char k, ask;
    int t;
    string fileName;
    
AGAIN:
    cout << '\n';
    cout << "a: 100\n" << "b: 1000\n" << "c: 10000\n" << "d: 50000\n" << "Choose array size: ";
    cin >> k;
    switch (k){
        case 'a':
            fileName = "100.txt";
        break;

        case 'b':
            fileName = "1k.txt";
        break;

        case 'c':
            fileName = "10k.txt";
        break;

        case 'd':
            fileName = "50k.txt";
        break;

        default:
            cout << "Nah";
            return 0;
        break;
    }
    
    for (int i = 1; i < 8; i++)
        test(fileName, i);

    cout << "Continue?(y/n) ";
    cin >> ask;
    if ((char)(tolower(ask)) == 'y')
        goto AGAIN;

        
    
    
    return 0;
}