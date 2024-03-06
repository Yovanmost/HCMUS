#include <iostream>
#include <random>
#include <chrono>
#include <algorithm>
#include <string>
#include "sortPrototype.cpp"
#define long long long
#define RANDOM 0
#define ASCEND 1
#define DESCEND 2
#define FIVEMIXED 3

using namespace std;

string testName[10] = {"10^4", "2.10^4", "4.10^4", "6.10^4", "8.10^4",
                    "10.10^4", "12.10^4", "14.10^4", "16.10^4", "20.10^4"};

int* testCases(){
    int n = 10;
    int* a = new int [n];
    a[0] = 1e4;
    for (int i = 1; i < n - 1; i++)
        a[i] = a[0]*i*2;
    a[n-1] = a[0]*20;
    return a;
}

void freeTestCases(int* a){
    delete []a;
}

bool descendingCompare(long a, long b){
    return a > b;
}

long createRandomNumber(int k){
    long seed = chrono::system_clock::now().time_since_epoch().count();
    default_random_engine generator(seed);
    uniform_int_distribution<long unsigned> distribution(0, k);
    return distribution(generator);
}

long* createRandomArray(int n, long k){
    long seed = chrono::system_clock::now().time_since_epoch().count();
    default_random_engine generator(seed);
    uniform_int_distribution<long unsigned> distribution(0, k);
    long* a;
    a = new  long [n];
    for (int i = 0; i < n; i++)
        a[i] = distribution(generator);
    return a;
}

void print(long a[], int n){
    for (int i = 0; i < n; i++)
        cout << a[i] << ' ';
    cout << '\n';
}

/*
    **************
    INITIALIZATION
    **************
*/

void freeArray(long* a){
    delete []a;
}

long* ascendingArray(int n, long k){
    long* a = createRandomArray(n, k);
    sort(a, a+n);
    return a;
}

long* descendingArray(int n, long k){
    long* a = createRandomArray(n, k);
    sort(a, a+n, descendingCompare);
    return a;
}

long* randomArray(int n, long k){
    long* a = createRandomArray(n, k);
    return a;
}

bool checkExist(long a[], int n, int k){
    for (int i = 0; i < n; i++)
        if (a[i] == k)
            return true;
    return false;
}

long* fivePercentMixedArray(int n, long k){
    long* a = createRandomArray(n, k);
    sort(a, a+n);
    // the 5% mixed one
    long mixed = n * 0.05;
    long swaper[mixed];
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
        swap(a[swaper[i]], a[swaper[i+1]]);
    
    return a;
}

/*
    **************
    SELECTION SORT
    **************
*/

