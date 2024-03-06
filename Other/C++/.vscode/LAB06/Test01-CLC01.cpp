#include <iostream>
#include <math.h>

using namespace std;

float findMax(float a, float b){
    if (a > b)
        return a;
    return b;
}

float findMin(float a, float b){
    if (a < b)
        return a;
    return b;
}

int main(){
    int n;
    cin >> n;
    n*= 3;

    int a[n];
    for (int i = 0; i < n; i+=3){
        cout << "Nguyen: ";
        cin >> a[i];
        cout << "Tu: ";
        cin >> a[i+1];
        if (a[i+1] == 0)
            return 1;
        cout << "Mau: ";
        cin >> a[i+2];
        if (a[i+2] == 0)
            return 2;
        if (a[i+2] < a[i+1])
            return 3;
    }

    for (int i = 0; i < n; i+=3){
        cout << a[i] << " " << a[i+1] << "/" << a[i+2] << "\n";
    }

    cout << "---------------------------------\n";

    int m = n / 3;
    float b[m];
    
    for (int i = 0, j = 0; i <n; i+=3){
        b[j] = (a[i] * a[i+2] + a[i+1]) * 1.0 / a[i+2];
        j++;
    }

    float min = 1e7;
    int idexMin = 0;
    for (int i = 0;i < m; i++){
        if (b[i] < min){
            min = b[i];
            idexMin = i;
        }
            
    }

    // 0 1 2 3 4 5 6 7 8 
    // 0 - - 1 - - 2 - -
    for (int i = 0; i < m; i++)
        cout << b[i] << "\n";

    cout << "Hon so min: " << a[idexMin*3] << " " << a[idexMin*3+1] << "/" << a[idexMin*3+2] << "\n";

    cout << "Thap phan vo han:\n";
    for (int i = 0; i < n; i+=3){
        if (a[i+2] % 2 != 0 || a[i+2] % 5 != 0){
            // cout << a[i+2] << "\n";
            cout << a[i] << " " << a[i+1] << "/" << a[i+2] << "\n";        
        }
    }

    int idexM1 = 0;
    int idexM2 = 0;
    float minDis = 1e7;
    for (int i = 0; i < m - 1; i++)
        for (int j = i + 1; j < m; j++){
            if (findMax(b[i], b[j]) - findMin(b[i], b[j]) * 1.0 < minDis){
                idexM1 = i;
                idexM2 = j;
                // cout << b[i] << " " << b[j] << "\n";
                minDis = findMax(b[i], b[j]) - findMin(b[i], b[j]) * 1.0;
                // cout << minDis << "\n";
            }
        }

    cout << "Cap hon so nhau nhat: "<< a[idexM1*3] << " " << a[idexM1*3+1] << "/" << a[idexM1*3+2] << " va "
                                    << a[idexM2*3] << " " << a[idexM2*3+1] << "/" << a[idexM2*3+2] << "\n";

    return 0;
}