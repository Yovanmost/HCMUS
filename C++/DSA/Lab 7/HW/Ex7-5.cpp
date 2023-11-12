#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <vector>
#include <chrono>
#include <time.h>

using namespace std;

vector<string> nameList;

void loadName(string fileName, vector<string> &listOfNames){
    ifstream fr;
    fr.open(fileName);
    string tmp;
    while (!fr.eof()){
        fr >> tmp;
        listOfNames.push_back(tmp);
    }
    fr.close();
}

struct Node{
    string data;
    int height; 
    Node* left = nullptr;
    Node* right = nullptr;
    Node(string key) : data(key) {};
};


Node* createNode(string data){
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

Node* addNode(Node* root, string key){
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

Node* deleteNode(Node* root, string key){
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

Node* deleteNodeV2(Node* root, string key){
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

Node* addNodeBST(Node* root, string key){
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

void loadFileAVL(Node* &root, string fileName){
    ifstream fr;
    fr.open(fileName);
    string tmp;
    while (!fr.eof()){
        fr >> tmp; 
        root = addNode(root, tmp);
    }
    fr.close();
}

void loadFileBST(Node* &root, string fileName){
    ifstream fr;
    fr.open(fileName);
    string tmp;
    while (!fr.eof()){
        fr >> tmp; 
        root = addNodeBST(root, tmp);
    }
    fr.close();
}

bool findName(Node* root, string k){
    if (root == nullptr)
        return false;
    if (k > root->data)
        return findName(root->right, k);
    if (k  < root->data)
        return findName(root->left, k);
    return true;
}

int getTreeSize(Node* root) {
    if (root == nullptr)
        return 0;
    return 1 + getTreeSize(root->left) + getTreeSize(root->right);
}

// reference: https://www.geeksforgeeks.org/height-and-depth-of-a-node-in-a-binary-tree/
int findDepth(Node* root, string x)
{
    // Base case
    if (root == NULL)
        return -1;
 
    // Initialize distance as -1
    int dist = -1;
 
    // Check if x is current node=
    if ((root->data == x)
 
        // Otherwise, check if x is
        // present in the left subtree
        || (dist = findDepth(root->left, x)) >= 0
 
        // Otherwise, check if x is
        // present in the right subtree
        || (dist = findDepth(root->right, x)) >= 0)
 
        // Return depth of the node
        return dist + 1;
 
    return dist;
}

void runnningTimeAVL(Node* &root, string s){
    loadFileAVL(root, s);
    long long sum = 0;
    auto start = chrono::high_resolution_clock::now();
    for (int i = 0; i < nameList.size(); i++)
        findName(root, nameList[i]);
    auto finish = chrono::high_resolution_clock::now();

    auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);

    for (int i = 0; i < nameList.size(); i++)
        sum += findDepth(root, nameList[i]);

    cout << "AVL searching time: " << duration.count() << " ms \n";
    cout << "Tree size: " << getTreeSize(root) << '\n';
    cout << "Tree height: " << getHeight(root) << '\n';
    cout << "Average depth: " << (float)sum / getTreeSize(root) << '\n';

    freeTree(root);
}

void runnningTimeBST(Node* &root, string s){
    loadFileBST(root, s);
    long long sum = 0;

    auto start = chrono::high_resolution_clock::now();
    for (int i = 0; i < nameList.size(); i++)
        findName(root, nameList[i]);
    auto finish = chrono::high_resolution_clock::now();

    for (int i = 0; i < nameList.size(); i++)
        sum += findDepth(root, nameList[i]);

    auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
    cout << "BST searching time: " << duration.count() << " ms\n";
    cout << "Tree size: " << getTreeSize(root) << '\n';
    cout << "Tree height: " << getHeight(root) << '\n';
    cout << "Average depth: " << (float)sum / getTreeSize(root) << '\n';
    freeTree(root);
}


int main(){
    Node* avlTree = nullptr;
    Node* bsTree = nullptr;
    string s = "names.txt";
    loadName(s, nameList);
    cout << "LOADING...\n";
    runnningTimeAVL(avlTree, s);
    cout << "LOADING...\n";
    runnningTimeBST(bsTree, s);

    return 0;
}