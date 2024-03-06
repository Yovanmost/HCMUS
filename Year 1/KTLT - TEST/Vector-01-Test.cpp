#include <iostream>
#include <vector>

using namespace std;

int main(){

    vector<int> numbers;
    int n;
    cin >> n;
    for (int i = 0; i < n; i++)
        numbers.push_back(i);

    for (int i = 0; i < n; i++)
        cout << numbers[i] << " ";
    cout << "\n" << numbers.size() << "\n";
    numbers.pop_back();
    cout << numbers.size() << "\n";
    for (int i = 0; i < numbers.size(); i++)
        cout << numbers[i] << " ";

    return 0;
}