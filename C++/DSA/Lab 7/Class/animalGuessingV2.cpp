#include <iostream>
#include <string>
#include <fstream>
#include <vector>

using namespace std;

struct Node{
    string question;
    bool type; // 0 == #Q, 1 == #A
    Node* left = nullptr;
    Node* right = nullptr;
    Node(string n) : question(n) {}
};



Node* createNode(string q){
    Node* p = new Node(q);
    if (q[1] == 'Q')
        p->type = 0;
    else p->type = 1;
    return p;
}

void printTree(Node* root){
    if (root == nullptr)
        return;
    cout << root->question << '\n';
    printTree(root->left);
    printTree(root->right);
}

Node* buildTree(ifstream& fr) {
    string line;
    if (!getline(fr, line) || line.empty())
        return nullptr;

    Node* root = createNode(line);

    if (line[1] != 'A'){
        root->left = buildTree(fr);
        root->right = buildTree(fr);
    } 

    return root;
}

void saveFile(Node* root, ofstream& fw) {
    if (root == nullptr)
        return;
    fw << root->question << '\n';
    saveFile(root->left, fw);
    saveFile(root->right, fw);    
}

Node* play(Node* root){
    if (root->type)
        return root;
        
    cout << root->question << " (y/n) ";
    char k;
    cin >> k;
    cin.ignore();
    if (k == 'y')
        play(root->left);
    else if (k == 'n')
        play(root->right);

}

Node* play(Node* root, vector<char> &input){
    if (root->type)
        return root;
        
    for (int i = 0; i < input.size() - 1; i++){
        if (input[i] == 'y'){
            cout << root->question << " YES\n";
            root = root->left;
        }
        else {
            cout << root->question << " NO\n";
            root = root->right;
        }
    }
    if (input[input.size() - 1] == 'y')
        cout << root->question << " YES\n";
        
    else 
        cout << root->question << " NO\n";
    
    return root;
}

void addNewAnimal(Node* &root){
    cout << "Current question: "
        << root->question << '\n';
    string tmp1, tmp2;
    string a = "#A ";
    string b = "#Q ";
    cout << "What is the animal? e.g Is it a platypus?:\n";
    getline(cin, tmp1);
    cout << "What makes it different from the my answer? e.g Does it lay eggs?:\n";
    getline(cin, tmp2);
    a += tmp1;
    b += tmp2;
    string tmp = root->question;
    root->question = b;
    Node* pLeft = createNode(a);
    Node* pRight = createNode(tmp);
    root->left = pLeft;
    root->right = pRight;
}

bool playV2(Node* root, char &k){
    if (root == nullptr ){
        if (k == 'y'){
            cout << "Yay\n";
            return true;
        }
            
        else 
            cout << "Oh no, anyway\n";        
        return false;
    }
        
    cout << root->question << " (y/n) ";
    cin >> k;
    cin.ignore();
    if (k == 'y')
        playV2(root->left, k);
    else if (k == 'n')
        playV2(root->right, k);
}

bool playV3(Node* root, char &k, vector<char> &input){
    if (root == nullptr ){
        if (k == 'y'){
            cout << "Yay\n";
            return true;
        }
            
        else 
            cout << "Oh no, anyway\n";        
        return false;
    }
        
    cout << root->question << " (y/n) ";
    cin >> k;
    input.push_back(k);
    cin.ignore();
    if (k == 'y')
        playV3(root->left, k, input);
    else if (k == 'n')
        playV3(root->right, k, input);
}


int main(){
    string s = "input2.txt";
    ifstream fr;
    fr.open(s);
    Node* root = nullptr;
    root = buildTree(fr);
    printTree(root);

AGAIN:

    char k;
    cout << "Welcome to the animal guessing\n";
    cout << "1: to play\n"
        << "2: to save\n"
        << "3: to escape\n";
    cout << "Enter: ";
    cin >> k;
    switch (k){
        case '1':{
            // play(root);
            vector<char> savedInput;
            char c;
            if (!playV3(root, c, savedInput)){
                cout << "Would you like to expand the tree? (y/n) ";
                char t;
                cin >> t;
                if (t == 'y'){
                    cout << "I asked the following\n";
                    Node* newAnimal = play(root, savedInput);
                    cin.ignore();
                    addNewAnimal(newAnimal);
                    cout << "Added to the tree\n";
                }
            }
            break;
        }
            
        case '2':{
            cout << "Do you want to save file? (y/n) ";
            char t;
            cin >> t;
            if (t == 'y'){
                fr.close();
                ofstream fw;
                fw.open(s);
                saveFile(root, fw);
                fw.close();
                cout << "Tree saved\n";
            }
            printTree(root);
            break;
        }

        case '3':
            return 0;
        break;

        default:
        return 0;
        break;
    }

goto AGAIN;

    return 0;
}