#include <iostream>
#include <fstream>
#include <string>
#include <sstream>

using namespace std;

struct Node{
    int data;
    int height; 
    Node* left = nullptr;
    Node* right = nullptr;
    Node(int key) : data(key) {};
};

struct AVL{
    Node* root = nullptr;
};

struct BST{
    Node* root = nullptr;
};

Node* createNode(int data){
    Node* p = new Node(data);
    p->height = 1;
    return p;
}

int getHeight(Node* root){
    if (root == nullptr)
        return 0;
    return root->height;
}

void updateHeight(Node* root){
    root->height = 1 + max(getHeight(root->left), getHeight(root->right));
}

int getBalance(Node* root){
    if (root == nullptr)
        return 0;
    return getHeight(root->left) - getHeight(root->right);
}

Node* leftRightRotate(Node* root){
    Node* tmp = root->left;
    root->left = tmp->right;
    tmp->right = root;
    updateHeight(root);
    updateHeight(tmp);
    return tmp;
}

Node* rightLeftRotate(Node* root){
    Node* tmp = root->right;
    root->right = tmp->left;
    tmp->left = root;
    updateHeight(root);
    updateHeight(tmp);
    return tmp;
}

Node* doubleLeftRight(Node* root){
    root->left = rightLeftRotate(root->left);
    return leftRightRotate(root);
}

Node* doubleRightLeft(Node* root){
    root->right = leftRightRotate(root->right);
    return rightLeftRotate(root);
}

Node* addNode(Node* &root, int key){
    if (root == nullptr)
        return createNode(key);

    if (key < root->data)
        root->left = addNode(root->left, key);
    else if (key > root->data)
        root->right = addNode(root->right, key);
    else // duplicated value -> do nothing
        return root;

    updateHeight(root);

    int balanceFactor = getBalance(root);

    // LL
    if (balanceFactor > 1 && key < root->left->data)
        return leftRightRotate(root);

    // RR
    if (balanceFactor < - 1 && key > root->right->data)
        return rightLeftRotate(root);

    // LR
    if (balanceFactor > 1 && key > root->left->data)
        return doubleLeftRight(root);
    
    // RL 
    if (balanceFactor < - 1 && key < root->right->data)
        return doubleRightLeft(root);
    
    // unchanged
    return root;
}

// travel to the leftmost node (smallest)
Node* findMin(Node* root){
    Node* tmp = root;
    while (tmp->left != nullptr)
        tmp = tmp->left;
    return tmp;
}

Node* findMax(Node* root){
    Node* tmp = root;
    while (tmp->right != nullptr)
        tmp = tmp->right;
    return tmp;
}

Node* deleteNode(Node* root, int key){
    if (root == nullptr)
        return nullptr;
    
    // BST deletion
    if (key < root->data)
        root->left = deleteNode(root->left, key);
    else if (key > root->data)
        root->right = deleteNode(root->right, key);
    else {
        // 1 or 0 child
        if (root->left == nullptr || root->right == nullptr){
            Node* tmp = root->left ? root->left : root->right;

            // 0 child
            if (tmp == nullptr){
                tmp = root;
                root = nullptr;
            }
            // 1 child
            else 
                *root = *tmp;
            delete tmp;

        }
        // 2 children
        else {
            // find the smallest of the right side
            Node* substitute = findMin(root->right);

            // replace (the successor)
            root->data = substitute->data;

            // delete the successor
            root->right = deleteNode(root->right, substitute->data);
        }
    }

    // tree has 1 one only
    if (root == nullptr)
        return root;
    
    // update height
    updateHeight(root);

    // checking the tree balance
    int balanceFactor = getBalance(root);

    // LL
    if (balanceFactor > 1 && getBalance(root->left) >= 0)
        return leftRightRotate(root);

    // RR
    if (balanceFactor < - 1 && getBalance(root->right) <= 0)
        return rightLeftRotate(root);

    // LR
    if (balanceFactor > 1 && getBalance(root->left) < 0)
        return doubleLeftRight(root);
    
    // RL 
    if (balanceFactor < - 1 && getBalance(root->right) > 0)
        return doubleRightLeft(root);
    
    // unchanged
    return root;
}

Node* deleteNodeV2(Node* &root, int key){
    if (root == nullptr)
        return nullptr;
    
    // BST deletion
    if (key < root->data)
        root->left = deleteNodeV2(root->left, key);
    else if (key > root->data)
        root->right = deleteNodeV2(root->right, key);
    else {
        // 1 or 0 child
        if (root->left == nullptr || root->right == nullptr){
            Node* tmp = root->left ? root->left : root->right;

            // 0 child
            if (tmp == nullptr){
                tmp = root;
                root = nullptr;
            }
            // 1 child
            else 
                *root = *tmp;
            delete tmp;

        }
        // 2 children
        else {
            // find the largest of the left side
            Node* substitute = findMax(root->left);

            // replace (the successor)
            root->data = substitute->data;

            // delete the successor
            root->left = deleteNodeV2(root->left, substitute->data);
        }
    }

    // tree has 1 one only
    if (root == nullptr)
        return root;
    
    // update height
    updateHeight(root);

    // checking the tree balance
    int balanceFactor = getBalance(root);

    // LL
    if (balanceFactor > 1 && getBalance(root->left) >= 0)
        return leftRightRotate(root);

    // RR
    if (balanceFactor < - 1 && getBalance(root->right) <= 0)
        return rightLeftRotate(root);

    // LR
    if (balanceFactor > 1 && getBalance(root->left) < 0)
        return doubleLeftRight(root);
    
    // RL 
    if (balanceFactor < - 1 && getBalance(root->right) > 0)
        return doubleRightLeft(root);
    
    // unchanged
    return root;
}

