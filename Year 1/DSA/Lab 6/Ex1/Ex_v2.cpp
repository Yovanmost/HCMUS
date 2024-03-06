#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#define SIZE 10

using namespace std;

struct Node{
    string name;
    Node* children[SIZE] = {0};
    Node(std::string n) : name(n) {}
};

Node* createNode(string s){
    Node* p = new Node(s);
    return p;
}

void printTree(Node* root){
    if (root == NULL)
        return;
    cout << root->name << '\n';
    for (int i = 0; i < SIZE; i++)
        printTree(root->children[i]);
}

void printTreeV2(Node* root, string key){
    if (root == NULL)
        return;
    if (root->name == key)
        cout << root->name << '\n';
    for (int i = 0; i < SIZE; i++)
        printTreeV2(root->children[i], key);
}

Node* findChild(Node* root, string key){
    Node* tmp = root;
    if (tmp->name == key)
        return root;
    for (int i = 0; i < SIZE; i++)
        findChild(tmp->children[i], key);
}

void readFile(string s){
    ifstream fr;
    fr.open(s);
    int relations;
    fr >> relations;
    string parent, children;
    getline(fr, parent, '(');
    getline(fr, children, ')');
    
}

int main(){
    Node* root = createNode("Matilde");
    root->children[0] = createNode("Sebastian");
    root->children[1] = createNode("Leonor");
    root->children[0]->children[0] = createNode("Philip");
    root->children[0]->children[1] = createNode("Mary");
    root->children[1]->children[0] = createNode("Raul");
    root->children[1]->children[1] = createNode("Amelia");
    // printTree(root);
    printTreeV2(root, "Marry");
    // // cout << root->name;
    // Node* tmp = findChild(root, "Mary");
    // cout << root->name;
    // cout << tmp->name;

    return 0;
}