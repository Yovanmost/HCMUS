#include <iostream>

struct Node {
    int value;
    Node* left;
    Node* right;
    int height;
};

// Function to create a new node
Node* createNode(int value) {
    Node* newNode = new Node();
    newNode->value = value;
    newNode->left = nullptr;
    newNode->right = nullptr;
    newNode->height = 1;
    return newNode;
}

// Function to get the height of a node
int getHeight(Node* node) {
    if (node == nullptr) return 0;
    return node->height;
}

// Function to update the height of a node
void updateHeight(Node* node) {
    node->height = 1 + std::max(getHeight(node->left), getHeight(node->right));
}

// Function to get the balance factor of a node
int getBalanceFactor(Node* node) {
    if (node == nullptr) return 0;
    return getHeight(node->left) - getHeight(node->right);
}

// Function to perform a single right rotation
Node* singleRotateRight(Node* y) {
    Node* x = y->left;
    y->left = x->right;
    x->right = y;
    updateHeight(y);
    updateHeight(x);
    return x;
}

// Function to perform a single left rotation
Node* singleRotateLeft(Node* x) {
    Node* y = x->right;
    x->right = y->left;
    y->left = x;
    updateHeight(x);
    updateHeight(y);
    return y;
}

// Function to perform a double right rotation
Node* doubleRotateRight(Node* z) {
    z->left = singleRotateLeft(z->left);
    return singleRotateRight(z);
}

// Function to perform a double left rotation
Node* doubleRotateLeft(Node* x) {
    x->right = singleRotateRight(x->right);
    return singleRotateLeft(x);
}

// Function to insert a value into the AVL tree
Node* insert(Node* root, int value) {
    if (root == nullptr) {
        return createNode(value);
    }

    if (value < root->value) {
        root->left = insert(root->left, value);
    } else if (value > root->value) {
        root->right = insert(root->right, value);
    } else {
        // Value already exists in the tree, do nothing (no duplicates allowed).
        return root;
    }

    updateHeight(root);
    int balance = getBalanceFactor(root);

    if (balance > 1 && value < root->left->value) {
        return singleRotateRight(root);
    }

    if (balance < -1 && value > root->right->value) {
        return singleRotateLeft(root);
    }

    if (balance > 1 && value > root->left->value) {
        return doubleRotateRight(root);
    }

    if (balance < -1 && value < root->right->value) {
        return doubleRotateLeft(root);
    }

    return root;
}

// Function to print the tree in pre-order traversal
void preOrderTraversal(Node* root) {
    if (root == nullptr) return;
    std::cout << root->value << " ";
    preOrderTraversal(root->left);
    preOrderTraversal(root->right);
}

// Function to print the tree in in-order traversal
void inOrderTraversal(Node* root) {
    if (root == nullptr) return;
    inOrderTraversal(root->left);
    std::cout << root->value << " ";
    inOrderTraversal(root->right);
}

// Function to print the tree in post-order traversal
void postOrderTraversal(Node* root) {
    if (root == nullptr) return;
    postOrderTraversal(root->left);
    postOrderTraversal(root->right);
    std::cout << root->value << " ";
}

// Function to delete a value from the AVL tree
Node* deleteValue(Node* root, int value) {
    // Implement the deletion logic here
}

// Function to calculate the height of the AVL tree
int calculateHeight(Node* root) {
    if (root == nullptr) return 0;
    return std::max(calculateHeight(root->left), calculateHeight(root->right)) + 1;
}

// Function to check if a given value exists in the AVL tree
bool searchValue(Node* root, int value) {
    if (root == nullptr) return false;
    if (root->value == value) return true;
    if (value < root->value) return searchValue(root->left, value);
    return searchValue(root->right, value);
}

// Function to delete the entire AVL tree to avoid memory leaks
void deleteTree(Node* root) {
    if (root == nullptr) return;
    deleteTree(root->left);
    deleteTree(root->right);
    delete root;
}

int main() {
    Node* root = nullptr;

    root = insert(root, 10);
    root = insert(root, 20);
    root = insert(root, 30);
    root = insert(root, 40);
    root = insert(root, 50);
    root = insert(root, 25);

    std::cout << "Pre-order traversal: ";
    preOrderTraversal(root);
    std::cout << std::endl;

    std::cout << "In-order traversal: ";
    inOrderTraversal(root);
    std::cout << std::endl;

    std::cout << "Post-order traversal: ";
    postOrderTraversal(root);
    std::cout << std::endl;

    int height = calculateHeight(root);
    std::cout << "Tree height: " << height << std::endl;

    int search = 30;
    if (searchValue(root, search)) {
        std::cout << search << " exists in the tree." << std::endl;
    } else {
        std::cout << search << " does not exist in the tree." << std::endl;
    }

    deleteTree(root); // Clean up memory
    return 0;
}
