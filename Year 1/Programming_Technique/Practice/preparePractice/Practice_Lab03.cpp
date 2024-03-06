#include <iostream>
#include <cstdlib> // for rand() and srand()
#include <ctime> // for time()


using namespace std;

// Dynamic Memory Allocation
void* memAlloc(int *n){
    int *ptr = new int[*n];
    return ptr;
}
void memFree(int *a){
    delete []a;
}

// 1. Swap 2 given integers
void swap(int* a, int *b){
    int tmp = *a;
    *a = *b;
    *b = tmp;
}

// 2. Calculate the total value of 2 integers.
int* sum(int* a, int* b){
    int sum = *a + *b;
    int* ptr = &sum;
    return ptr;
}

// 3. Input an array with an unknown size.
void inputArray(int *a, int &n){
    cin >> n;
    for (int i = 0; i < n; i++)
        cin >> a[i];
}   

// 4. Print a given array
void printArray(int *a, int n){
    for (int i = 0; i < n; i++)
        cout << a[i] << ' ';
}

// 5. Find the largest value from a given array.
int* findMax(int* arr, int n){
    int* max = arr;
    for (int i = 0; i < n; i++)
        if (arr[i] > *max)
            *max = arr[i];
    return max;
}

// 6. Duplicate a given array.
int* copyArray(int* arr, int n){
    int* brr = new int[n];
    for (int i = 0; i < n; i++)
        brr[i] = arr[i] + 1;
    return brr;
}

// 7. Count even numbers from a given subarray. Generate a subarray with all even numbers from the given array.
int* genEvenSubarray(int* arr, int n, int* count){
    int* evenArr = new int[*count];
    int j = 0;
    for (int i = 0; i < n ; i++)
        if (arr[i] % 2 == 0)
            evenArr[j++] = arr[i];
    return evenArr;
}

int* countEvens(int* arr, int n, int* evens){
    for (int i = 0; i < n; i++)
        if (arr[i] % 2 == 0)
            (*evens)++;
}
// countEvens(a, n, countEven);
// int* evenArray = genEvenSubarray(a, n, countEven);
// printArray(evenArray, *countEven);
// memFree(evenArray);

// 8. Find the subarray with the largest total value from a given array.
int sumSubArray(int* a, int pos, int n){
    int sum = 0;
    for (int i = pos; i < n; i++)
        sum += a[i];
    return sum;
}

int* findLargestTotalSubarray(int* a, int n, int &total, int &length){
    total = 0;
    length = 0;
    int first = 0, last = n - 1;
    for (int i = 0; i < n-1; i++)
        for (int j = i + 1; j < n; j++)
            if (total < sumSubArray(a, i, j)){
                total = sumSubArray(a, i, j);
                length = j - i;
                first = i;
                last = j;
            }    
    int *b = new int[length];
    for (int i = first; i <= last; i++){
        b[i-first] =  a[i];
    }
    return b;
}

// 9. Find the longest ascending subarray from a given array.
bool checkAscSubArray(int* a, int pos, int n){
    for (int i = pos; i < n - 1; i++)
        if (a[i] >= a[i+1])
            return false;
    return true;
}

int* findLongestAscendingSubarray(int* a, int n, int &length){
    length = 0;
    for (int i = 0; i < n-1; i++)
        for (int j = i + 1; j < n; j++)
            if (checkAscSubArray(a, i, j)){
                int tmpLength = j - i;
                if (tmpLength > length)
                    length = tmpLength;
            }
                
}

// 10. Swap 2 given arrays.
void swapArrays(int* a, int* b, int &na, int &nb){
    int tmpArr[100];
    int tmpN = na;
    for (int i = 0; i < na; i++)
        tmpArr[i] = a[i];

    for (int i = 0; i < nb; i++)
        a[i] = b[i];
    na = nb;
    for (int i = 0; i < tmpN; i++)
        b[i] = tmpArr[i];
    nb = tmpN;
}

// 11. Concatenate 2 given array.
int* concatenate2Arrays(int* a, int* b, int na, int nb){
    for (int i = 0; i < nb; i++)
        a[i+na] = b[i];
}

// 12. Given 2 ascending arrays with distinguishing elements. Generate a new ascending array with all elements from the
// given array.
void insertionSort(int* arr, int n)
{
    int i, key, j;
    for (i = 1; i < n; i++)
    {
        key = arr[i];
        j = i - 1;
 
        // Move elements of arr[0..i-1], 
        // that are greater than key, to one
        // position ahead of their
        // current position
        while (j >= 0 && arr[j] > key)
        {
            arr[j + 1] = arr[j];
            j = j - 1;
        }
        arr[j + 1] = key;
    }
}
int* merge2Arrays(int* a, int* b, int na, int nb, int&nc){
    concatenate2Arrays(a, b, na, nb);
    nc = na + nb;
    insertionSort(a, nc);

}

// 13. Generate a random matrix with keyboard input size.
void generateMatrix1(int** A, int &length, int &width){
    cin >> length >> width;
    int *p = (int*)A;
    srand(time(NULL));
    for (int i = 0; i < length*width; i++)
        *(p+i) = rand() % 10 + 1;
}

void in2dArray(int** a, int &m, int &n){
    cin >> m >> n;
    int *p = (int*)a;
    for (int i = 0; i < n*m; i++)
        cin >> *(p+i);
}

void print2dArray(int* a[10], int m, int n){
    int *ptr = (int*)a;
    for (int i = 0; i < n*m; i++){
        if (i % n == 0 && i != 0)
            cout << '\n';
        cout << *(ptr+i) << ' ';    
    }
}

void print2dArrayV2(int** a, int m, int n){
    int** p = a;
    for (int i = 0; i < m; i++){
        for (int j = 0; j < n; j++)
            cout << p[i][j] << ' ';
        cout << '\n';
    }
        
}

// 14. Given 2 1D arrays a and b. Generate the matrix c that c[i][j] = a[i] * b[j].
void free2dArray(int** a, int n){
    for (int i = 0; i < n; i++)
        delete []a[i];
    delete []a;
}

int** allocate2dArray(int m, int n){
    int** a = new int* [m];
    for (int i = 0; i < m; i++)
        a[i] = new int [n];
    return a;
}

int** generateMatrix2(int* a, int* b, int na, int nb){
    int** p = new int* [na];
    for (int i = 0; i < na; i++)
        p[i] = new int [nb];
    
    for (int i = 0; i < na; i++)
        for (int j = 0; j < nb; j++)
            p[i][j] = a[i] * b[j];
    
    return p;
}

//   1 2 3 4 
// 1 1 2 3 4
// 2 2 4 6 8
// 3 3 6 9 12

// 15.


int main(){
    int a[100], na, b[100], nb;
    int* c[10], x, y;
    int** d;
    inputArray(a, na);
    inputArray(b, nb);

    d = generateMatrix2(a, b, na, nb);
    print2dArrayV2(d, na, nb);
    free2dArray(d, na);
    return 0;
}