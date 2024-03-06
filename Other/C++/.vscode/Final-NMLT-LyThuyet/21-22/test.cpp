#include <iostream>
#include <string.h>

using namespace std;

void swap(int& a, int& b){
    int tmp = a;
    a = b;
    b = tmp;
}

void interchangeSort(int a[], int n){
    for (int i = 0; i < n - 1; i++)
        for (int j = i + 1; j < n; j++)
		if (a[i] > a[j])
			swap(a[i], a[j]);
}

void removeChar(char s[], int pos){
    for (int i = pos; i < strlen(s) - 1; i++){
        s[i] = s[i+1];
    }
    int n = strlen(s);
    s[n - 1] = '\0'; 
}

void removeSpace(char s[]){
    
    // remove space in the middle
    int n = strlen(s);
    for (int i = 0; i < strlen(s) - 1; i++){
        if (s[i] == ' ' && s[i+1] == ' '){
            removeChar(s, i);
            i--;
        }
    }

    // remove space at the beginning
    if (s[0] == ' '){
        removeChar(s, 0);
    }
        
    // remove space at the end
    if (s[strlen(s) - 1] == ' ')
        removeChar(s, strlen(s) - 1);
}

void deleteItemsFromIndex(int a[], int  &n, int index, int no_items){
//	if (index + no_items >= n)
//		return -1;
	for (int i = index ; i < (n - no_items); i++){
		a[i] = a[i + no_items];
	}
	n = n - no_items;
}

int main(){
    // int a[1000];
    // int n;
    // cin >> n;
    // for (int i = 0; i < n; i++)
    //     cin >> a[i];

    // for (int i = 0; i < n; i++)
    //     cout << a[i] << " ";

    // cout << "\n";
    // interchangeSort(a, n);

    // for (int i = 0; i < n; i++)
    //     cout << a[i] << " ";

    // char test[256];
    // cin.getline(test, 256);
    // removeSpace(test);
    // cout << "~~~" << test << "~~~";

    int a[1000];
    int n;
    cin >> n;
    for (int i = 0; i < n; i++)
        cin >> a[i];

    for (int i = 0; i < n; i++)
        cout << a[i] << " ";

    int m;
    cin >> m;
    
        
    return 0;
}