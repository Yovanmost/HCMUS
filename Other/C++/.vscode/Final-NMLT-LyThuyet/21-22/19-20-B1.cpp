#include <iostream>

using namespace std;

// n = 5
// 0    5   10  15  20  25
// 0    2   4   6   8   10
// 0    1   2   3   4   5

// 0 0 0
// 1 1 1
// 2 2 2
// 3 3 3
// 4 4 4
// 5 5 5

int countExchange(int n){
    int one[n+1];
    int two[n+1];
    int five[n+1];

    int count = 0;

    for (int i = 0; i <= n; i++){
        one[i] = i;
        two[i] = i*2;
        five[i] = i*5;
    }

    for (int i = 0; i <= n; i++)
        for (int j = 0; j <= n; j++)
            for (int k = 0; k <= n; k++)
                if (five[i] + two[j] + one[k] == n)
                    count++;

    return count;

}

int countExchangeV2(int n){
    int count = 0;
    for (int i = 0; i <= n/5; i++)
        for (int j = 0; j <= n/2; j++)
            for (int k = 0; k <= n; k++)
                if (i*5 + j*2 + k == n)
                    count++;
    return count;
}

int main(){
    int n = 5;
    cout << countExchangeV2(n);

    return 0;
}