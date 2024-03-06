#include <iostream>
#include <cstring>

using namespace std;

struct LAPTOP{
    char thuongHieu[10];
    char dongMay[20];
    float kichThuoc;
    int giaTien;
};

void inLaptop(LAPTOP a[], int n){
    for (int i = 0; i < n; i++){
        cin.getline(a[i].thuongHieu, 10);
        cin.getline(a[i].dongMay, 20); 
        cin >> a[i].kichThuoc >> a[i].giaTien;
        cin.ignore();
    }
}

void outLaptop(LAPTOP a[], int n){
    for (int i = 0; i < n; i++){
        cout << a[i].thuongHieu << " " << a[i].dongMay << " " << a[i].kichThuoc << 
        " " << a[i].giaTien << "\n";
    }
}

int roundPrice(int& n){
    int du;
    int sum;
    int x;
    du = n % 1000;
    if (du == 0)
        return n;
    sum = 1000 - du;
    n = n + sum;   
    return n;
}

void roundLaptop(LAPTOP a[], int n){
    for (int i = 0; i < n; i++){
        a[i].giaTien = roundPrice(a[i].giaTien);
    }
}



int main(){
    int n;
    cin >> n;
    cin.ignore();

    LAPTOP a[n];
    inLaptop(a, n);
    outLaptop(a, n);
    roundLaptop(a, n);
    outLaptop(a, n);
    return 0;
}