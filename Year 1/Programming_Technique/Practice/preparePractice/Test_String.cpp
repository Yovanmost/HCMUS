#include <iostream>
#include <string>
#include <string.h>

using namespace std;

void SplitFilename (const std::string& str)
{
  cout << "Splitting: " << str << '\n';
  int found = str.find_last_of("/\\");
  cout << " path: " << str.substr(0,found) << '\n';
  cout << " file: " << str.substr(found+1) << '\n';
}

void SplitLastname (const string& str)
{
    int found = str.find_last_of(" ");
    cout << "Last name: " << str.substr(found+1) << '\n';
}
  

bool stringTesting(string a, string b){
    return (a[0] > b[0]) || (a > b);
}

string lastName (string s)
{
    string last;
    int idex = -1;
    for (int i = 0; i < s.length(); i++)
        if (s[i] == ' ')
            idex = i;
    if (idex == -1)
        last = s;
    else 
        for (int i = idex+1; i < s.length(); i++)
            last += s[i];
    cout << last;
}

int main (){
    string s;
    getline(cin, s);

    int n = s.size();
    int idex = -1;
    for (int i = 0; i < n; i++)
        if (s[i] == ' ') idex = i;

    string newS = s.substr(idex+1, s.size());
    cout << newS;

    return 0;
}