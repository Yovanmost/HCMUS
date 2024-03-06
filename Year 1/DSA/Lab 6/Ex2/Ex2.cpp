#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <algorithm>

using namespace std;

struct Student {
    string code;
    string name;
    string birth_date;
    bool status; // 0: undergrad, 1: graduated
};

struct Node {
    Student student;
    Node* left;
    Node* right;
};

Node* createNode(Student student) {
    Node* newNode = new Node;
    newNode->student = student;
    newNode->left = nullptr;
    newNode->right = nullptr;
    return newNode;
}

void insert(Node*& root, Student student) {
    if (root == nullptr) {
        root = createNode(student);
    } else {
        if (student.code < root->student.code) {
            insert(root->left, student);
        } else if (student.code > root->student.code) {
            insert(root->right, student);
        } else {
            // If student with the same code already exists, update the data.
            root->student = student;
        }
    }
}

Student* find(Node* root, string code) {
    if (root == nullptr || root->student.code == code) {
        return &root->student;
    }
    if (code < root->student.code) {
        return find(root->left, code);
    }
    return find(root->right, code);
}

void listLexicographicOrder(Node* root, vector<Student>& result) {
    if (root != nullptr) {
        listLexicographicOrder(root->left, result);
        result.push_back(root->student);
        listLexicographicOrder(root->right, result);
    }
}

void listGraduatedStudents(Node* root, vector<Student>& result) {
    if (root != nullptr) {
        listGraduatedStudents(root->left, result);
        if (root->student.status) {
            result.push_back(root->student);
        }
        listGraduatedStudents(root->right, result);
    }
}

Node* findMin(Node* node) {
    Node* current = node;
    while (current->left != nullptr) {
        current = current->left;
    }
    return current;
}

Node* deleteStudent(Node* root, string code) {
    if (root == nullptr) {
        return root;
    }
    if (code < root->student.code) {
        root->left = deleteStudent(root->left, code);
    } else if (code > root->student.code) {
        root->right = deleteStudent(root->right, code);
    } else {
        if (root->left == nullptr) {
            Node* temp = root->right;
            delete root;
            return temp;
        } else if (root->right == nullptr) {
            Node* temp = root->left;
            delete root;
            return temp;
        }
        Node* temp = findMin(root->right);
        root->student = temp->student;
        root->right = deleteStudent(root->right, temp->student.code);
    }
    return root;
}

void saveDataToFile(Node* root, ofstream& file) {
    if (root != nullptr) {
        saveDataToFile(root->left, file);
        file << root->student.code << "\n"
             << root->student.name << "\n"
             << root->student.birth_date << "\n"
             << root->student.status << "\n";
        saveDataToFile(root->right, file);
    }
}

