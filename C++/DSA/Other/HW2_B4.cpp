#include <iostream>
#include <string>
#include <vector>

using namespace std;

vector<string> bagOfStrings;

bool checkSingle(string s){
    return s.size() == 1;
}

void showHead(){
    for (int i = 0; i < bagOfStrings.size(); i++)
        cout << bagOfStrings[i] << ' ';
    cout << '\n';
}

void hydraSimulator(string s){
    bagOfStrings.push_back(s);
    while (!bagOfStrings.empty()){
        string cut = bagOfStrings.back();
        if (!checkSingle(cut)){
            cut = cut.substr(1);
            bagOfStrings.pop_back();
            bagOfStrings.push_back(cut);
            bagOfStrings.push_back(cut);
        }else bagOfStrings.pop_back();
        showHead();
    }
}


int main(){
    string s = "HYDRA";
    hydraSimulator(s);
    return 0;
}