#include <iostream>
#include <string>
#include <string.h>
#include <vector>
#include <fstream>
#include <sstream>

using namespace std;

struct PLAYER
{
    string pos;
    string name;
    string lastName;
    int year;
    string nationTeam;
    string club;
};

// finding the player's last name
// PLAYER lastName (vector<PLAYER> &arr)
// {
//     for (int i = 0; i < arr.size(); i++){
//         int found = arr[i].name.find_last_of(" ");
//         string lastName = arr[i].name.substr(found+1);
//         arr[i].lastName += lastName;
//     }   
// }

PLAYER lastName (PLAYER &a)
{
    int idex = -1;
    for (int i = 0; i < a.name.length(); i++)
        if (a.name[i] == ' ')
            idex = i;
    if (idex == -1)
        a.lastName = a.name;
    else 
        for (int i = idex+1; i < a.name.length(); i++)
            a.lastName += a.name[i];
}

int main(){
    // ++++++++++ READ FILE ++++++++++

    // open file
    ifstream fr;
    fr.open("Players.txt");

    if (fr.is_open() == false){
        cout << "Can't open file (fr)";
        return 0;
    }else cout << "Opened\n";

    // store the list of players
    vector<PLAYER> listPlayer;
    // make a holder
    PLAYER playerTemp;

    // tmp 
    char year[256];
    string s, tmpYear;

    cout << "Start reading\n";
    // read the information from the file to the holder and add it to the list
    while (fr.eof() == false){
        // make a bar for reading string
        getline(fr, s);
        // this is the bar
        stringstream ss(s);

        getline(ss, playerTemp.pos, '/');
        getline(ss, playerTemp.name, '/');
        getline(ss, tmpYear, '/');
        playerTemp.year = stoi(tmpYear);
        getline(ss, playerTemp.nationTeam, '/');
        getline(ss, playerTemp.club, '/');

        listPlayer.push_back(playerTemp);
    }

    cout << "READ finished\n";

    // find the last name
    // bug
    // for (int i = 0; i < listPlayer.size(); i++){
    //     lastName(listPlayer[i]);
    //     cout << listPlayer[i].lastName;
    // }
        
    // sorting from year of birth and last name

    for (int i = 0; i < listPlayer.size(); i++)
        cout << listPlayer[i].year << "/" << listPlayer[i].lastName << "\n";  
    
    fr.close();
    cout << "Close READ";

    return 0;
}