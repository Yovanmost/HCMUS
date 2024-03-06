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

void addNode(Node* root, string parent, vector<string> children){
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

void readFile(string s){
    ifstream fr;
    fr.open(s);
    int numRelations;
    fr >> numRelations;
    Node* root = nullptr;
    for (int i = 0; i < numRelations; ++i) {
        string parentName, childName;
        char delimiter;
        fr >> delimiter; // '('
        fr >> parentName;

        std::vector<std::string> childrenNames;
        while (fr.peek() != ')') {
            fr >> childName;
            childrenNames.push_back(childName);
        }
        
        addNode(root, parentName, childrenNames);
    }

    fr.close();
}

int main(){
    Node* root = createNode("Matilde");
    root->children.push_back(createNode("Sebastian"));
    root->children.push_back(createNode("Leonor"));
    root->children[0]->children.push_back(createNode("Philip"));
    root->children[0]->children.push_back(createNode("Mary"));
    root->children[1]->children.push_back(createNode("Raul"));
    root->children[1]->children.push_back(createNode("Amelia"));


    return 0;
}