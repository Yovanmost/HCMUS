#include <iostream>

using namespace std;

void inArray(int a[], int &n){
    cin >> n;
    for (int i = 0; i < n; i++){
        cin >> a[i];
    }
}

void outArray(int a[], int n){
    for (int i = 0; i < n; i++){
        cout << a[i] << " ";
    }
}

void bubbleSort(int a[], int n){
    for (int i = 1; i <= n - 1; i++){
        for (int j = n - 1; j >= i; j--){
            if (a[j] > a[j-1])
                swap(a[j], a[j-1]);
            outArray(a, n);
            cout << "\n";
        }
        cout << "\n";
    }
}

void testing16(int a[], int n){
    int i, j, count = 0;
    for (i = 1; i < n; i++)
        for (j = n - 1; j >= i; j--)
            if (a[j] < a[j - 1]){
                count++; swap(a[j], a[j-1]); //Add swap function  
            } //Change '>' to '<'
                    
    cout << count;
}

int binarySearch(int a[], int n, int& k){
    int l = 0;
    int r = n - 1;
    cout << "Find k: ";
    cin >> k;
    while (l <= r){
        int m = (l + r) / 2;
        cout << l << "|" << r << "\n";
        // cout << a[m] <<"\n";
        if (a[m] == k)
            return m;
        else if (k < a[m])
            r = m - 1;
        else 
            l = m + 1;         
    }
    return -1;
}

void insertionSort(int arr[], int n)
{
   int i, key, j;
   for (i = 1; i < n; i++)
   {
       key = arr[i];
       j = i-1;
 
       /* Di chuyển các phần tử có giá trị lớn hơn giá trị 
       key về sau một vị trí so với vị trí ban đầu
       của nó */
       while (j >= 0 && arr[j] > key)
       {
           arr[j+1] = arr[j];
           j = j-1;
       }
       arr[j+1] = key;
       outArray(arr, n);
       cout << "\n";
   }
}

void interchangeSort(int a[], int n){
    for (int i = 0; i < n - 1; i++){
        for (int j = i; j < n; j++)
            if (a[i] < a[j])
                swap(a[i], a[j]);
        outArray(a, n);
        cout << "\n";
    }
        
            
}

int main(){
    int a[100];
    int n,k;
    inArray(a, n);
    // bubbleSort(a, n);
    // testing16(a, n);
    // insertionSort(a, n);
    binarySearch(a, n, k);
    interchangeSort(a, n);
    outArray(a, n);
    // cout << "\n" << binarySearch(a, n, k);

    return 0;
}