#include <iostream>
#include <string>
#include <string.h>
#include <vector>
#include <fstream>
#include "Practice_Lab02v4_header.h"

using namespace std;

int main(){
    // ***********************************
    // open file
    ifstream fr;
    fr.open("Players.txt");

    if (fr.is_open() == false){
        cout << "Can't open file (fr)";
        return 0;
    }

    // store the list of players
    PLAYER listPlayer[1000];
    // make a holder
    PLAYER playerTemp;
    int N = 0;
    char year[256];

    // read the information from the file to the holder and add it to the list
    while (fr.eof() == false){
        fr.getline(playerTemp.pos, 256,'/');
        fr.getline(playerTemp.name, 256,'/');
        fr.getline(year, 256,'/');
        playerTemp.year = stoi(year);
        fr.getline(playerTemp.nationTeam, 256,'/');
        fr.getline(playerTemp.club, 256,'\n');
        
        listPlayer[N++] = playerTemp;
    }

    for(int i = 0; i < N; i++){
        lastName(listPlayer[i]);
    }

    interchangeSortPlayer(listPlayer, N);

    fr.close();

    // ***********************************
    // make a file to store information
    ofstream fw;
    fw.open("PlayerResV4.txt");

    if (fw.is_open() == false){
        cout << "Can't open file (fw)";
        return 0;
    }

    // Find all players born in 1994.
    fw << "***Players who wer born in 1994***\n";
    for (int i = 0; i < N; i++){
        if (listPlayer[i].year == 1994)
            fw << listPlayer[i].name << "/" << listPlayer[i].club << "\n";
    }

    // Find all players who play for Manchester United club.
    fw << "\n***Players who play for MU***\n";
    for (int i = 0; i < N; i++){
        if (strcmp(listPlayer[i].club, "Manchester United") == 0)
            fw << listPlayer[i].name << "/" << listPlayer[i].year << "\n";
    }

    // Find all FW play for Manchester City.
    fw << "\n***FW Players who play for MC***\n";
    for (int i = 0; i < N; i++){
        if (strcmp (listPlayer[i].club, "Manchester City") == 0 && strcmp(listPlayer[i].pos, "FW") == 0) 
            fw << listPlayer[i].name << "/" << listPlayer[i].year << "\n";
    }

    // sorting from year of birth and name
    fw << "\n***Sorting from year of birth and name***\n";
    for(int i = 0; i < N; i++){
        fw << listPlayer[i].year << "/" << listPlayer[i].lastName << "\n";
    }
    
    fw.close();

    return 0;
}