#include <iostream>
#include <vector>

using namespace std;

// 1b
void customSort(vector<int> &a){

}

void evenLast(vector<int> &a){
    int front = 0, back = a.size() - 1;
    while (front < back){
        if (a[front] % 2 == 0 && a[back] % 2 != 0)
            swap(a[front++], a[back--]);

        if (a[front] % 2 != 0){
            front++;
            continue;
        }

        if (a[back] % 2 == 0){
            back--;
            continue;
        }
    }
    int lastEven = front;

    for (int i = lastEven; i < a.size(); i++)
        cout << a[i] << ' ';

    
    for (int i = lastEven; i < a.size()-1; i++){
        int maxIdex = i;
        for (int j = i+1; j < a.size(); j++){
            if (a[j] > a[maxIdex])
                maxIdex = j;
        }
        if (i != maxIdex)
            swap(a[i], a[maxIdex]);
    }
    
    cout << '\n';
    for (int i = 0; i < a.size(); i++)
        cout << a[i] << ' ';       
}

int main(){
    vector<int> a = {5, 3, 2, 7 ,9, 12, 4, 3, 6, 13};
    evenLast(a);
    return 0;
}