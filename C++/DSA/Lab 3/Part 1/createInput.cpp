#include <iostream>
#include <random>
#include <chrono>
#include <algorithm>
#include <fstream>
#include <vector>
#include <string>
#include "sortPrototype.cpp"
#define long long long

using namespace std;

vector<string> listOfNames;

long createRandomNumber(long k){
    long seed = chrono::system_clock::now().time_since_epoch().count();
    default_random_engine generator(seed);
    uniform_int_distribution<long unsigned> distribution(0, k);
    return distribution(generator);
}

bool checkExist(int a[], int n, int k){
    for (int i = 0; i < n; i++)
        if (a[i] == k)
            return true;
    return false;
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

void randomOrder(){
    ofstream fw;
    fw.open("a.txt");
    int n = listOfNames.size();
    string s[n];
    for (int i = 0; i < n-1; i++){
        s[i] = listOfNames[i];
        fw << s[i] << '\n';
    }
    s[n-1] = listOfNames[n-1];
    fw << s[n-1];  
    fw.close();
}

void sortedOrder(){
    ofstream fw;
    fw.open("b.txt");
    int n = listOfNames.size();
    string s[n];
    for (int i = 0; i < n; i++){
        s[i] = listOfNames[i];
    }

    std::sort(s, s+n);

    for (int i = 0; i < n-1; i++)
        fw << s[i] << '\n';
    fw << s[n-1];
    fw.close();
}

bool descending(string a, string b){
    return a > b;
}
    

void sortedReverseOrder(){
    ofstream fw;
    fw.open("c.txt");
    int n = listOfNames.size();
    string s[n];
    for (int i = 0; i < n; i++){
        s[i] = listOfNames[i];
    }

    std::sort(s, s+n, descending);

    for (int i = 0; i < n-1; i++)
        fw << s[i] << '\n';
    fw << s[n-1];
    fw.close();
}

void almostSortedORder(){
    ofstream fw;
    fw.open("d.txt");
    int n = listOfNames.size();
    string s[n];
    for (int i = 0; i < n; i++){
        s[i] = listOfNames[i];
    }
    std::sort(s, s+n);

    // the 10% mixed one
    int mixed = n * 0.1;
    int swaper[mixed];
    std::fill_n(swaper, mixed, -1);

    int i = 0;
    // fill the array with unique index so that we can swap with out getting duplicated 
    while (i < mixed){
        long numRan = createRandomNumber(n);
        if (!checkExist(swaper, mixed, numRan))
            swaper[i++] = numRan;
    }
    // swap
    for (int i = 0; i < mixed; i+=2)
        swap(s[swaper[i]], s[swaper[i+1]]);
    
    for (int i = 0; i < n-1; i++)
        fw << s[i] << '\n';
    fw << s[n-1];
    fw.close();
}

// =========================================================================================================

string* loadFile(string fileName){
    string* s;
    string tmp;
    int n = listOfNames.size(), i = 0;
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

void test(string fileName, int algorithm){
    cout << "ID: 22127266\n";
    string* stringArr = loadFile(fileName);
    int n = listOfNames.size();
    switch (algorithm){
        case 0:
        {
            auto start = chrono::high_resolution_clock::now();
            std::sort(stringArr, stringArr+n);
            auto finish = chrono::high_resolution_clock::now();
            auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
            cout << fileName << " - " << "algorithm library sort" << ": " << duration.count() << " ms" << '\n';
            break;   
        }
        // bubble
        case 1:
        {
            auto start = chrono::high_resolution_clock::now();
            bubbleSort(stringArr, n);
            auto finish = chrono::high_resolution_clock::now();
            auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
            cout << fileName << " - " << "bubble sort" << ": " << duration.count() << " ms" << '\n';
            break;
        }
        // selection
        case 2:
        {
            auto start = chrono::high_resolution_clock::now();
            selectionSort(stringArr, n);
            auto finish = chrono::high_resolution_clock::now();
            auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
            cout << fileName << " - " << "selection sort" << ": " << duration.count() << " ms" << '\n';
            break;
        }
            

        // insertion
        case 3:
        {
            auto start = chrono::high_resolution_clock::now();
            insertionSort(stringArr, n);
            auto finish = chrono::high_resolution_clock::now();
            auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
            cout << fileName << " - " << "insertion sort" << ": " << duration.count() << " ms" << '\n';
            break;
        }
            

        // merge
        case 4:
        {
            auto start = chrono::high_resolution_clock::now();
            mergeSort(stringArr, 0, n-1);
            auto finish = chrono::high_resolution_clock::now();
            auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
            cout << fileName << " - " << "merge sort" << ": " << duration.count() << " ms" << '\n';
            break;
        }
            

        // quick
        case 5:
        {
            auto start = chrono::high_resolution_clock::now();
            quickSort(stringArr, 0, n-1);
            auto finish = chrono::high_resolution_clock::now();
            auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
            cout << fileName << " - " << "quick sort" << ": " << duration.count() << " ms" << '\n';
            break;
        }
            

        // radix
        case 6:
        {
            auto start = chrono::high_resolution_clock::now();
            radixSort(stringArr, n);
            auto finish = chrono::high_resolution_clock::now();
            auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
            cout << fileName << " - " << "radix sort" << ": " << duration.count() << " ms" << '\n';
            break;
        }
            
        default:
        break;
    }
    delete []stringArr;
}


int main(){
    cout << "GENERATING TEST CASE FILES\n";
    string s = "names.txt";
    cout << "...\n";
    readFile(s);
    cout << "a\n";
    randomOrder();
    cout << "b\n";
    sortedOrder();
    cout << "c\n";
    sortedReverseOrder();
    cout << "d\n";
    almostSortedORder();
    char k, ask;
    int t;
    string fileName;
    cout << "FINISHED GENERATING\n";

AGAIN:
    cout << '\n';
    cout << "a: random\n" << "b: order\n" << "c: reverse order\n" << "d: almost order\n" << "Choose array order: ";
    cin >> k;
    switch (k){
        case 'a':
            fileName = "a.txt";
        break;

        case 'b':
            fileName = "b.txt";
        break;

        case 'c':
            fileName = "c.txt";
        break;

        case 'd':
            fileName = "d.txt";
        break;

        default:
            cout << "Nah";
            return 0;
        break;
    }
    cout << "1: bubble sort\n" << "2: selection sort\n" << "3: insertion sort\n"
        << "4: merge sort\n" << "5: quick sort\n" << "6: radix sort\n";
    cout << "Pick the algorithm: ";
    cin >> t;
    test(fileName, t);

    cout << "Continue?(y/n) ";
    cin >> ask;
    if ((char)(tolower(ask)) == 'y')
        goto AGAIN;
    
    return 0;
}