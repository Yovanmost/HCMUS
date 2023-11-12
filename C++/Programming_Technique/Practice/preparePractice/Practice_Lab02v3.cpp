#include <iostream>
#include <string>
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
void lastName (PLAYER &a){
    int idex = -1;

    for (int i = 0; i < a.name.size(); i++)
        if (a.name[i] == ' ')
            idex = i;
    
    a.lastName = a.name.substr(idex+1, a.name.size());
}

// checking condition for sorting
bool compareYearName(PLAYER a, PLAYER b){
    return (a.year > b.year) || 
            ((a.year == b.year) && (a.lastName > b.lastName));
            // ((a.year == b.year) && (a.lastName[0] == b.lastName[0]) && (a.lastName > b.lastName))
}

// sorting the list from age and alphabet
void interchangeSortPlayer(PLAYER a[], int n){
    for (int i = 0; i < n - 1; i++)
        for (int j = i + 1; j < n; j++)
            if (compareYearName(a[i], a[j]) == true)
                swap(a[i], a[j]);
}

// read the information from the file to the holder and add it to the list
void readPlayers(ifstream &fr, PLAYER listPlayer[], int &n){
    PLAYER playerTemp;
    string tmpYear;
    string s;
    while (fr.eof() == false){        
        // make a bar for reading string
        getline(fr, s);
        // this is the bar
        stringstream ss(s);

        getline(ss, playerTemp.pos, '/');
        getline(ss, playerTemp.name, '/');
        lastName(playerTemp);
        getline(ss, tmpYear, '/');
        playerTemp.year = stoi(tmpYear);
        getline(ss, playerTemp.nationTeam, '/');
        getline(ss, playerTemp.club, '/');
        
        listPlayer[n++] = playerTemp; 
    }   
}

void findPlayers1994(ofstream &fw, PLAYER listPlayer[], int n){
    fw << "Players who were born in 1994\n";
    for (int i = 0; i < n; i++){
        if (listPlayer[i].year == 1994)
            fw << listPlayer[i].name << "/" << listPlayer[i].club << "\n";
    }
}

void findPlayersMU(ofstream &fw, PLAYER listPlayer[], int n){
    fw << "\nPlayers who play for MU\n";
    for (int i = 0; i < n; i++){
        if (listPlayer[i].club == "Manchester United")
            fw << listPlayer[i].name << "/" << listPlayer[i].year << "\n";
    }
}

void find_MC_FW_Player(ofstream &fw, PLAYER listPlayer[], int n){
    fw << "\nFW Players who play for MC\n";
    for (int i = 0; i < n; i++){
        if (listPlayer[i].club == "Manchester City" && listPlayer[i].pos == "FW")
            fw << listPlayer[i].name << "/" << listPlayer[i].year << "\n";
    }
}

void sortingPlayerYearLastName(ofstream &fw, PLAYER listPlayer[], int n){
    interchangeSortPlayer(listPlayer, n);

    fw << "\nSorting from year of birth and name\n";
    for (int i = 0; i < n; i++)
        fw << listPlayer[i].year << "/" << listPlayer[i].lastName << "\n";    

}

// ++++++++++ MAIN ++++++++++
int main(){
    // ++++++++++ READ FILE ++++++++++

    // open file
    ifstream fr;
    fr.open("Players.txt");

    if (fr.is_open() == false){
        cout << "Can't open file (fr)";
        return 0;
    }else cout << "START READING\n";

    // store the list of players
    PLAYER listPlayer[1000];
    int n;

    readPlayers(fr, listPlayer, n);

    fr.close();
    cout << "CLOSE READING\nSTART WRITING\n";
    
    // ++++++++++ WRITE FILE ++++++++++

    // make a file to store information
    ofstream fw;
    fw.open("PlayerResV3.txt");

    if (fw.is_open() == false){
        cout << "Can't open file (fw)";
        return 0;
    }

    findPlayers1994(fw, listPlayer, n);
    findPlayersMU(fw, listPlayer, n);
    find_MC_FW_Player(fw, listPlayer, n);
    sortingPlayerYearLastName(fw, listPlayer, n);

    fw.close();
    cout << "FINISHED WRITING";

    return 0;
}