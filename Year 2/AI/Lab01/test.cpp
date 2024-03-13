#include <iostream>
#include <vector>
#include <queue>
#include <unordered_set>
#include <unordered_map>
#include <algorithm>
#include <numeric>
#include <string>

using namespace std;

struct Node {
    int n; // board n x n => number N tiles = n x n - 1
    int i, j; // blank space location
    vector<vector<int>> state;
    int costPath = 0;
    string goalPath;

    Node() {}
    Node(int n, int i, int j, vector<vector<int>> state, int costPath, string goalPath) {
        this->n = n;
        this->i = i;
        this->j = j;
        this->state = state;
        this->costPath = costPath;
        this->goalPath = goalPath;
    }

    void printState() {
        for (int i = 0; i < n * n; i++) {
            if (i % n == 0 && i != 0)
                cout << '\n';
            cout << state[i / n][i % n] << ' ';
        }
    }

    string getStateString() const {
        string stateStr;
        for (const auto& row : state) {
            for (int num : row) {
                stateStr += to_string(num) + " ";
            }
        }
        return stateStr;
    }
};

struct CompareCost {
    bool operator()(const Node& a, const Node& b) {
        return a.costPath > b.costPath;
    }
};

bool compareState(Node a, Node b){
    int n = a.n;
    for (int i = 0; i < n*n; i++)
        if (a.state[i/n][i%n] != b.state[i/n][i%n])
            return false;
    return true;
}

bool isGoalState(const Node& nodeA, vector<vector<int>> goal) {    
    return nodeA.state == goal;
}

vector<Node> getSuccessors(const Node& node) {
    vector<Node> successors;
    vector<pair<int, int>> directions = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
    for (const auto& dir : directions) {
        int new_i = node.i + dir.first;
        int new_j = node.j + dir.second;
        if (new_i >= 0 && new_i < node.n && new_j >= 0 && new_j < node.n) {
            vector<vector<int>> new_state = node.state;
            swap(new_state[node.i][node.j], new_state[new_i][new_j]);
            successors.push_back(Node(node.n, new_i, new_j, new_state, node.costPath + 1, node.goalPath + to_string(new_state[node.i][node.j]) + " "));
        }
    }
    return successors;
}

bool findInVector(Node f, vector<Node> vct){
    for (int i = 0; i < vct.size(); i++)
        if (compareState(vct[i], f))
            return true;
    return false;
}

string ucs(const Node& initialNode, vector<vector<int>> goalState) {
    priority_queue<Node, vector<Node>, CompareCost> frontier;
    unordered_map<string, Node> reached;


    frontier.push(initialNode);
    reached[initialNode.getStateString()] = initialNode;

    while (!frontier.empty()) {
        Node current = frontier.top();
        frontier.pop();

        if (isGoalState(current, goalState)) {
            cout << "Path cost: " << current.costPath << '\n';
            return current.goalPath;
        }
        // else{
        //     current.printState();
        //     cout << "\n\n";
        // } 

        vector<Node> successors = getSuccessors(current);
        for (Node& successor : successors) {
            if (reached.find(successor.getStateString()) == reached.end() || successor.costPath < reached[successor.getStateString()].costPath){
                reached[successor.getStateString()] = successor;
                frontier.push(successor);
            }
        }
    }

    return "No solution found";
}

int main() {
    // Define the initial state of the puzzle
    // vector<vector<int>> initial_state = {{1, 4, 2}, {3, 0, 5}, {6, 7, 8}};
    vector<vector<int>> initial_state = {{7, 2, 4}, {5, 0, 6}, {8, 3, 1}};
    int n = initial_state.size();

    // Define the goal state of the puzzle
    vector<vector<int>> goal_state = {{0, 1, 2}, {3, 4, 5}, {6, 7, 8}};

    // Create the initial node
    int blank_i = -1, blank_j = -1;
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            if (initial_state[i][j] == 0) {
                blank_i = i;
                blank_j = j;
                break;
            }
        }
        if (blank_i != -1 && blank_j != -1) {
            break;
        }
    }
    Node initial_node(n, blank_i, blank_j, initial_state, 0, "");

    // Perform UCS to find the solution
    string solution = ucs(initial_node, goal_state);

    // Output the solution
    if (solution != "No solution found") {
        cout << "Solution Path:\n";
        cout << solution << endl;
    } else {
        cout << "No solution found\n";
    }

    return 0;
}

