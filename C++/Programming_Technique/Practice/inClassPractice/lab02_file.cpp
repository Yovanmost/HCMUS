#include <iostream>
#include <fstream>
#include <string>
#include <sstream>

using namespace std;

struct Player
{
    string pos;
    string name;
    int age;
    string country;
    string club;
};


int main(){
    // pointer fi (kind of a bar for reading shit) for reading string
    fstream fi("Players.txt");
    string s, tmp;
    
    int count = 0;
    Player P[100];
    while (fi.eof() == false){
        getline(fi, s);

        // like a bar for reading but only for the given string
        stringstream ss(s);

        getline(ss, tmp, '/'); // read pos
        P[count].pos = tmp;
        
        getline(ss, tmp, '/'); // read name
        P[count].name = tmp;
        
        getline(ss, tmp, '/'); // read age (2023 - birth year)
        P[count].age = 2023 - stoi(tmp);
        cout << tmp;
        
        getline(ss, tmp, '/'); // read country
        P[count].country = tmp;
        
        getline(ss, tmp, '\n'); // read club
        
        count++;
    }

    for (int i = 0; i < count; i++){
        cout << "Player: " << P[i].name << " is " << P[i].age << " years old\n";
    }


    return 0;
}