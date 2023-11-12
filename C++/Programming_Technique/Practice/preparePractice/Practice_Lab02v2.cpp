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

void lastName(PLAYER &a){
    int idex = -1;

    for (int i = 0; i < strlen(a.name); i++)
        if (a.name[i] == ' ')
            idex = i;
    int j = 0;
    if (idex == -1){
        strcpy(a.lastName, a.name);
    }
    else{
        for (int i = idex+1; i < strlen(a.name); i++)
            a.lastName[j++] = a.name[i];
        a.lastName[j] = '\0';   
    }

}

// bool compareYearName(PLAYER a, PLAYER b){
//     return (a.year > b.year) || 
//             (a.lastName[0] > b.lastName[0]) ||
//             ((a.year == b.year) && (strcmp(a.lastName, b.lastName) > 0)) ;
// }

// condition for checking
bool compareYearName(PLAYER a, PLAYER b){
    if (a.year > b.year) return true;
    if (a.year < b.year) return false;

    // if (a.lastName[0] > b.lastName[0]) return true;
    // if (a.lastName[0] < b.lastName[0]) return false;

    if (strcmp(a.lastName, b.lastName) > 0) return true;
    if (strcmp(a.lastName, b.lastName) < 0) return false;

    // same last name and same year
    return false;
}

// sorting the list from age and alphabet
void interchangeSortPlayer(vector<PLAYER> &a){
    for (int i = 0; i < a.size() - 1; i++)
        for (int j = i + 1; j < a.size(); j++)
            if (compareYearName(a[i], a[j]) == true)
                swap(a[i], a[j]);
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

    for(int i = 0; i < listPlayer.size(); i++){
        lastName(listPlayer[i]);
    }

    

    
    // // // add last name and print it out with year
    // for(int i = 0; i < listPlayer.size(); i++){
    //     cout << listPlayer[i].year << "/" << listPlayer[i].club << "\n";
    // }

    fr.close();

    // make a file for storing information
    ofstream fw;
    fw.open("PlayerRes.txt");

    if (fw.is_open() == false){
        cout << "Can't open file (fw)";
        return 0;
    }

    // Find all players born in 1994.
    fw << "***Players who wer born in 1994***\n";
    for (int i = 0; i < listPlayer.size(); i++){
        if (listPlayer[i].year == 1994)
            fw << listPlayer[i].name << "/" << listPlayer[i].club << "\n";
    }

    // Find all players who play for Manchester United club.
    fw << "\n***Players who play for MU***\n";
    for (int i = 0; i < listPlayer.size(); i++){
        if (strcmp(listPlayer[i].club, "Manchester United") == 0)
            fw << listPlayer[i].name << "/" << listPlayer[i].year << "\n";
    }

    // Find all FW play for Manchester City.
    fw << "\n***FW Players who play for MC***\n";
    for (int i = 0; i < listPlayer.size(); i++){
        if (strcmp (listPlayer[i].club, "Manchester City") == 0 && strcmp(listPlayer[i].pos, "FW") == 0) 
            fw << listPlayer[i].name << "/" << listPlayer[i].year << "\n";
    }

    // sorting from year of birth and name
    interchangeSortPlayer(listPlayer);
    fw << "\n***Sorting from year of birth and name***\n";
    for(int i = 0; i < listPlayer.size(); i++){
        fw << listPlayer[i].year << "/" << listPlayer[i].lastName << "\n";
    }
    

    fw.close();

    return 0;
}