#include <iostream>
#include <string>
#include <vector>
#include <stack>

using namespace std;



struct Node{
    int n; // board n x n => number N tiles = n x n - 1
    int i, j; // blank space location
    int** state;
    int costPath = 0;
    string goalPath;

    Node(){}
    Node(int n, int i, int j, int** state, int costPath, string goalPath){
        this->n = n;
        this->i = i;
        this->j = j;
        this->state = new int*[n];
        for (int i = 0; i < n; i++)
            this->state[i] = new int[n];
        copyState(state, n);
        this->goalPath = goalPath;
    }
    ~Node(){
        for (int i = 0; i < n; i++)
            delete []this->state[i];
        delete []state;
    }

    void printState(){
        for (int i = 0; i < n*n; i++){
            if (i%n == 0 && i != 0)
                cout << '\n';
            cout << state[i/n][i%n] << ' ';
        }
    }

    void copyState(int** input, int n){
        for (int i = 0; i < n*n; i++)
            this->state[i/n][i%n] = input[i/n][i%n];
    }
};

bool compareSate(Node a, Node b){
    int n = a.n;
    for (int i = 0; i < n*n; i++)
        if (a.state[i/n][i%n] != b.state[i/n][i%n])
            return false;
    return true;
}



vector<Node> expandNode(const Node& node) {
    vector<Node> successors;
    vector<pair<int, int>> directions = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
    for (const pair<int, int>& dir : directions) {
        int new_i = node.i + dir.first;
        int new_j = node.j + dir.second;
        if (new_i >= 0 && new_i < node.n && new_j >= 0 && new_j < node.n) {
            string goalP = "";
            Node newNode(node.n, new_i, new_j, node.state, node.costPath + 1, node.goalPath);
            swap(newNode.state[node.i][node.j], newNode.state[new_i][new_j]);
            newNode.goalPath += to_string(newNode.state[new_i][new_j]) + " ";
            successors.push_back(newNode);
            newNode.printState();
        }
    }
    return successors;
}

vector<Node> getSuccessors(const Node& node) {
    vector<Node> successors;
    vector<pair<int, int>> directions = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
    for (const auto& dir : directions) {
        int new_i = node.i + dir.first;
        int new_j = node.j + dir.second;
        if (new_i >= 0 && new_i < node.n && new_j >= 0 && new_j < node.n) {
            // Create a new state by swapping the blank space with the adjacent tile
            int** new_state = new int*[node.n];
            for (int row = 0; row < node.n; ++row) {
                new_state[row] = new int[node.n];
                for (int col = 0; col < node.n; ++col) {
                    new_state[row][col] = node.state[row][col];
                }
            }
            swap(new_state[node.i][node.j], new_state[new_i][new_j]);
            successors.push_back(Node(node.n, new_i, new_j, new_state, node.costPath + 1, node.goalPath + to_string(new_state[new_i][new_j]) + " "));
        }
    }
    return successors;
}


// 0 1 2
// 3 4 5
// 6 7 8

// 1 4 2
// 3 0 5
// 6 7 8

int main(){
    int n = 3; // Change this to the desired board size
    int initial_state_arr[] = {7, 2, 4, 5, 0, 6, 8, 3, 1}; // Change this to the initial state

    // Create initial state 2D array from the single-dimensional array
    int** initial_state = new int*[n];
    for (int i = 0; i < n; ++i) {
        initial_state[i] = new int[n];
        for (int j = 0; j < n; ++j) {
            initial_state[i][j] = initial_state_arr[i * n + j];
        }
    }


    Node a(3, 1, 1, initial_state, 0, "");
    a.printState();
    cout << "\n\n";

    for (Node i : getSuccessors(a)){
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