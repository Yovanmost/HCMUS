#include <iostream>
#include <Windows.h> 
#include "fileReader.h"
#define GRID_SIZE 10

using namespace std;

int neighborsGrid[GRID_SIZE][GRID_SIZE];
bool stateGrid[GRID_SIZE][GRID_SIZE];

void setupGrid(){
    for (int i = 0; i < GRID_SIZE; i++)
        for (int j = 0; j < GRID_SIZE; j++){
            neighborsGrid[i][j] = 0;
            stateGrid[i][j] = false;
        }
}

void setupStateGrid(bool a[][GRID_SIZE]){
    for (int k = 0; k < GRID_SIZE*GRID_SIZE; k++){
        int i = k/GRID_SIZE, j = k%GRID_SIZE;
        a[i][j] = false;
    }
}

void printStateGrid(){
    cout << "State Grid\n";
    for (int i = 0; i < GRID_SIZE*GRID_SIZE; i++){
        if (i % GRID_SIZE == 0 && i != 0)
            cout << '\n';
        cout << stateGrid[i/10][i%10] << " ";
    }
    cout << "\n\n";
}

void printStateGridV2(bool sg[][GRID_SIZE]){
    cout << "SG\n";
    for (int i = 0; i < GRID_SIZE*GRID_SIZE; i++){
        if (i % GRID_SIZE == 0 && i != 0)
            cout << '\n';
        if (sg[i/10][i%10] == true)
            cout << "1 ";
        else cout << "0 ";
        // cout << sg[i/10][i%10] << " ";
    }
    cout << "\n\n";
}

void printNeighborGrid(){
    cout << "Neighbor Grid\n";
    for (int i = 0; i < GRID_SIZE*GRID_SIZE; i++){
        if (i % GRID_SIZE == 0 && i != 0)
            cout << '\n';
        cout << neighborsGrid[i/GRID_SIZE][i%GRID_SIZE] << ' ';
    }            
    cout << "\n\n";
}

// the number of living cells around a cell
int countAliveNeighbor(bool currentStateGrid[][GRID_SIZE], int row, int col){
    int count = 0;
    for (int i = -1; i <= 1; i++)
        for (int j = - 1; j <= 1; j++){
            // avoid the middle (the cell being surrounded)
            if (i == 0 && j == 0)
                continue;

            int currentRow = row + i;
            int currentCol = col + j;
            if (i == 0 && j == 0)
                continue;
            if (currentRow >= 0 && currentRow < GRID_SIZE && currentCol >= 0 && currentCol < GRID_SIZE)
                if (currentStateGrid[currentRow][currentCol])
                    count++;
        }
    return count;
}


// update the neighbor grid corresponding to the (new) state grid
void updateAliveNeighborCells(bool currentStateGrid[][GRID_SIZE]){
    for (int i = 0; i < GRID_SIZE*GRID_SIZE; i++)
        neighborsGrid[i/GRID_SIZE][i%GRID_SIZE] = countAliveNeighbor(currentStateGrid, i/GRID_SIZE, i%GRID_SIZE);      
}

void copyState(bool base[][GRID_SIZE], bool copied[][GRID_SIZE]){
    for (int k = 0; k < GRID_SIZE*GRID_SIZE; k++){
        int i = k/GRID_SIZE, j = k%GRID_SIZE;
        base[i][j] = copied[i][j];
    }
}

// what will happen after 1 generation
void updateStateGrid(){
    // tmp grid
    bool newStateGrid[GRID_SIZE][GRID_SIZE];
    setupStateGrid(newStateGrid);


    for (int k = 0; k < GRID_SIZE*GRID_SIZE; k++){
        int i = k/GRID_SIZE, j = k%GRID_SIZE;
        // current cell is alive
        if (stateGrid[i][j] == true){
            // 2: stay the same; 3: birth
            if (neighborsGrid[i][j] == 2 || neighborsGrid[i][j] == 3)
                newStateGrid[i][j] = true;
            // 1: isolation = dead; >=4: overcrowded = dead
            else 
                newStateGrid[i][j] = false;
        }
        // current cell is dead
        else{
            if (neighborsGrid[i][j] == 3)
                newStateGrid[i][j] = true; // new one is born
        }
    }

    // update/overwrite the old grid
    copyState(stateGrid, newStateGrid);
    // printStateGrid();
}

void updateAll(){
    updateStateGrid();
    updateAliveNeighborCells(stateGrid);
}

bool isSame(bool a[][GRID_SIZE], bool b[][GRID_SIZE]){
    for (int k = 0; k < GRID_SIZE*GRID_SIZE; k++){
        int i = k/GRID_SIZE, j = k%GRID_SIZE;
        if (a[i][j] != b[i][j])
            return false;
    }
    return true;
}

// if all the cells are dead
bool endToAll(bool a[][GRID_SIZE]){
    for (int i = 0; i < GRID_SIZE*GRID_SIZE; i++)
        if (a[i/GRID_SIZE][i%GRID_SIZE])
            return false;
    return true;
}

// run the simulation 
void toFinal(){
    int i = 0;
    bool tmp1[GRID_SIZE][GRID_SIZE];
    bool tmp2[GRID_SIZE][GRID_SIZE];
    setupStateGrid(tmp1);
    setupStateGrid(tmp2);

REPEAT:
    // first generation
    copyState(tmp1, stateGrid);
    updateAll();
    // printStateGrid();
    // printNeighborGrid();
    if (endToAll(stateGrid) || isSame(tmp1, stateGrid)){
        printStateGrid();
        return;
    }
        

    // second generation
    copyState(tmp2, stateGrid);
    updateAll();
    // printStateGrid();
    // printNeighborGrid();
    if (endToAll(stateGrid) || isSame(tmp2, stateGrid)){
        printStateGrid();
        return;
    }
        
    // printStateGrid();
    // printNeighborGrid();
    
    // duplicated case 3 in ex or one generation only
    if (isSame(stateGrid, tmp1) || isSame(stateGrid, tmp2) || isSame(tmp1, tmp2)){
        printStateGridV2(tmp1);
        printStateGridV2(tmp2);
        return;
    }
        
    else goto REPEAT;
}

// run the simulation 
void toFinalWithAnimation(){
    int i = 0;
    bool tmp1[GRID_SIZE][GRID_SIZE];
    bool tmp2[GRID_SIZE][GRID_SIZE];
    setupStateGrid(tmp1);
    setupStateGrid(tmp2);

REPEAT:
    // first generation
    copyState(tmp1, stateGrid);
    updateAll();
    system("cls");
    printStateGrid();
    Sleep(500);
    if (endToAll(stateGrid) || isSame(tmp1, stateGrid))
        return;

    // second generation
    copyState(tmp2, stateGrid);
    updateAll();
    system("cls");
    printStateGrid();
    Sleep(500);
    if (endToAll(stateGrid) || isSame(tmp2, stateGrid))
        return;
    // printStateGrid();
    // printNeighborGrid();
    
    // duplicated case 3 in ex or one generation only
    if (isSame(stateGrid, tmp1) || isSame(stateGrid, tmp2) || isSame(tmp1, tmp2))
        return;
    else goto REPEAT;
}


int main(){
    // initialization 
    setupGrid();
    string fileName = "InitialState.txt";
    readFile(fileName, stateGrid);
    updateAliveNeighborCells(stateGrid);
    // printNeighborGrid();
    // printStateGrid();
    // toFinal();
    int k;
    cout << "Press 1 to start\n";
    cin >> k; 
    if (k == 1){
        // toFinalWithAnimation();
        toFinal();
    }
        

    return 0;
}