#include <iostream>
#include <string.h>

using namespace std;

// idea here is scan the num to find the min
// if there's only 1 min = true else false
// and there's no max then true
// only scan the number that has both left and right
// ex: 97568
//  9               8
//      7       6
//          5
//-----------------------------------------------------
//  9               8
//      7       6       7
//          5
// 8 is max here so this is not V-num

bool checkMin(char* a){
    int n = strlen(a);
    int countMin = 0, countMax = 0;

    for (int i = 1; i < n - 1; i++){
        if (a[i-1] > a[i] && a[i] < a[i+1])
            countMin++;
    }

    for (int i = 1; i < n - 1; i++){
        if (a[i-1] < a[i] && a[i] > a[i+1])
            countMax++;
    }

    if (countMin == 1 && countMax == 0)
        return true;
    return false;
}

int main(){
    char* num;
    cin >> num;
    if (checkMin(num))
        cout << "V";
    else cout << "Not V";

    return 0;
}