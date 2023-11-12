#include <iostream>

using namespace std;

int main(){
    int n, i, j, k, x = 1, y = 1;
    int count = 0;

    cout << "Height: ";
    cin >> n;

    for (i = 1; i <= n; i++)
    {
        //space in
        for (k = i; k < n; k++)
        {
            cout << " ";
        }

        //first half and mid
        for (j = n; j > (n - i); j--)
        {
            int tmp = x;
            if (tmp >= 10){
                tmp = x % 10;
                cout << tmp;
                x++;
                y = x - 2;

            }else
            cout << x++;
            y = x - 2;
        
        }
    
        x = i + 1;

        //second half
        for (j = n - 2; j >= (n - i); j--)
        {   
            int tmp2 = y;
            if (tmp2 >= 10){
                tmp2 = y % 10;
                cout << tmp2;
                y--;
            }else
            cout << y--;
        }

        cout << ("\n");
    }
}