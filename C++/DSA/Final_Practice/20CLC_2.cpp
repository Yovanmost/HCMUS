#include <iostream>
#include <cstring>
#include <fstream>
#include <vector>
#define SIZE 50

using namespace std;

struct BSTNode{
    int key;
    BSTNode* pLeft;
    BSTNode* pRight;
};

BSTNode* createNode(int value){
    BSTNode* p = new BSTNode;
    p->key = value;
    p->pLeft = nullptr;
    p->pRight = nullptr;
    return p;
}

BSTNode* addNode(BSTNode* root, int value){
    if (root == nullptr)
        return createNode(value);
    if (value < root->key)
        root->pLeft = addNode(root->pLeft, value);
    else if (value > root->key)
        root->pRight = addNode(root->pRight, value);

    return root;
}

int findHeight(BSTNode* root){
    if (root == nullptr)
        return 0;
    int leftHeight = findHeight(root->pLeft);
    int rightHeight = findHeight(root->pRight);
    if (leftHeight > rightHeight)
        return leftHeight + 1;
    else return rightHeight + 1;
}

int countNoneLeaf(BSTNode* root){
    if (root == nullptr)
        return 0;
    if (root->pLeft || root->pRight)
        return 1 + countNoneLeaf(root->pLeft) + countNoneLeaf(root->pRight);
    else return countNoneLeaf(root->pLeft) + countNoneLeaf(root->pRight);
}

int weirdMath(BSTNode* root){
    if (root == nullptr)
        return 0;
    int sum = 0;

    int left = weirdMath(root->pLeft);
    sum = left - root->key;
    int right = weirdMath(root->pRight);
    sum = sum - right;
    return sum;
}

bool weirdMathV2(BSTNode* root, vector<BSTNode*> &list){
    if (root == nullptr)    
        return false;
    weirdMathV2(root->pLeft, list);
    list.push_back(root);
    weirdMathV2(root->pRight, list);
    return true;
}

void findWeirdSum(vector<BSTNode*> list){
    int sum = list[0]->key;
    int sum2 = 0;
    for (int i = 0; i < list.size(); i++)
        sum2 += list[i]->key;
    
    sum = sum - sum2;    
    cout << sum;
}

int main(){


    return 0;
}