int main() {
    Node* root = nullptr;
    string filename = "student.data";
    ifstream inputFile(filename);
    if (inputFile.good()) {
        int numStudents;
        inputFile >> numStudents;
        inputFile.ignore(numeric_limits<streamsize>::max(), '\n');
        for (int i = 0; i < numStudents; ++i) {
            Student student;
            getline(inputFile, student.code);
            getline(inputFile, student.name);
            getline(inputFile, student.birth_date);
            inputFile >> student.status;
            inputFile.ignore(numeric_limits<streamsize>::max(), '\n');
            insert(root, student);
        }
        inputFile.close();
    }

    while (true) {
        cout << "\nMenu:\n"
                  << "1. Insert a new student\n"
                  << "2. Find and update a student\n"
                  << "3. List all students in lexicographic order\n"
                  << "4. List all graduated students\n"
                  << "5. Delete a student by code\n"
                  << "6. Delete all graduated students and save to file\n"
                  << "7. Exit\n"
                  << "Enter your choice: ";

        int choice;
        cin >> choice;
        cin.ignore(numeric_limits<streamsize>::max(), '\n');

        if (choice == 1) {
            Student newStudent;
            cout << "Enter the student code: ";
            getline(cin, newStudent.code);
            cout << "Enter the student name: ";
            getline(cin, newStudent.name);
            cout << "Enter the student birth date (e.g., 12/1/1997): ";
            getline(cin, newStudent.birth_date);
            cout << "Enter the student status (0: undergrad, 1: graduated): ";
            cin >> newStudent.status;
            cin.ignore(numeric_limits<streamsize>::max(), '\n');
            insert(root, newStudent);
            cout << "Student added successfully.\n";
        } else if (choice == 2) {
            string code;
            cout << "Enter the student code to find and update: ";
            getline(cin, code);
            Student* student = find(root, code);
            if (student != nullptr) {
                cout << "Student found:\n"
                          << "Name: " << student->name << "\n"
                          << "Birth Date: " << student->birth_date << "\n"
                          << "Status: " << (student->status ? "Graduated" : "Undergrad") << "\n";

                cout << "Enter the updated student name: ";
                getline(cin, student->name);
                cout << "Enter the updated student birth date (e.g., 12/1/1997): ";
                getline(cin, student->birth_date);
                cout << "Enter the updated student status (0: undergrad, 1: graduated): ";
                cin >> student->status;
                cin.ignore(numeric_limits<streamsize>::max(), '\n');
                cout << "Student information updated successfully.\n";
            } else {
                cout << "Student not found.\n";
            }
        } else if (choice == 3) {
            vector<Student> studentsLexicographic;
            listLexicographicOrder(root, studentsLexicographic);
            if (studentsLexicographic.empty()) {
                cout << "No students found.\n";
            } else {
                cout << "Students in lexicographic order:\n";
                for (const Student& student : studentsLexicographic) {
                    cout << "Code: " << student.code << "\n"
                              << "Name: " << student.name << "\n"
                              << "Birth Date: " << student.birth_date << "\n"
                              << "Status: " << (student.status ? "Graduated" : "Undergrad") << "\n"
                              << "-----------------\n";
                }
            }
        } else if (choice == 4) {
            vector<Student> graduatedStudents;
            listGraduatedStudents(root, graduatedStudents);
            if (graduatedStudents.empty()) {
                cout << "No graduated students found.\n";
            } else {
                cout << "Graduated students:\n";
                for (const Student& student : graduatedStudents) {
                    cout << "Code: " << student.code << "\n"
                              << "Name: " << student.name << "\n"
                              << "Birth Date: " << student.birth_date << "\n"
                              << "-----------------\n";
                }
            }
        } else if (choice == 5) {
            string code;
            cout << "Enter the student code to delete: ";
            getline(cin, code);
            root = deleteStudent(root, code);
            cout << "Student deleted successfully.\n";
        } else if (choice == 6) {
            vector<Student> graduatedStudents;
            listGraduatedStudents(root, graduatedStudents);
            if (graduatedStudents.empty()) {
                cout << "No graduated students to save.\n";
            } else {
                ofstream outputFile(filename);
                if (outputFile.good()) {
                    outputFile << graduatedStudents.size() << "\n";
                    for (const Student& student : graduatedStudents) {
                        outputFile << student.code << "\n"
                                   << student.name << "\n"
                                   << student.birth_date << "\n"
                                   << student.status << "\n";
                    }
                    outputFile.close();
                    cout << "Graduated students saved to file successfully.\n";
                } else {
                    cout << "Failed to save graduated students to file.\n";
                }
            }
        } else if (choice == 7) {
            ofstream outputFile(filename);
            if (outputFile.good()) {
                vector<Student> allStudents;
                listLexicographicOrder(root, allStudents);
                outputFile << allStudents.size() << "\n";
                for (const Student& student : allStudents) {
                    outputFile << student.code << "\n"
                               << student.name << "\n"
                               << student.birth_date << "\n"
                               << student.status << "\n";
                }
                outputFile.close();
                cout << "Exiting the program.\n";
                break;
            } else {
                cout << "Failed to save data to file.\n";
            }
        } else {
            cout << "Invalid choice. Please try again.\n";
        }
    }

    return 0;
}