// int main() {
//     // Create a priority queue of Node objects using the custom comparison function
//     priority_queue<Node, vector<Node>, CompareCost> pq;

//     // Create a lookup table for Node objects
//     unordered_map<string, Node> lookupTable;

//     // Example usage: Add some nodes to the priority queue and lookup table
//     Node node1(3, 0, 0, {{1, 2, 3}, {4, 5, 6}, {7, 8, 0}}, 10, "goal1");
//     pq.push(node1);
//     lookupTable[node1.getStateString()] = node1;

//     Node node2(3, 1, 1, {{1, 2, 3}, {4, 5, 6}, {7, 0, 8}}, 5, "goal2");
//     pq.push(node2);
//     lookupTable[node2.getStateString()] = node2;

//     Node node3(3, 1, 1, {{1, 2, 3}, {4, 5, 6}, {7, 0, 8}}, 3, "goal3");

//     if (node3.costPath < lookupTable[node3.getStateString()].costPath)
//         cout << "Y";
//     else cout << "N";

//     // Example usage: Look up a node in the lookup table
//     // string stateString = node1.getStateString();
//     // if (lookupTable.find(stateString) != lookupTable.end()) {
//     //     Node foundNode = lookupTable[stateString];
//     //     cout << "Found Node: Cost: " << foundNode.costPath << ", Goal Path: " << foundNode.goalPath << endl;
//     // }



//     return 0;
// }


// int main() {
//     // int n = 3; // Change this to the desired board size
//     // vector<vector<int>> initial_state = {{7, 2, 4}, {5, 0, 6}, {8, 3, 1}}; // Change this to the initial state
//     // vector<vector<int>> goal_state = {{0, 1, 2}, {3, 4, 5}, {6, 7, 8}};

//     // Node initial_node(n, 1, 1, initial_state, 0, to_string(initial_state[1][1]) + " ");

//     // cout << "Initial State:\n";
//     // initial_node.printState();
//     // cout << "\n\n";

//     // vector<Node> successors = getSuccessors(initial_node);
//     // for (Node& successor : successors) {
//     //     successor.printState();
//     //     cout << "\n\n";
//     // }


//     priority_queue<Node, vector<Node>, CompareCost> pq;

//     // Example usage: Add some nodes to the priority queue
//     pq.push(Node(3, 0, 0, {{1, 2, 3}, {4, 5, 6}, {7, 8, 0}}, 10, "goal"));
//     pq.push(Node(3, 1, 1, {{1, 2, 3}, {4, 5, 6}, {7, 0, 8}}, 5, "goal"));

//     // Example usage: Pop nodes from the priority queue
//     while (!pq.empty()) {
//         Node current = pq.top();
//         pq.pop();
//         cout << "Cost: " << current.costPath << ", Goal Path: " << current.goalPath << endl;
//     }


//     // // Find the position of the blank space (zero)
//     // int i, j;
//     // for (i = 0; i < n; i++) {
//     //     for (j = 0; j < n; j++) {
//     //         if (initial_state[i][j] == 0) {
//     //             break;
//     //         }
//     //     }
//     //     if (j < n) {
//     //         break;
//     //     }
//     // }

//     // Node initial_node(n, i, j, initial_state, 0, to_string(initial_state[i][j]) + " ");

//     // cout << "Initial State:\n";
//     // initial_node.printState();
//     // cout << "\n\n";

//     // string solution = ucs(initial_node);
//     // if (solution != "No solution found") {
//     //     cout << "Solution Path:\n";
//     //     cout << solution << endl;
//     // } else {
//     //     cout << "No solution found\n";
//     // }

//     return 0;
// }
