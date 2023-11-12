#include <iostream>

using namespace std;

int sumSecondHalf(int a[], int pos, int n){
    int sum = 0;
    for (int i = pos; i < n; i++)
        sum += a[i];

    return sum;
}

int sumFirstHalf(int a[], int pos){
    int sum = 0;
    for (int i = 0; i < pos; i++)
        sum += a[i];

    return sum;
}

int check(int a[], int& n){
    int flag = 0;
    cin >> n;
    for (int i = 0; i < n; i++)
        cin >> a[i];

    for (int i = 1; i < n - 1; i++){
        cout << sumFirstHalf(a, i) << "\n";
        cout << sumSecondHalf(a, i+1, n) << "\n";
        if (sumFirstHalf(a, i) == sumSecondHalf(a, i+1, n)){
            flag = i;
            break;
        }
    }

    if (flag != 0){
        cout << flag;
    }else cout << -1;
}

int main(){
    int n;
    int a[1000];
    check(a, n);

    return 0;
}