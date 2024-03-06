#include <iostream>
#include <string>
#include <fstream>
#define long long long

using namespace std;

long countLines(string fileName){
    ifstream fr;
    fr.open(fileName);
    string tmp;
    long n = 0;
    while (getline(fr, tmp))
        n++;
    fr.close();
    return n;
}

void read(short t, long n, string fileName){
    string tmp;
    long lines = countLines(fileName), k = 0;
    ifstream fr;
    fr.open(fileName);
    if (t == 0){
        while (n--){
            getline(fr, tmp);
            cout << tmp << '\n';
        }
        fr.close();
    }
    else if (t == 1){
        long skipped = lines - n;
        while (k++ != skipped)
            getline(fr, tmp);
        while (n--){
            getline(fr, tmp);
            cout << tmp << '\n';
        }
    }
}

void test(string s){
    ifstream fr;
    fr.open(s);
    string tmp;
    fr >> tmp;
    cout << tmp;
    fr.close();
}

int main(){
    string s = "Untitled-1.txt";
    int t;
    long n;
    cin >> t >> n;
    read(t, n, s);
    return 0;
}