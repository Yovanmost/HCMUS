#include "PointsStruct.h"

bool checkValue(Points** matrix, Points p1, Points p2){
    if (p1.value != p2.value)
        return false;
    if (p1.value == '.' || p2.value == '.' || p1.value == '0' || p2.value == '0')
        return false;
    return true;
}

// check with line x, from column y1 to y2
bool checkLineX(Points** matrix, int y1, int y2, int x) {
    // find point have column max and min
    int minP = min(y1, y2);
    int maxP = max(y1, y2);
    
    // run column
    for (int y = minP; y <= maxP; y++) {
        if (matrix[x][y].state == NOR) { // if see obstacle -> stop
            // cout << "dieLX: " << x << " " << y;
            return false;
        }
        // cout << "ok: " << x << " " << y;
    }
    
    return true;
}
 
bool checkLineY(Points** matrix , int x1, int x2, int y) {
    int minP = min(x1, x2);
    int maxP = max(x1, x2);
    for (int x = minP; x <= maxP; x++) {
        if (matrix[x][y].state == NOR) {
            // cout << "dieLY: " <<  x << " " << y;
            return false;
        }
        // cout << "ok: " << x << " " << y;
    }
    return true;
}

// check in rectangle
int checkRectX(Points** matrix, Points p1, Points p2) {
    // find point have y min and max
    Points pMinY = p1, pMaxY = p2;
    if (p1.y > p2.y) {
        pMinY = p2;
        pMaxY = p1;
    }
    for (int y = pMinY.y + 1; y < pMaxY.y; y++) {
        // check three line
        if (checkLineX(matrix, pMinY.y, y, pMinY.x)
                && checkLineY(matrix, pMinY.x, pMaxY.x, y)
                && checkLineX(matrix, y, pMaxY.y, pMaxY.x)) {
 
            // cout << "Rect x";
            // cout << "(" << pMinY.x << "," << pMinY.y << ") -> ("
            //         << pMinY.x << "," << y << ") -> (" << pMaxY.x << "," << y
            //         << ") -> (" << pMaxY.x << "," << pMaxY.y << ")";
            // if three line is true return column y
            return y;
        }
    }
    // have a line in three line not true then return -1
    return -1;
}

 
int checkRectY(Points** matrix, Points p1, Points p2) {
    // find point have y min
    Points pMinX = p1, pMaxX = p2;
    if (p1.x > p2.x) {
        pMinX = p2;
        pMaxX = p1;
    }
    // find line and y begin
    for (int x = pMinX.x + 1; x < pMaxX.x; x++) {
        if (checkLineY(matrix, pMinX.x, x, pMinX.y)
                && checkLineX(matrix, pMinX.y, pMaxX.y, x)
                && checkLineY(matrix, x, pMaxX.x, pMaxX.y)) {
             
            // cout << "Rect y";
            // cout << "(" << pMinX.x << "," << pMinX.y << ") -> (" << x
            //         << "," << pMinX.y << ") -> (" << x << "," << pMaxX.y
            //         << ") -> (" << pMaxX.x << "," << pMaxX.y << ")";
            return x;
        }
    }
    return -1;
}

// check along the columns
int checkMoreLineX(Points** matrix, Points p1, Points p2, int type) {
    // find point have y min
    Points pMinY = p1, pMaxY = p2;
    if (p1.y > p2.y) {
        pMinY = p2;
        pMaxY = p1;
    }
    // find line and y begin
    int y = pMaxY.y;
    int row = pMinY.x;
    if (type == -1) {
        y = pMinY.y;
        row = pMaxY.x;
    }
    // check more
    if (checkLineX(matrix, pMinY.y, pMaxY.y, row)) {
        while (matrix[pMinY.x][y].state != NOR
                && matrix[pMaxY.x][y].state != NOR) {
            if (checkLineY(matrix, pMinY.x, pMaxY.x, y)) {
                 
                // cout << "TH X " << type;
                // cout << "(" << pMinY.x << "," << pMinY.y << ") -> ("
                //         << pMinY.x << "," << y << ") -> (" << pMaxY.x << "," << y
                //         << ") -> (" << pMaxY.x << "," << pMaxY.y << ")";
                return y;
            }
            y += type;
        }
    }
    return -1;
}


// check along the rows
int checkMoreLineY(Points** matrix, Points p1, Points p2, int type) {
    Points pMinX = p1, pMaxX = p2;
    if (p1.x > p2.x) {
        pMinX = p2;
        pMaxX = p1;
    }
    int x = pMaxX.x;
    int col = pMinX.y;
    if (type == -1) {
        x = pMinX.x;
        col = pMaxX.y;
    }
    if (checkLineY(matrix, pMinX.x, pMaxX.x, col)) {
        while (matrix[x][pMinX.y].state != NOR
                && matrix[x][pMaxX.x].state != NOR) {
            if (checkLineX(matrix, pMinX.y, pMaxX.y, x)) {
                // cout << "TH Y " << type;
                // cout << "(" << pMinX.x << "," << pMinX.y << ") -> ("
                //         << x << "," << pMinX.y << ") -> (" << x << "," << pMaxX.y
                //         << ") -> (" << pMaxX.x << "," << pMaxX.y << ")";
                return x;
            }
            x += type;
        }
    }
    return -1;
}

/*
    MAKE A MYLINE FUNCTION TO CHECK FROM START TO FINISH
    */
int pathFinding(Points** matrix, Points p1, Points p2){
    // checking 2 values and positions
    if (!checkValue(matrix, p1, p2))
        return -1;
    
    // check straight line (I line)
    if (p1.x == p2.x)
        if (checkLineX(matrix, p1.y, p2.y, p1.x))
            return 1;// return some kind of signal to change the state of 2 selected points
    if (p1.y = p2.y)
        if (checkLineY(matrix, p1.x, p2.x, p1.y))
            return 2;

    // pointCheck is the return column/row of checkRect function
    int pointCheck = -1;
    // check within the rectangle zone (Z line)

    if (checkRectX(matrix, p1, p2) != -1)
        return 3;
    if (checkRectY(matrix, p1, p2) != -1)
        return 4;
    
    
    // check the tricker way (L and U line)
    // check if the left side is available
    if (checkMoreLineX(matrix, p1, p2, RIGHT) != -1)
        return 5;
    if (checkMoreLineX(matrix, p1, p2, LEFT) != -1)
        return 6;
    if (checkMoreLineY(matrix, p1, p2, DOWN) != -1) 
        return 7;
    if (checkMoreLineY(matrix, p1, p2, UP) != -1)
        return 8;
    
    
    // if every case fails => no possible connection can be made
    return -1;
}
