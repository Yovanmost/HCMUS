#include <iostream>
#include <cstring>

using namespace std;

struct NAME{
    char name[256];
};

int main(){
    NAME student[100];
    NAME tmp[100];
    int n;
    cin >> n;
    cin.ignore();
    for (int i = 0; i < n; i++){
        cout << "Name[" << i+1 << "]: ";
        cin.getline(student[i].name, 256);
    }

    for (int i = 0; i < n; i++){
        cout << student[i].name << "\n";
    }

    cout << "_______";
    
    for (int i = 0; i < n - 1; i++)
        for (int j = 0; j < n - i - 1; j++)
            if (strcmp(student[j].name,student[j+1].name) > 0)
                swap(student[j].name, student[j+1].name);   

    for (int i = 0; i < n; i++){
        cout << student[i].name << "\n";
    }

    // char t[256];
    // char a[256] = "abcd";
    // char b[256] = "aace";
    // cout << strcmp(a, b);

}