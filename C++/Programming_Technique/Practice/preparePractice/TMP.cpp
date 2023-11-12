#include <iostream>
#include <string.h>
#include <string>

using namespace std;

char *getByte(double &x, int &nb){
    nb = sizeof(double);
    return (char*)&x;
}

void testArray(int* &a, int &n){
    cin >> n;
    for (int i = 0; i < n; i++)
        cin >> a[i];
    for (int i = 0; i < n; i++)
        cout << a[i] << "\n";
}

int findEntry(const int* const Data, int Sz)
{
    
}

void DiagonalMatrix(int a[][100], int n){
    int *ptr = (int*)a;
    for (int i = 1; i < n*n -1; i++){
        if (i % (n-1) == 0)
        cout << *(ptr+i);
     }
}

void inArray(int a[][100], int n){
    int *p = (int*)a;
    for (int i = 0; i < n*n; i++){
        cin >> *p;
        p++;
    }
        
}

int main(){
    int n;
    int a[100][100];
    cin >> n;
    inArray(a, n);
    DiagonalMatrix(a, n);
    return 0;
}