#include <iostream>



using namespace std;

// create a array that record
// repeat number
// loop1: find repeated num
// loop2: delete repeated num

void inStudent(int a[], int n){
    for (int i = 0; i < n; i++){
        cin >> a[i];
    }
}

void outStudent(int a[], int n){
    for (int i = 0; i < n; i++){
        cout << a[i] << " ";
    }
    cout << "\n";
}

void removeStudent(int a[], int& n, int pos){
    for (int i = pos; i < n - 1; i++){
        a[i] = a[i+1];
    }
    n--;
}

int sumNum(int n){
    int du;
    int sum = 0;
    while (n > 0){
        du = n % 10;
        sum = sum * 10 + du;
        n /= 10;
    }

    return sum;
}

void findRepeatStudent(int a[], int& n){
   int max = 0;
    for (int i = 0; i < n; i++){
        if (a[i] > max)
            max = a[i];
    }

    //mang danh dau
    int b[max+1];
    for (int i = 0; i <= max; i++)
        b[i] = 0;
    
    //truy tim phan tu lap
    for (int i = 0; i < n; i++){
        b[a[i]]++;
    }

    //khu ptu lap
    for (int i = 0; i < n; i++){
        if (b[a[i]] > 1){
            removeStudent(a, n, i);
            i--;
        }
    }

    //tim winner
    int min = 1e7;
    bool flag = false;
    for (int i = 0; i < n; i++){
        if (a[i] % n == 0 && a[i] < min){
            flag = true;
            min = a[i];
        }
    }

    //phong khi 2 truong hop tren tach
    int lastMax = 0;
    if (flag == false){
        for (int i = 0; i < n; i++)
            if (sumNum(a[i]) > lastMax)
                lastMax = a[i];

        cout << lastMax << "\n";
    }
    else cout << min << "\n";


}


int main(){
    int n;
    cin >> n;
    int a[1000];
    inStudent(a, n);
    outStudent(a, n);
    findRepeatStudent(a, n);
    outStudent(a, n);

    
    return 0;
}