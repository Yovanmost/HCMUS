#include <iostream>
#include <limits.h>

using namespace std;

// O(n^3)
void bruteForce(int a[], int n){
    int start = 0, end = 0, max = INT_MIN;
    for (int i = 0; i < n - 1; i++)
        for (int j = i + 1; j < n; j++){
            int sum = 0;
            for (int k = i; k <= j; k++)
                sum += a[k];
            if (sum > max){
                start = i;
                end = j;
                max = sum;
            }
        }
    
    for (int i = start; i <= end; i++)
        cout << a[i] << ' ';
    cout << '\n';               
}

// O(n^2)
void improved(int a[], int n){
    int start = 0, end = 0, max = INT_MIN;
    for (int i = 0; i < n - 1; i++){
        int sum = a[i];
        for (int j = i + 1; j < n; j++){
            sum += a[j];
            if (sum > max){
                start = i;
                end = j;
                max = sum;
            }
        }
    }
    for (int i = start; i <= end; i++)
        cout << a[i] << ' ';
    cout << '\n';
}

// O(n)
void dynamicProgramme(int a[], int n){
    int maxNow = 0, maxFinal = INT_MIN;
    int start = 0, end = 0;
    for (int i = 0; i < n; i++){
        maxNow += a[i];
        if (maxNow < 0){
            maxNow = 0;
            start = i+1;
        }
        if (maxNow > maxFinal){
            maxFinal = maxNow;
            end = i;
        }
    }
    for (int i = start; i <= end; i++)
        cout << a[i] << ' ';
    cout << '\n';
}


int main(){
    int n = 6;
    // int a[n] = {-2, 11, -4, 13, -5, -2};
    int a[n] = {3, -2, 11, 13, -5, -2};
    bruteForce(a, n);
    improved(a, n);
    dynamicProgramme(a, n);

    return 0;
}