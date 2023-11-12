#include <iostream>

using namespace std;

//allocate arr scores
int *inArr(int n){
    int *a = new int[n];
    for (int i = 0; i < n; i++)
        cin >> a[i];
    return a;
}


//sorting ascending
int sortArr(int *a ,int n){
    for (int i = 0; i < n - 1; i++)
        for (int j = i + 1; j < n; j++){
            if (a[i] > a[j]){
                int tmp = a[i];
                a[i] = a[j];
                a[j] = tmp;
            }
        }
}


//average score


int main(){
    int n;
    cin >> n;
    int *a = inArr(n);

    for (int i = 0; i < n; i++)
        cout << a[i] << " ";

    sortArr(a, n);

    for (int i = 0; i < n; i++)
        cout << a[i] << " ";

    delete [] a;

    return 0;
}