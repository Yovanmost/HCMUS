#include <iostream>
#include <fstream>
#include <string>
#include <vector>

// Node structure to represent each person in the family tree
struct Node {
    std::string name;
    std::vector<Node*> children;

    Node(std::string n) : name(n) {}
};

// Function to add nodes to the family tree
Node* addNode(Node* parent, std::string parentName, std::vector<std::string>& childrenNames) {
    if (!parent) {
        parent = new Node(parentName);
    }

    for (const std::string& childName : childrenNames) {
        parent->children.push_back(new Node(childName));
    }

    return parent;
}

// Recursive pre-order traversal (NLR)
void preOrderTraversal(Node* node) {
    if (node) {
        std::cout << node->name << " ";
        for (Node* child : node->children) {
            preOrderTraversal(child);
        }
    }
}

// Recursive in-order traversal (LNR)
void inOrderTraversal(Node* node) {
    if (node) {
        if (node->children.size() >= 1) {
            inOrderTraversal(node->children[0]);
        }
        std::cout << node->name << " ";
        for (size_t i = 1; i < node->children.size(); ++i) {
            inOrderTraversal(node->children[i]);
        }
    }
}

// Recursive post-order traversal (LRN)
void postOrderTraversal(Node* node) {
    if (node) {
        for (Node* child : node->children) {
            postOrderTraversal(child);
        }
        std::cout << node->name << " ";
    }
}

int main() {
    std::ifstream inputFile("input.txt");
    if (!inputFile) {
        std::cerr << "Error opening the input file.\n";
        return 1;
    }

    int numRelations;
    inputFile >> numRelations;

    Node* root = nullptr;

    for (int i = 0; i < numRelations; ++i) {
        std::string parentName, childName;
        char delimiter;
        inputFile >> delimiter; // '('
        inputFile >> parentName;

        std::vector<std::string> childrenNames;
        while (inputFile.peek() != ')') {
            inputFile >> childName;
            childrenNames.push_back(childName);
        }

        root = addNode(root, parentName, childrenNames);
    }

    inputFile.close();

    // Perform the pre-order traversal
    std::cout << "Pre-Order Traversal: ";
    preOrderTraversal(root);
    std::cout << std::endl;

    // Perform the in-order traversal
    std::cout << "In-Order Traversal: ";
    inOrderTraversal(root);
    std::cout << std::endl;

    // Perform the post-order traversal
    std::cout << "Post-Order Traversal: ";
    postOrderTraversal(root);
    std::cout << std::endl;

    return 0;
}
