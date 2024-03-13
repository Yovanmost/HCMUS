#include <iostream>
#include <string>
#include <vector>
#include <stack>

using namespace std;

struct Node{
    int n; // board n x n => number N tiles = n x n - 1
    int i, j; // blank space location
    vector<vector<int>> state;
    int costPath = 0;
    string goalPath;

    Node(){}
    Node(int n, int i, int j, vector<vector<int>> state, int costPath, string goalPath){
        this->n = n;
        this->i = i;
        this->j = j;
        this->state = state;
        this->goalPath = goalPath;
    }

    void printState(){
        for (int i = 0; i < n*n; i++){
            if (i%n == 0 && i != 0)
                cout << '\n';
            cout << state[i/n][i%n] << ' ';
        }
    }
};

bool compare(Node a, Node b){
        if (a.state == b.state)
            return true;
        return false;
    }

Node goRight(Node cur){
    vector<vector<int>> newState = cur.state;
    int i = cur.i;
    int j = cur.j;
    int costPath = cur.costPath;

    if (j+1 < cur.n){
        int tmp = newState[i][j];
        newState[i][j] = newState[i][j+1];
        newState[i][j+1] = tmp;
    }
    else return cur;
    
    string move = to_string(newState[i][j]) + " left\n";
    return Node(cur.n, i, j+1, newState, costPath+1, move);
}

Node goLeft(Node cur){
    vector<vector<int>> newState = cur.state;
    int i = cur.i;
    int j = cur.j;
    int costPath = cur.costPath;

    if (j-1 >= 0){
        int tmp = newState[i][j];
        newState[i][j] = newState[i][j-1];
        newState[i][j-1] = tmp;
    }
    else return cur;
    
    string move = to_string(newState[i][j]) + " right\n";
    return Node(cur.n, i, j-1, newState, costPath+1, move);
}

Node goUp(Node cur){
    vector<vector<int>> newState = cur.state;
    int i = cur.i;
    int j = cur.j;
    int costPath = cur.costPath;

    if (i-1 >= 0){
        int tmp = newState[i][j];
        newState[i][j] = newState[i-1][j];
        newState[i-1][j] = tmp;
    }
    else return cur;
    
    string move = to_string(newState[i][j]) + " down\n";
    return Node(cur.n, i-1, j, newState, costPath+1, move);
}

Node goDown(Node cur){
    vector<vector<int>> newState = cur.state;
    int i = cur.i;
    int j = cur.j;
    int costPath = cur.costPath;

    if (i+ 1< cur.n){
        int tmp = newState[i][j];
        newState[i][j] = newState[i+1][j];
        newState[i+1][j] = tmp;
    }
    else return cur;
    
    string move = to_string(newState[i][j]) + " up\n";
    return Node(cur.n, i+1, j, newState, costPath+1, move);
}

vector<Node> expandNode(Node cur){
    vector<Node> neighbour;
    if (!compare(cur, goRight(cur)))
        neighbour.push_back(goRight(cur));

    if (!compare(cur, goLeft(cur)))
        neighbour.push_back(goLeft(cur));

    if (!compare(cur, goUp(cur)))
        neighbour.push_back(goUp(cur));

    if (!compare(cur, goDown(cur)))
        neighbour.push_back(goDown(cur));
    
    return neighbour;
}


// 0 1 2
// 3 4 5
// 6 7 8

// 1 4 2
// 3 0 5
// 6 7 8

int main(){
    vector<vector<int>> initState{{1, 4, 2}, {3, 0, 5}, {6, 7, 8}};
    // vector<vector<int>> initState2{{0, 1, 2}, {3, 4, 5}, {6, 7, 8}};
    Node a(3, 1, 1, initState, 0, "");
    for (Node i : expandNode(a)){
        i.printState();
        cout << "(" << i.i << ';' << i.j << ")\n\n";
    }
        
    // Node b(3, 0, 1, initState2, 0, "");
    // if (compare(a, b))
    //     cout << "Y";
    // else cout << "N";
    // a.printState();

    return 0;
}