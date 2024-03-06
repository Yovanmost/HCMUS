#include <iostream>
#define MAXELE 100
#include <string.h>
#include <string>
#include <string.h>

using namespace std;

// No.1
int sumToN(int n){
    int sum = 0;
    for (int i = 1; i <= n; i++)
        sum += i;
    return sum;
}

float totalSum(int n){
    float sum = 0;
    for (int i = 1; i <=n; i++){
        sum += i * 1.0 / sumToN(i);
    }

    return sum;
}

// No.2
void inArr(int a[], int& n){
    cin >> n;
    for (int i = 0; i < n; i++)
        cin >> a[i];
}

void outArr(int a[], int n){
    for (int i = 0; i < n; i++)
        cout << a[i] << " ";
}

int checkPlus(int a[], int n){
    int check = a[1] - a[0];
    for (int i = 0; i < n - 1; i++){
        if (a[i+1] - a[i] != check)
            return 0;
    }
    return 1;
}

// No.3
bool convertMatrixToArray(int a[][MAXELE], int mRow, int nCol, int b[], int& k){
    k = mRow * nCol;
    int count = 0;
    for (int i = 0; i < mRow; i++){
        for (int j = 0; j < nCol; j++){
            b[count++] = a[i][j];
        }
    }
}
// test case
// int a[MAXELE][MAXELE];
//     int b[MAXELE];

//     int count = 0;
//     int k;
//     for (int i = 0; i < 3; i++)
//         for (int j = 0; j < 3; j++)
//             a[i][j] = count++;
            
//     for (int i = 0; i < 3; i++){
//         for (int j = 0; j < 3; j++)
//             cout << a[i][j] << " ";
//         cout << "\n";
//     }  

//     convertMatrixToArray(a, 3, 3, b, k);
//     outArr(b, k);


// No.4
struct Student{
    char MSSV[256];
    char hoVaTen[256];
    int diemTB;
};

Student topStudent[1000];

void swap(Student& a, Student& b){
    Student tmp = a;
    a = b;
    b = tmp;
}

void inStudent(Student a[], int& n){
    cin >> n;
    cin.ignore();
    for (int i = 0; i < n; i++){
        cin.getline(a[i].MSSV, 256);
        cin.getline(a[i].hoVaTen, 256);
        cin >> a[i].diemTB;
        cin.ignore();
    }
}

void outStudent(Student a[], int n){
    for (int i = 0; i < n; i++){
        cout << a[i].MSSV << "|" << a[i].hoVaTen << "|" << a[i].diemTB <<"\n";
    }
}

void findTopStudent(Student a[], int n){
    Student tmp[n];
    for (int i = 0; i < n; i++)
        tmp[i] = a[i];

    int countTop = 0;
    
    while (true){
        int maxPoint = 0;
        for (int i = 0; i < n; i++){
            if (a[i].diemTB > maxPoint)
                maxPoint = a[i].diemTB;
        }

        if (maxPoint == 0)
            break;

        if (countTop > 3)
            break;

        for (int i = 0; i < n; i++){
            if (a[i].diemTB == maxPoint){
                topStudent[countTop++] = a[i];
                if (countTop > 3)
                    break;
                a[i].diemTB = 0;
            }
        }
    }

    for (int i = 0; i < n; i++)
        a[i] = tmp[i];

}

void interchangeSort(int n){

    for (int i = 0; i < n - 1; i++)
        for (int j = i + 1; j < n; j++){
            if (topStudent[i].diemTB == topStudent[j].diemTB && strcmp(topStudent[i].MSSV, topStudent[j].MSSV) > 0)
                swap(topStudent[i], topStudent[j]);
        }
            
}

int main(){
    // int n; 
    // Student a[1000];
    // inStudent(a, n);
    // outStudent(a, n);

    // findTopStudent(a, n);
    // interchangeSort(3);

    // for (int i = 0; i < 3; i++)
    //     cout << topStudent[i].MSSV << "|" << topStudent[i].hoVaTen << "|" << topStudent[i].diemTB <<"\n";

    string s = "-9";
    float a = stoi(s);
    cout << a + 1;
    
    return 0;
}