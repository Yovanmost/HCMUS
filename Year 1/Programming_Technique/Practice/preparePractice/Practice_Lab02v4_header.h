#include <iostream>
#include <string.h>

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
void interchangeSortPlayer(PLAYER a[], int n){
    for (int i = 0; i < n - 1; i++)
        for (int j = i + 1; j < n; j++)
            if (compareYearName(a[i], a[j]) == true)
                swap(a[i], a[j]);
}