#include <iostream>

using namespace std;

struct City{
    char name[30];
    int space;
    int population;
};

void inCity(City a[], int& n){
    cin >> n;
    cin.ignore();

    for (int i = 0; i < n; i++){
        cin.getline(a[i].name, 30);
        cin >> a[i].space;
        cin >> a[i].population;
        cin.ignore();
    }
}

void outCity(City a[], int n){
    for (int i = 0; i < n; i++){
        cout << a[i].name << "|" << a[i].space << "|" << a[i].population << "\n";
    }
}


int main(){
    int n;
    City a[20];
    inCity(a, n);
    outCity(a, n);
    return 0;
}
