#include <iostream>
#include <string>
#include <vector>

using namespace std;

struct Node{
    int data;
    Node* left = nullptr;
    Node* right = nullptr;
    Node(int key) : data(key) {};
};

Node* createNode(int value){
    Node* p = new Node(value);
    return p;
}

Node* addNode(Node* root, int value){
    if (root == nullptr)
        return createNode(value);

    if (value < root->data)
        root->left = addNode(root->left, value);
    
    if (value > root->data)
        root->right = addNode(root->right, value);

    return root;
}

void printLNR(Node* root){
    if (root == nullptr)
        return;
    printLNR(root->left);
    cout << root->data << ' ';
    printLNR(root->right);
}

void printLRN(Node* root){
    if (root == nullptr)
        return;
    printLRN(root->left);
    printLRN(root->right);
    cout << root->data << ' ';
}

void printNLR(Node* root){
    if (root == nullptr)
        return;
    cout << root->data << ' ';
    printNLR(root->left);
    printNLR(root->right);
}

void printNRL(Node* root){
    if (root == nullptr)
        return;
    cout << root->data << ' ';
    printNRL(root->right);
    printNRL(root->left);
}

void printRNL(Node* root){
    if (root == nullptr)
        return;
    printRNL(root->right);
    cout << root->data << ' ';
    printRNL(root->left);
}

void printRLN(Node* root){
    if (root == nullptr)
        return;
    printRLN(root->right);
    printRLN(root->left);
    cout << root->data << ' ';
}

Node* findNode(Node* root, int key){
    if (root == nullptr)
        return nullptr;

    if (root->data == key)
        return root;

    key < root->data ? findNode(root->left, key) : findNode(root->right, key);
}

Node* findMax(Node* root){
    Node* tmp = root;
    while (tmp->right != nullptr)
        tmp = tmp->right;
    return tmp;
}

Node* deleteNodeV2(Node* root, int key){
    if (root == nullptr){
        cout << "Not in here\n";
        return nullptr;
    }   
    
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

    return root;
}

void freeTree(Node* root){
    if (root == nullptr)
        return;
    freeTree(root->left);
    freeTree(root->right);
    delete root;
}

int countNode(Node* root){
    if (root == nullptr)
        return 0;
    return 1 + countNode(root->left) + countNode(root->right);
}

int countNoneLeaf(Node* root){
    if (root == nullptr)
        return 0;
    if (root->left || root->right)
        return 1 + countNoneLeaf(root->left) + countNoneLeaf(root->right);
    else return countNoneLeaf(root->left) + countNoneLeaf(root->right);
}

int countNodeWithBothLeavesV2(Node* root){
    if (root == nullptr)
        return 0;
    if (root->left && root->right)
        return 1 + countNodeWithBothLeavesV2(root->left) + countNodeWithBothLeavesV2(root->right);
    else return countNodeWithBothLeavesV2(root->left) + countNodeWithBothLeavesV2(root->right);
}

int countLeafV2(Node* root){
    if (root == nullptr)
        return 0;
    if (!root->left && !root->right)
        return 1 + countLeafV2(root->left) + countLeafV2(root->right);
    else return countLeafV2(root->left) + countLeafV2(root->right);
}

int countNodeWithBothLeaves(Node* root) {
    if (root == nullptr)
        return 0;
    
    int count = 0;
    
    if (root->left != nullptr && root->right != nullptr)
        count++;
    
    count += countNodeWithBothLeaves(root->left) + countNodeWithBothLeaves(root->right);
    
    return count;
}

unsigned int countLeaf(Node* node){
    if(node == NULL)    
        return 0;
        
    if(node->left == nullptr && node->right == nullptr){
        // cout << node->data << '\n';
        return 1;
    }
        
    else
        return countLeaf(node->left) + countLeaf(node->right);
}

int main(){
    Node* root = nullptr;
    root = addNode(root, 30);
    root = addNode(root, 20);
    root = addNode(root, 10);
    root = addNode(root, 25);
    root = addNode(root, 40);
    root = addNode(root, 35);
    root = addNode(root, 50);

    cout << "Before\n";
    printNLR(root);
    
    cout << '\n';
    cout << "Number of nodes: " << countNode(root) << '\n';
    cout << "Number of nodes with both leaves: " << countNodeWithBothLeaves(root) << "|"
        << countNoneLeaf(root) <<'\n';
    cout << "Number of leaves: " << countLeaf(root) << '\n';
    cout << "Number of leaves: " << countLeafV2(root) << '\n';

    root = deleteNodeV2(root, 40);
    cout << "After\n";
    printNLR(root);

    cout << '\n';
    cout << "Number of nodes: " << countNode(root) << '\n';
    cout << "Number of nodes with both leaves: " << countNodeWithBothLeaves(root) << "|"
        << countNoneLeaf(root) <<'\n';
    cout << "Number of leaves: " << countLeaf(root) << '\n';
    cout << "Number of leaves: " << countLeafV2(root) << '\n';




    return 0;
}