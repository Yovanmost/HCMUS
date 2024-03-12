// class Node{
// private:
//     int n; // board n x n => number N tiles = n x n - 1
//     int i, j; // blank space location
//     int** state;
//     int costPath;
//     string goalPath;
//     // list of legal Neighbour
//     vector<Node> listNeighbour;
    
// public:
//     Node(){}
//     Node(int i, int j, int** state, int costPath, string goalPath);
//     ~Node(){
//         for (int i = 0; i < n; i++)
//             delete [n]state[i];
//     }
//     // void get
// };

// Node::Node(int i, int j, int** state, int costPath, string goalPath){
//     this->state = new int*[n];
//     for (int i = 0; i < n; i++)
//         this->state[i] = new int[n];
    
//     this->i = i;
//     this->j = j;    

