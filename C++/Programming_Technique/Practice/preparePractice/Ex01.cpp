#include <iostream>

using namespace std;

void findSmallestBiggest(int a[], int n){
    int max = a[n];
    int min = a[n];
    int i = 0;
    
    if (n % 2 == 0){
        max = a[0];
        min = a[1];    
        i = 2;
    }
    else {
        max = a[0];
        min = a[0];
        i = 1;
    }

    while (i < n - 1){
        if (a[i] > a[i+1]){
            if (max < a[i])
                max = a[i];
            if (min > a[i+1])
                min = a[i+1];
        }
        else{
            if (max < a[i+1])
                max = a[i+1];
            if (min > a[i])
                min = a[i];
        }
        i+=2;
    }

    cout << "Max is: " << max << "\nMin is: " << min;
}

int main(){
    int n;
    int a[100];
    cin >> n;
    for (int i = 0; i < n; i++)
        cin >> a[i];
    
    findSmallestBiggest(a, n);

    return 0;
}