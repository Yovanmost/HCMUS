#include <iostream>
#include <string>
#include <fstream>
#include <vector>

using namespace std;

void readFile(string fileName){
    ifstream fr;
    fr.open(fileName);
    int relations;
    fr >> relations;
    
    for (int i = 0; i < relations; i++){
        string parent;
        vector<string> children;
        string tmp, tmp2;
        char delimiter;
        fr >> delimiter;
        fr >> parent;
        fr >> delimiter;
        cout << parent << "|";
        do {
            fr >> tmp;
            if (tmp.back() == ')'){
                tmp2 = tmp.substr(0, tmp.size() - 2);
                cout << tmp2;
                continue;
            }
                
            cout << tmp << ",";
        }while (tmp.back() != ')');
        cout << '\n';
    }

    fr.close();
}

int main(){
    string s = "input.txt";
    readFile(s);
    
    return 0;
}