#include <iostream>
#include <vector>
#include <string>
#define long long long
#define INT_MIN -2147483648

using namespace std;

/*
    B1  
        */
long power(int n){
    long sum = 2;
    for (int i = 2; i <= n; i++)
        sum *= 2;
    return sum;
}

long sumPower(int n){
    long sum = 0;
    for (int i = 1; i <= n; i++)
        sum += power(i);
    return sum;
}

long sumPower2(int n){
    long sum = 0, base = 1;
    for (int i = 1; i <= n; i++){
        base *= 2;
        sum += base;
    }
    return sum;
}

// sumPower2 runs faster because it only needs 1 loop => O(n)
// sumPower need power(O(n)) and runs it n-times => O(n^2)

/*
    B2
        */

// O(n)
void fibLoop(int n){
    int a[n];
    a[0] = 0, a[1] = 1, a[2] = 1;
    if (n < 3)
        return;
    for (int i = 1; i < 3; i++)
        cout << a[i] << ' ';
    for (int i = 3; i <= n; i++){
        a[i] = a[i-1] + a[i-2];
        cout << a[i] << ' ';
    } 
}

// 1.6180 ~ 2
// O(2^n)
int fibRecursion(int n){
    if (n <= 1)     
        return n;
    return fibRecursion(n-1) + fibRecursion(n-2);
}

// O(n*(2^n))
void fibRecursionList(int n){
    for (int i = 1; i <= n; i++)
        cout << fibRecursion(i) << ' ';
}

/*
    B3
        */

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


/*
    B4
        */

vector<string> bagOfStrings;

bool checkSingle(string s){
    return s.size() == 1;
}

void showHead(){
    for (int i = 0; i < bagOfStrings.size(); i++)
        cout << bagOfStrings[i] << ' ';
    cout << '\n';
}

void hydraSimulator(string s){
    bagOfStrings.push_back(s);
    while (!bagOfStrings.empty()){
        string cut = bagOfStrings.back();
        if (!checkSingle(cut)){
            cut = cut.substr(1);
            bagOfStrings.pop_back();
            bagOfStrings.push_back(cut);
            bagOfStrings.push_back(cut);
        }else bagOfStrings.pop_back();
        showHead();
    }
}



int main(){
    // // B1
    // int n;
    // cin >> n;
    // cout << sumPower2(n) << sumPower(n);

    // // B2
    // int n;
    // cin >> n;
    // fibLoop(n);
    // fibRecursionList(n);

    // // B3
    // int n = 6;
    // // int a[n] = {-2, 11, -4, 13, -5, -2};
    // int a[n] = {3, -2, 11, 13, -5, -2};
    // bruteForce(a, n);
    // improved(a, n);
    // dynamicProgramme(a, n);

    // // B4
    // string s = "HYDRA";
    // hydraSimulator(s);

    return 0;
}