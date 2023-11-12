#include <iostream>
#include <fstream>
#include <string>
#include <cstring>

using namespace std;

char* replace(char* src, char* sub, char* rep){
    if (src == NULL)
        return NULL;
    string tmp = src;
    string subString = sub;
    string repString = rep;
    while (tmp.find(subString) != string::npos){
        tmp.replace(tmp.find(subString), subString.length(), repString);
    }
    
    int n = tmp.length();
    char* newString = new char [n];
    for (int i = 0; i < n; i++)
        newString[i] = tmp[i];
    cout << newString;
    return newString;    
}

struct Node{
    int stuID;
    // double average;
    Node* next;
};

struct List{
    Node* head;
};

int main(){
    // Node* tmp = new Node;
    // // tmp->average = 10;
    // tmp->next = NULL;
    // tmp->stuID = 10;
    // cout << sizeof(tmp);
      char* a = "Hello world hello friend hello yasuo hello rain";
    char* sub = "hello";
    char* rep = "hi";
    replace(a, sub, rep);
    cout << a;
    return 0;
}
