#include <iostream>
#include <string>
#include <string.h>
#include <vector>
#include <fstream>

using namespace std;

struct PLAYER
{
    char pos[256];
    char name[256];
    char lastName[256];
    int year;
    char nationTeam[256];
    char club[256];
};

PLAYER lastName(PLAYER &a){
    char* last_space;
    char family_name[256];

    // find the first name
    last_space = strrchr(a.name, ' '); 
    if (last_space == NULL){
        strcpy(a.lastName, a.name);
        cout << a.name << "\n";
    }
    else{
        last_space = strrchr(a.name, ' '); 
        strcpy(a.lastName, last_space + 1); 
        cout << a.lastName << "\n";
    }

}

int main(){
    // open file
    ifstream fr;
    fr.open("Players.txt");

    if (fr.is_open() == false){
        cout << "Can't open file (fr)";
        return 0;
    }

    // store the list of players
    vector<PLAYER> listPlayer;
    // make a holder
    PLAYER playerTemp;

    char year[256];

    // read the information from the file to the holder and add it to the list
    while (fr.eof() == false){
        fr.getline(playerTemp.pos, 256,'/');
        fr.getline(playerTemp.name, 256,'/');
        fr.getline(year, 256,'/');
        playerTemp.year = stoi(year);
        fr.getline(playerTemp.nationTeam, 256,'/');
        fr.getline(playerTemp.club, 256,'\n');

        listPlayer.push_back(playerTemp);
    }

    for (int i = 0; i < listPlayer.size(); i++){
        lastName(listPlayer[i]);
    }

    fr.close();

    return 0;
}