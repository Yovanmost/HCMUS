#include <iostream>
#include <fstream>
#include <string.h>
#include <cstring>
#define SIZE 256

using namespace std;

struct Node{
    char engWord[100];
    char vnMeaning[200];
    int height;
    Node* left = nullptr;
    Node* right = nullptr;
};

Node* createNode(char eng[], char vn[]){
    Node* p = new Node;
    p->height = 1;
    strcpy(p->engWord, eng);
    strcpy(p->vnMeaning, vn);
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

Node* rightRotate(Node* root){
    Node* tmp = root->left;
    root->left = tmp->right;
    tmp->right = root;
    updateHeight(root);
    updateHeight(tmp);
    return tmp;
}

Node* leftRotate(Node* root){
    Node* tmp = root->right;
    root->right = tmp->left;
    tmp->left = root;
    updateHeight(root);
    updateHeight(tmp);
    return tmp;
}

Node* doubleLeftRight(Node* root){
    root->left = leftRotate(root->left);
    return rightRotate(root);
}

Node* doubleRightLeft(Node* root){
    root->right = rightRotate(root->right);
    return leftRotate(root);
}

Node* addNode(Node* root, char eng[], char vn[]){
    if (root == nullptr)
        return createNode(eng, vn);
    if (strcmp(eng, root->engWord) < 0)
        root->left = addNode(root->left, eng, vn);
    if (strcmp(eng, root->engWord) > 0)
        root->right = addNode(root->right, eng, vn);
    else return root;

    updateHeight(root);

    int balanceFactor = getBalance(root);

    // LL 
    if (balanceFactor > 1 && strcmp(eng, root->left->engWord) < 0)
        return rightRotate(root);

    // LR
    if (balanceFactor > 1 && strcmp(eng, root->left->engWord) > 0)
        return doubleLeftRight(root);

    // RR
    if (balanceFactor < -1 && strcmp(eng, root->right->engWord) > 0)
        return leftRotate(root);
    
    // RL
    if (balanceFactor < -1 && strcmp(eng, root->right->engWord) < 0)
        return doubleRightLeft(root);

    return root;
}

Node* findNode(Node* root, char key[]){
    if (root == nullptr)
        return nullptr;

    if (strcmp(key, root->engWord) == 0)
        return root;

    strcmp(key, root->engWord) < 0 ? findNode(root->left, key) : findNode(root->right, key);
}

void printTree(Node* root){
    if (root == nullptr)
        return;
    printTree(root->left);
    cout << root->engWord << '\n';
    printTree(root->right);
}

void loadFile(Node* &root, char fileName[]){
    ifstream fr;
    fr.open(fileName);

    char tmpEng[SIZE];
    char tmpVN[SIZE];
    while (!fr.eof()){
        fr.getline(tmpEng, SIZE, ',');
        fr.getline(tmpVN, SIZE);
        root = addNode(root, tmpEng, tmpVN);
        // cout << tmpEng << " - " << tmpVN << '\n';
    }
    fr.close();

}

int countNode(Node* root){
    if (root == nullptr)
        return 0;
    return 1 + countNode(root->left) + countNode(root->right);
}

Node* findVN(Node* root, char vn[]){
}

int main(){
    Node* root = nullptr;
    char s[] = "word_bank_v3.txt";
    loadFile(root, s);
    cout << "Word list: \n";
    printTree(root);
    cout << "------------------------------------------------\n";

AGAIN:
    cout << '\n';
    cout << "Which word are you looking for? ";
    char in[SIZE];
    cin.getline(in, SIZE);
    Node* tmp = findNode(root, in);
    if (tmp)
        cout << "The vietnamese meaning: " << tmp->vnMeaning << '\n';
    else cout << "Can not find the word\n";
    cout << '\n';
    cout << "Continue? (y/n) ";
    char k;
    cin >> k;
    if (k != 'y')
        return 0;
    cin.ignore();
    
goto AGAIN;  

    return 0;
}