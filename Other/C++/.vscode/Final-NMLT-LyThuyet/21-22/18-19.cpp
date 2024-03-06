#include <iostream>
#include <string.h>

#define MAXELE 100

using namespace std;

long long power(int x, int y){
    long long sum = x;

    if (y == 0)
        return 1;
    
    for (int i = 0; i < y - 1; i++){
        long long tmp = 0;
        for (int j = 0; j < x; j++){
            tmp += sum;    
        }
        sum = tmp;        
    }       

    return sum;
}

void countWords(char s[]){
    int n = strlen(s);
    int count = 0;
    for (int i = 0; i < n - 1; i++)
        if ((s[i] != ' ' && s[i] != '.' && s[i] != ',') && (s[i+1] == ' ' || s[i+1] == '.' || s[i+1] == ','))
            count++; 
    cout << count;   
}

void removeChar(char s[], int pos){
    for (int i = pos; i < strlen(s) - 1; i++){
        s[i] = s[i+1];
    }
    int n = strlen(s);
    s[n - 1] = '\0'; 
}

void removeSpace(char s[]){
    // count the words have been deleted
    int x = 0;
    
    // remove space in the middle
    int n = strlen(s);
    for (int i = 0; i < n - 1; i++){
        if (s[i] == ' ' && s[i+1] == ' '){
            removeChar(s, i);
            i--;
            x++;
        }
    }

    // remove space at the beginning
    if (s[0] == ' '){
        removeChar(s, 0);
        x++;
    }
        
    // remove space at the end
    if (s[n - 1 - x] == ' ')
        removeChar(s, n - 1 - x);
}

void inArr(int a[][MAXELE], int& mRow, int& nCol){
    cin >> mRow >> nCol;
    for (int i = 0; i < mRow; i++)
        for (int j = 0; j < nCol; j++)
            cin >> a[i][j];
}

void outArr(int a[][MAXELE], int mRow, int nCol){
    for (int i = 0; i < mRow; i++){
        for (int j = 0; j < nCol; j++)
            cout <<  a[i][j] << " ";
        cout << "\n";
    }
    cout << "\n";
    for (int i = 0, j = 0; i < mRow; i++){
        cout <<  a[i][j++] <<  " ";
    } 
    cout << "\n";
    for (int i = mRow - 1, j = 0; i >= 0; i--){
        cout << a[i][j++] << " ";
    } 
    cout << "\n\n";
    for (int j = 0; j < nCol; j++){
        // int tmp = 0;
        for (int i = 0; i < mRow; i++){
            // tmp += a[i][j];
            cout << a[i][j] << " ";
        }
        // if (tmp != sum)
        //     return 2;
        cout << "\n";
    }
}

int checkMaPhuong(int a[][MAXELE], int mRow, int nCol){
    int sum = 0;
    for (int i = 0; i < mRow; i++){
        sum += a[i][0];
    }

    for (int i = 0; i < mRow; i++){
        int tmp = 0;
        for (int j = 0; j < nCol; j++){
            tmp += a[i][j];
        }
        if (tmp != sum)
            return 1;
    }

    for (int j = 0; j < nCol; j++){
        int tmp = 0;
        for (int i = 0; i < mRow; i++){
            tmp += a[i][j];
        }
        if (tmp != sum)
            return 2;
    }

    int sumCheo = 0;
    for (int i = 0, j = 0; i < mRow; i++){
        sumCheo += a[i][j++];
    } 
    if (sumCheo != sum)
        return 3;
    
    int sumCheo2 = 0;
    for (int i = mRow - 1, j = 0; i >= 0; i--){
        sumCheo2 += a[i][j++];
    }
    if (sumCheo2 != sum)
        return 4;

    return 5;
}

int main(){
   
    // char s[1000] = "   Hom nay,troi   dep qua.Hay  ra ngoai choi  ";
    // removeSpace(s);
    // cout << s;
    // countWords(s);
    
    int x = 5;
    int y = 0;
    cout << power(x, y);

    // int a[MAXELE][MAXELE];
    // int m, n;
    // inArr(a, m, n);
    // outArr(a, m, n);
    // cout << checkMaPhuong(a, m, n);

    return 0;
}