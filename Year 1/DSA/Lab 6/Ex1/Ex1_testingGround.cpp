#include <iostream>
#include <string>
#include <vector>
#include <fstream>

using namespace std;

struct Node{
    string name;
    vector<Node*> children;
    Node(std::string n) : name(n) {}
};

Node* createNode(string s){
    Node* p = new Node(s);
    return p;
}

void printTree(Node* root){
    cout << root->name << '\n';
    for (int i = 0; i < root->children.size(); i++)
        printTree(root->children[i]);
}

void printTreeV2(Node* root, string key){
    if (root->name == key)
        cout << root->name << '\n';
    for (int i = 0; i < root->children.size(); i++)
        printTreeV2(root->children[i], key);
}

// NLR == printTree
void printPreOrder(Node* root) {
    if (root == nullptr)
        return;
    
    cout << root->name << '\n';
    for (int i = 0; i < root->children.size(); i++)
        printPreOrder(root->children[i]);
}

// LNR
void printInOrder(Node* root) {
    if (root == nullptr)
        return;
    
    if (root->children.size() > 0)
        printInOrder(root->children[0]);

    cout << root->name << '\n';

    for (int i = 1; i < root->children.size(); i++)
        printInOrder(root->children[i]);
}

// LRN
void printPostOrder(Node* root) {
    if (root == nullptr)
        return;
    
    for (int i = 0; i < root->children.size(); i++)
        printPostOrder(root->children[i]);

    cout << root->name << '\n';
}

Node* findChild(Node* root, string key) {
    if (root->name == key)
        return root;
    
    for (int i = 0; i < root->children.size(); i++) {
        Node* result = findChild(root->children[i], key);
        if (result != nullptr) {
            return result; // If key is found in the child subtree, return the result.
        }
    }
    
    return nullptr; // If key is not found in the current subtree or any children, return nullptr.
}

void addNode(Node* &root, string parent, vector<string> children){
    // if root is empty then add the first group
    if (root == nullptr){
        root = createNode(parent);
        for (int i = 0; i < children.size(); i++)
            root->children.push_back(createNode(children[i]));
    }
    // find the parent node and add the children to it
    else {
        Node* head = findChild(root, parent);
        for (int i = 0; i < children.size(); i++)
            head->children.push_back(createNode(children[i]));
    }
}

void readFileV3(Node* &root, string fileName){
    ifstream fr;
    fr.open(fileName);
    int relations;
    fr >> relations;
    
    for (int i = 0; i < relations; i++){
        string parent;
        vector<string> children;
        string tmp, tmp2;
        char delimiter;
        fr >> delimiter;
        fr >> parent;
        fr >> delimiter;
        
        do {
            fr >> tmp;
            if (tmp.back() == ')'){
                tmp2 = tmp.substr(0, tmp.size() - 2);
                children.push_back(tmp2);
                continue;
            }else children.push_back(tmp);

        }while (tmp.back() != ')');
        addNode(root, parent, children);
    }

    fr.close();
}

int main(){
    Node* root = nullptr;
    string fileName = "input.txt";
    readFileV3(root, fileName);
    printTree(root);
    // printInOrder(root);
    // printPostOrder(root);



    return 0;
}