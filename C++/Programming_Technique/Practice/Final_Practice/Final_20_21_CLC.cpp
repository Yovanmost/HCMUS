#include <iostream>
#include <cstring>
#include <string>
#include <math.h>

using namespace std;

char* replaceString(char* src, char* sub, char* rep){
    if (src == NULL)
        return NULL;
    
    string stringTmp = src;
    string stringSub = sub;
    string stringRep = rep;
    
    while (stringTmp.find(stringSub) != string::npos){
        stringTmp.replace(stringTmp.find(stringSub), stringSub.length(), stringRep);
    }
    int n = stringTmp.length();
    char* newString = new char [n];
    for (int i = 0; i < n; i++)
        newString[i] = stringTmp[i];
    return newString;
}

//--------------------------------------------------------------------------------------------------------
struct Node{
    int data;
    Node* pNext;
};

struct List{
    Node* pHead;
};

int countList(List ls){
    Node* p = ls.pHead;
    if (p == NULL)
        return 0;
    int count = 0;
    while (p != NULL){
        count++;
        p = p->pNext;
    }
    if (count < 3)
        return 0;
    else count = 0;
    p = ls.pHead;

    Node* first = p;
    Node* second = first->pNext;
    Node* third = second->pNext;
    
    while (third != NULL){
        if (abs(first->data - third->data) == second->data)
            count++;
        first = first->pNext;
        second = second->pNext;
        third = third->pNext;
    }
    return count;
}

//--------------------------------------------------------------------------------------------------------
bool checkIncreaseNode(Node* h){
    if (h->pNext == NULL)
        return true;
    if (h->data < h->pNext->data && h->pNext != NULL)
        checkIncreaseNode(h->pNext);
    else return false;    
}

int main(){



    return 0;
}

    // char* a = "Hello world hello friend hello yasuo hello rain";
    // char* sub = "hello";
    // char* rep = "hi";
    // replaceString(a, sub, rep);
    // cout << a;