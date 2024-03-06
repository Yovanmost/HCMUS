#include <iostream>
#include <string>
#include <fstream>

using namespace std;

struct Student{
    string code;
    string name;
    string birthday;
    bool status;
};

struct Node{
    Student student;
    Node* pLeft;
    Node* pRight;
};

void createNode(Student st){
    Node* p = new Node;
    p->student = st;
    p->pLeft = NULL;
    p->pRight = NULL;
}

int main(){

    return 0;
}