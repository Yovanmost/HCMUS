#include <iostream>

using namespace std;

int *createArr(int n){
    int *arr = nullptr;
    if (n <= 0)
        return nullptr;
    
    arr = new int[n];

    for (int i = 0; i < n; i++)
        cin >> arr[i];
    
    return arr; // return the address
                // of the first element
}

int main(){
    int n;
    cin >> n;
    
    int *a = createArr(n);

    for (int i = 0; i < n; i++)
        cout << *(a + i) << " ";

    delete [] a;
    a = 0;
  
    return 0;
}