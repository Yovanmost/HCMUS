#include <iostream>
#define MAX 100

using namespace std;

void sortAsc(int a[], int n){
    n++;
    for (int i = 0; i < n-1; i++)
        for (int j = i+1; j < n; j++)
            if (a[i] > a[j])    
                swap(a[i], a[j]);
}

void sortDesc(int a[], int n){
    n++;
    for (int i = 0; i < n-1; i++)
        for (int j = i+1; j < n; j++)
            if (a[i] < a[j])    
                swap(a[i], a[j]);
}

void weirdSort(int a[], int n){
    int final[n];
    bool location[n] = { }; // false
    // 0 for odd, 1 for even
    for (int i = 0; i < n; i++)
        if (a[i] % 2 != 0)
            location[i] = true;
    int top = -1;
    int stack[n];
    // add even
    for (int i = 0; i < n; i++)
        if (location[i])
            stack[++top] = a[i];
    sortAsc(stack, top);

    for (int i = 0; i < n; i++)
        if (location[i])
            final[i] = stack[top--];
        
    // add odd
    for (int i = 0; i < n; i++)
        if (!location[i])
            stack[++top] = a[i];
    sortDesc(stack, top);

    for (int i = 0; i < n; i++)
        if (!location[i])
            final[i] = stack[top--];

    for (int i = 0; i < n; i++)
        cout << final[i] << ' ';
}

int main(){
    int a[MAX] = {1, 2, 4, 7, 15, 18, 8, 9, 11};
    int n = 9;
    // for (int i = )
    weirdSort(a, n);


    return 0;
}