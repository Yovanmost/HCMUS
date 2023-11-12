#include <iostream>

using namespace std;

void pointer3D(){
    int n = 3;
    int*** a = new int** [n];

    for (int i = 0; i < n; i++){
        a[i] = new int* [n];
        for (int j = 0; j < n; j++){
            a[i][j] = new int [n];
        }
    }
}

void _pointer3D(int*** a, int n){
    for (int i = 0; i < n; i++){
        for (int j = 0; j < n; j++)
            delete []a[i][j];
        delete []a[i];
    }
    delete []a;
}

void pointer4D(){
    int n = 4;
    int**** a = new int*** [n];

    for (int i = 0; i < n; i++){
        a[i] = new int** [n];
        for (int j = 0; j < n; j++){
            a[i][j] = new int* [n];
            for (int k = 0; k < n; k++)
                a[i][j][k] = new int [n];
        }
    }
}

void _pointer4D(int**** a, int n){
    for (int i = 0; i < n; i++){
        
        for (int j = 0; j < n; j++){
            for (int k = 0; k < n; k++)
                delete []a[i][j][k];
            delete []a[i][j];
        }
        delete []a[i];
    }

    delete []a;
}

int main(){


    return 0;
}