void freeTree(Node* root){
    if (root == nullptr)
        return;
    freeTree(root->left);
    freeTree(root->right);
    delete root;
}

// pre order
void printNLR(Node* root){
    if (root == nullptr)
        return;
    cout << "Value: " << root->data << " Height: " << root->height << "\n";
    printNLR(root->left);
    printNLR(root->right);
}

// in order
void printLNR(Node* root){
    if (root == nullptr)
        return;
    printLNR(root->left);
    cout << "Value: " << root->data << " Height: " << root->height << "\n";
    printLNR(root->right);
}

// post order
void printLRN(Node* root){
    if (root == nullptr)
        return;
    printLRN(root->left);
    printLRN(root->right);
    cout << "Value: " << root->data << " Height: " << root->height << "\n";
}

bool isThere(Node* root, int key){
    if (root == nullptr)
        return false;
    if (root->data == key)
        return true;
    return root->data > key ? isThere(root->left, key) : isThere(root->right, key);
}

int CountOutRange(Node* p, int a, int b){
    if (p == nullptr)
        return 0;
    if (p->data < a || p->data > b)
        return 1 + CountOutRange(p->left, a, b) + CountOutRange(p->right, a, b);
    else return CountOutRange(p->left, a, b) + CountOutRange(p->right, a, b);
}

//----------------------------------------------------------------------------------------------------------------

// 7.2
Node* addNodeBST(Node* root, int key){
    if (root == nullptr)
        return createNode(key);

    if (key < root->data)
        root->left = addNodeBST(root->left, key);
    else if (key > root->data)
        root->right = addNodeBST(root->right, key);
    else // duplicated value -> do nothing
        return root;
    updateHeight(root);
}

bool isAVL(Node* root){
    // cout << getBalance(root) << '\n';
    if (getBalance(root) >  1 || getBalance(root) < - 1) 
        return false;
    return true;
}

void readFile(string s){
    ifstream fr;
    fr.open(s);
    string tmp;
    getline(fr, tmp);
    int amount = stoi(tmp);

    for (int i = 0; i < amount; i++){
        string line;
        Node* root = nullptr;
        getline(fr, line);
        istringstream iss(line);
        int k;

        while (iss >> k)
            root = addNodeBST(root, k);

        if (isAVL(root))
            cout << "Yes\n";
        else cout << "No\n";
        // printNLR(root);
        freeTree(root);
    }
    fr.close();
}

//----------------------------------------------------------------------------------------------------------------

// 7.3
// reference: https://www.geeksforgeeks.org/check-leaves-level/
bool checkUtil(Node *root, int level, int* leafLevel)
{
    // Base case
    if (root == NULL) return true;
 
    // If a leaf node is encountered
    if (root->left == NULL && root->right == NULL){
        // When a leaf node is found
        // first time
        if (*leafLevel == 0){
            *leafLevel = level; // Set first found leaf's level
            return true;
        }
 
        // If this is not first leaf node, compare
        // its level with first leaf's level
        return (level == *leafLevel);
    }
 
    // If this node is not leaf, recursively
    // check left and right subtrees
    return checkUtil(root->left, level + 1, leafLevel) &&
            checkUtil(root->right, level + 1, leafLevel);
}

bool isSameHeight(struct Node *root){
    int level = 0, leafLevel = 0;
    return checkUtil(root, level, &leafLevel);
}

//----------------------------------------------------------------------------------------------------------------

// 7.4
// n1 < n2
Node* findLCA(Node* root, int n1, int n2){
    if (root == nullptr)
        return nullptr;

    if (n1 > root->data && n2 > root->data)
        return findLCA(root->right, n1, n2);
    if (n1 < root->data && n2 < root->data)
        return findLCA(root->left, n1, n2);
    
    return root;
}

//----------------------------------------------------------------------------------------------------------------

int main(){
    // 7.1
    cout << "7.1\n";
    Node* root = nullptr;
    root = addNode(root, 10);
    root = addNode(root, 20);
    root = addNode(root, 30);
    root = addNode(root, 40);
    root = addNode(root, 50);
    root = addNode(root, 25);
    
    cout << "Before\n";
    printNLR(root);
    // printLNR(root)
    // printLRN(root);

    // change this will change the output of 7.3
    // root = deleteNode(root, 30);
    root = deleteNodeV2(root, 30);

    cout << "After deletion\n";
    printNLR(root);

    // 7.2 read file check if binary tree is an avl tree
    cout << "7.2\n";
    string fileName = "input.txt";
    readFile(fileName);

    // 7.3 leaves same height
    cout << "7.3\n";
    if (isSameHeight(root))
        cout << "All leaves have the same height\n";
    else cout << "Some leaves don't have the same height\n";

    // 7.4 least common ancestor
    cout << "7.4\n";
    Node* tmp = findLCA(root, 30, 50);
    cout << "LCA of 30 and 50: " << tmp->data;
    
    return 0;
}