void selectionSortTestCases(int type, long k){
    int* cases = testCases();
    int n = 10;
    cout << "Selection sort - ";

    switch (type){
        case RANDOM: 
            cout << "Random: \n";
            for (int i = 0; i < n; i++){
                long* randomized = randomArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                selectionSort(randomized, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(randomized);
            }
        break;

        case ASCEND:
            cout << "Ascending order: \n";
            for (int i = 0; i < n; i++){
                long* ascending = ascendingArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                selectionSort(ascending, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(ascending);
            }
        break;  

        case DESCEND:
            cout << "Descending order: \n";
            for (int i = 0; i < n; i++){
                long* descending = descendingArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                selectionSort(descending, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(descending);
            }
        break;   

        case FIVEMIXED:
            cout << "5% mixed: \n";
            for (int i = 0; i < n; i++){
                long* fivePercent = fivePercentMixedArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                selectionSort(fivePercent, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(fivePercent);
            }
        break; 
    default:
        cout << "NONE";
        return;
        break;
    }
    freeTestCases(cases);
    cout << '\n';
}

/*
    ***********
    BUBBLE SORT
    ***********
*/

void bubbleSortTestCases(int type, long k){
    int* cases = testCases();
    int n = 10;
    cout << "Bubble sort - ";

    switch (type){
        case RANDOM: 
            cout << "Random: \n";
            for (int i = 0; i < n; i++){
                long* randomized = randomArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                bubbleSort(randomized, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(randomized);
            }
        break;

        case ASCEND:
            cout << "Ascending order: \n";
            for (int i = 0; i < n; i++){
                long* ascending = ascendingArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                bubbleSort(ascending, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(ascending);
            }
        break;  

        case DESCEND:
            cout << "Descending order: \n";
            for (int i = 0; i < n; i++){
                long* descending = descendingArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                bubbleSort(descending, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(descending);
            }
        break;   

        case FIVEMIXED:
            cout << "5% mixed: \n";
            for (int i = 0; i < n; i++){
                long* fivePercent = fivePercentMixedArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                bubbleSort(fivePercent, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(fivePercent);
            }
        break; 
    default:
        cout << "NONE";
        return;
        break;
    }
    freeTestCases(cases);
    cout << '\n';
}

/*
    **************
    INSERTION SORT
    **************
*/

void insertionSortTestCases(int type, long k){
    int* cases = testCases();
    int n = 10;
    cout << "Insertion sort - ";

    switch (type){
        case RANDOM: 
            cout << "Random: \n";
            for (int i = 0; i < n; i++){
                long* randomized = randomArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                insertionSort(randomized, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(randomized);
            }
        break;

        case ASCEND:
            cout << "Ascending order: \n";
            for (int i = 0; i < n; i++){
                long* ascending = ascendingArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                insertionSort(ascending, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(ascending);
            }
        break;  

        case DESCEND:
            cout << "Descending order: \n";
            for (int i = 0; i < n; i++){
                long* descending = descendingArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                insertionSort(descending, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(descending);
            }
        break;   

        case FIVEMIXED:
            cout << "5% mixed: \n";
            for (int i = 0; i < n; i++){
                long* fivePercent = fivePercentMixedArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                insertionSort(fivePercent, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(fivePercent);
            }
        break; 
    default:
        cout << "NONE";
        return;
        break;
    }
    freeTestCases(cases);
    cout << '\n';
}

/*
    ***********
    SHAKER SORT
    ***********
*/

void shakerSortTestCases(int type, long k){
    int* cases = testCases();
    int n = 10;
    cout << "Shaker sort - ";

    switch (type){
        case RANDOM: 
            cout << "Random: \n";
            for (int i = 0; i < n; i++){
                long* randomized = randomArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                shakerSort(randomized, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(randomized);
            }
        break;

        case ASCEND:
            cout << "Ascending order: \n";
            for (int i = 0; i < n; i++){
                long* ascending = ascendingArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                shakerSort(ascending, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(ascending);
            }
        break;  

        case DESCEND:
            cout << "Descending order: \n";
            for (int i = 0; i < n; i++){
                long* descending = descendingArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                shakerSort(descending, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(descending);
            }
        break;   

        case FIVEMIXED:
            cout << "5% mixed: \n";
            for (int i = 0; i < n; i++){
                long* fivePercent = fivePercentMixedArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                shakerSort(fivePercent, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(fivePercent);
            }
        break; 
    default:
        cout << "NONE";
        return;
        break;
    }
    freeTestCases(cases);
    cout << '\n';
}

/*
    ****************
    INTERCHANGE SORT
    ****************
*/

void interchangeSortTestCases(int type, long k){
    int* cases = testCases();
    int n = 10;
    cout << "Interchange sort - ";

    switch (type){
        case RANDOM: 
            cout << "Random: \n";
            for (int i = 0; i < n; i++){
                long* randomized = randomArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                interchangeSort(randomized, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(randomized);
            }
        break;

        case ASCEND:
            cout << "Ascending order: \n";
            for (int i = 0; i < n; i++){
                long* ascending = ascendingArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                interchangeSort(ascending, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(ascending);
            }
        break;  

        case DESCEND:
            cout << "Descending order: \n";
            for (int i = 0; i < n; i++){
                long* descending = descendingArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                interchangeSort(descending, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(descending);
            }
        break;   

        case FIVEMIXED:
            cout << "5% mixed: \n";
            for (int i = 0; i < n; i++){
                long* fivePercent = fivePercentMixedArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                interchangeSort(fivePercent, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(fivePercent);
            }
        break; 
    default:
        cout << "NONE";
        return;
        break;
    }
    freeTestCases(cases);
    cout << '\n';
}

/*
    ************
    LIBRARY SORT
    ************
*/

void algorithmSortTestCases(int type, long k){
    int* cases = testCases();
    int n = 10;
    cout << "algorithm library sort - ";

    switch (type){
        case RANDOM: 
            cout << "Random: \n";
            for (int i = 0; i < n; i++){
                long* randomized = randomArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                // interchangeSort(randomized, cases[i]);
                std::sort(randomized, randomized+cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(randomized);
            }
        break;

        case ASCEND:
            cout << "Ascending order: \n";
            for (int i = 0; i < n; i++){
                long* ascending = ascendingArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                std::sort(ascending, ascending+cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(ascending);
            }
        break;  

        case DESCEND:
            cout << "Descending order: \n";
            for (int i = 0; i < n; i++){
                long* descending = descendingArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                std::sort(descending, descending+cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(descending);
            }
        break;   

        case FIVEMIXED:
            cout << "5% mixed: \n";
            for (int i = 0; i < n; i++){
                long* fivePercent = fivePercentMixedArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                std::sort(fivePercent, fivePercent+cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(fivePercent);
            }
        break; 
    default:
        cout << "NONE";
        return;
        break;
    }
    freeTestCases(cases);
    cout << '\n';
}

/*
    **************
    SHAKER SORT V2
    **************
*/

void cocktailSortTestCases(int type, long k){
    int* cases = testCases();
    int n = 10;
    cout << "cocktail sort V2 - ";

    switch (type){
        case RANDOM: 
            cout << "Random: \n";
            for (int i = 0; i < n; i++){
                long* randomized = randomArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                cocktailSort(randomized, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(randomized);
            }
        break;

        case ASCEND:
            cout << "Ascending order: \n";
            for (int i = 0; i < n; i++){
                long* ascending = ascendingArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                cocktailSort(ascending, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(ascending);
            }
        break;  

        case DESCEND:
            cout << "Descending order: \n";
            for (int i = 0; i < n; i++){
                long* descending = descendingArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                cocktailSort(descending, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(descending);
            }
        break;   

        case FIVEMIXED:
            cout << "5% mixed: \n";
            for (int i = 0; i < n; i++){
                long* fivePercent = fivePercentMixedArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                cocktailSort(fivePercent, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(fivePercent);
            }
        break; 
    default:
        cout << "NONE";
        return;
        break;
    }
    freeTestCases(cases);
    cout << '\n';
}

void shakerSortV2TestCases(int type, long k){
    int* cases = testCases();
    int n = 10;
    cout << "Shaker sort v2 - ";

    switch (type){
        case RANDOM: 
            cout << "Random: \n";
            for (int i = 0; i < n; i++){
                long* randomized = randomArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                shakerSortV2(randomized, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(randomized);
            }
        break;

        case ASCEND:
            cout << "Ascending order: \n";
            for (int i = 0; i < n; i++){
                long* ascending = ascendingArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                shakerSortV2(ascending, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(ascending);
            }
        break;  

        case DESCEND:
            cout << "Descending order: \n";
            for (int i = 0; i < n; i++){
                long* descending = descendingArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                shakerSortV2(descending, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(descending);
            }
        break;   

        case FIVEMIXED:
            cout << "5% mixed: \n";
            for (int i = 0; i < n; i++){
                long* fivePercent = fivePercentMixedArray(cases[i], k);
                auto start = chrono::high_resolution_clock::now();
                shakerSortV2(fivePercent, cases[i]);
                auto finish = chrono::high_resolution_clock::now();
                auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
                cout << cases[i] << ": " << duration.count() << " ms" << '\n';
                freeArray(fivePercent);
            }
        break; 
    default:
        cout << "NONE";
        return;
        break;
    }
    freeTestCases(cases);
    cout << '\n';
}

int main(){
    long k;
    int n, t;
    cout << "0: random\n";
    cout << "1: ascending\n";
    cout << "2: descending\n";
    cout << "3: 5% mixed\n";
    cout << "Pick the array type: ";
    cin >> n;
    cout << "Choose k (Max random number): ";
    cin >> k;
    cout << "0: algorithm library sort\n";
    cout << "1: bubble sort\n";
    cout << "2: selection sort\n";
    cout << "3: insertion sort\n";
    cout << "4: interchange sort\n";
    cout << "5: shaker sort\n";
    cout << "6: cocktail sort\n";
    cout << "7: shaker sort v2(correct version)\n";
    cout << "Pick the sorting algorithm: ";
    cin >> t;
    
    switch (t){
        case 0:
            algorithmSortTestCases(n, k);
        break;

        case 1:
            bubbleSortTestCases(n, k);
        break;

        case 2:
            selectionSortTestCases(n, k);
        break;

        case 3:
            insertionSortTestCases(n, k);
        break;

        case 4:
            interchangeSortTestCases(n, k);
        break;

        case 5:
            shakerSortTestCases(n, k);
        break;

        case 6:
            cocktailSortTestCases(n, k);
        break;

        case 7:
            shakerSortV2TestCases(n, k);
        break;

        default:
        break;
    }

    return 0;
}