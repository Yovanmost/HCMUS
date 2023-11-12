#include <iostream>
#include <string>
#include <vector>
#include <fstream>

using namespace std;

struct Node {
  string name;
  Node* parent;
  vector<Node*> children;
};

Node* createNode(string name) {
  Node* node = new Node();
  node->name = name;
  node->parent = nullptr;
  return node;
}

Node* findNode(Node* root, string name) {
  Node* node = root;
  while (node != nullptr && node->name != name) {
    node = node->children[0];
  }

  return node;
}


void addNode(Node* parent, string name) {
  Node* node = createNode(name);
  node->parent = parent;
  parent->children.push_back(node);
}

void printPreOrder(Node* node) {
  if (node == nullptr) {
    return;
  }

  cout << node->name << " ";
  for (Node* child : node->children) {
    printPreOrder(child);
  }
}

void printInOrder(Node* node) {
  if (node == nullptr) {
    return;
  }

  for (Node* child : node->children) {
    printInOrder(child);
  }

  cout << node->name << " ";
}

void printPostOrder(Node* node) {
  if (node == nullptr) {
    return;
  }

  for (Node* child : node->children) {
    printPostOrder(child);
  }

  cout << node->name << " ";
}

int main() {
  // Read family data from input file.
  ifstream input("input.txt");
  int numRelations;
  input >> numRelations;

  Node* root = nullptr;
  for (int i = 0; i < numRelations; i++) {
    string parentName, childName;
    input >> parentName >> childName;

    Node* parent = root;
    if (parentName != "") {
      parent = findNode(root, parentName);
    }

    addNode(parent, childName);
  }

  // Print the family tree in PreOrder, InOrder, and PostOrder order.
  cout << "PreOrder: ";
  printPreOrder(root);
  cout << endl;

  cout << "InOrder: ";
  printInOrder(root);
  cout << endl;

  cout << "PostOrder: ";
  printPostOrder(root);
  cout << endl;

  return 0;
}

