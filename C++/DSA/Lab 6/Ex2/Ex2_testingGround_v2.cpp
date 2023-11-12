#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <algorithm>

using namespace std;

struct Student{
    string code;
    string name;
    string birthDate;
    bool status; // 0: undergrad, 1: graduated
};

struct Node{
    Student student;
    Node* left = nullptr;
    Node* right = nullptr;
};

Node* createNode(Student student){
    Node* newNode = new Node;
    newNode->student = student;
    return newNode;
}

void addNode(Node*& root, Student student){
    if (root == nullptr) 
        root = createNode(student);

    else{
        if (student.code < root->student.code)
            addNode(root->left, student);

        else if (student.code > root->student.code) 
            addNode(root->right, student);

        else 
            // If student with the same code already exists -> update info.
            root->student = student;
    }
}

Student* find(Node* root, string code){
    if (root == nullptr || root->student.code == code){
        return &root->student;
    }
    if (code < root->student.code){
        return find(root->left, code);
    }
    return find(root->right, code);
}

Node* findNodeV2(Node* root, string code){
    if (root == nullptr || root->student.code == code)
        return root;

    if (code < root->student.code)
        return findNodeV2(root->left, code);

    // code > root->student.code
    return findNodeV2(root->right, code);
}

// LNR 
void listNoneOrder(Node* root, vector<Student>& result){
    if (root != nullptr){
        listNoneOrder(root->left, result);
        result.push_back(root->student);
        listNoneOrder(root->right, result);
    }
}

void listGraduatedStudents(Node* root, vector<Student>& result){
    if (root != nullptr){
        listGraduatedStudents(root->left, result);
        
        if (root->student.status) 
            result.push_back(root->student);
        
        listGraduatedStudents(root->right, result);
    }
}

Node* findMin(Node* node){
    Node* current = node;

    while (current->left != nullptr)
        current = current->left;

    return current;
}

Node* deleteStudent(Node* root, string code){
    if (root == nullptr)
        return root;

    if (code < root->student.code)
        root->left = deleteStudent(root->left, code);

    else if (code > root->student.code)
        root->right = deleteStudent(root->right, code);
        
    // code == root->student.code
    else{
        if (root->left == nullptr){
            Node* temp = root->right;
            delete root;
            return temp;
        } 
        else if (root->right == nullptr){
            Node* temp = root->left;
            delete root;
            return temp;
        }
        // 2 nodes deletion
        Node* temp = findMin(root->right);
        root->student = temp->student;
        root->right = deleteStudent(root->right, temp->student.code);
    }

    return root;
}

// LNR saving
void saveDataToFile(Node* root, ofstream& file){
    if (root != nullptr){
        saveDataToFile(root->left, file);
        file << root->student.code << "\n"
             << root->student.name << "\n"
             << root->student.birthDate << "\n"
             << root->student.status << "\n";
        saveDataToFile(root->right, file);
    }
}

void printStudent(Student st){
    cout << st.code << "|"
        << st.name << "|"
        << st.birthDate << "|"
        << st.status << '\n';
}

void readFile(Node* &root, string s){
    ifstream fr;
    fr.open(s);
    if (fr.is_open()){
        int numberOfStudent;
        fr >> numberOfStudent;
        fr.ignore();
        for (int i = 0; i < numberOfStudent; i++){
            Student st;
            getline(fr, st.code);
            getline(fr, st.name);
            getline(fr, st.birthDate);
            fr >> st.status;
            fr.ignore();
            addNode(root, st);
        }
        fr.close();
    }
    else root == nullptr;
    
}

bool compare(Student a, Student b){
    return a.name < b.name;
}

int main(){
    Node* root = nullptr;
    string filename = "student.txt";
    readFile(root, filename);

AGAIN:
    cout << "\nMenu:\n"
                << "1. Add a new student\n"
                << "2. Find and update a student\n"
                << "3. List all students in lexicographic order\n"
                << "4. List all graduated students\n"
                << "5. Delete a student by code\n"
                << "6. Delete all graduated students and save to file\n"
                << "7. Exit\n"
                << "Enter your choice: ";

    int choice;
    cin >> choice;
    cin.ignore();

    switch (choice){
        case 1:{
            Student newStudent;
            cout << "Enter the student code: ";
            getline(cin, newStudent.code);
            cout << "Enter the student name: ";
            getline(cin, newStudent.name);
            cout << "Enter the student birth date (e.g., 23/9/2004): ";
            getline(cin, newStudent.birthDate);
            cout << "Enter the student status (0: undergrad, 1: graduated): ";
            cin >> newStudent.status;
            cin.ignore();
            addNode(root, newStudent);
            cout << "Student added successfully.\n";

            break;
        }
            

        case 2:{
            string code;
            cout << "Enter the student code to find and update: ";
            getline(cin, code);
            Node* findStudent = findNodeV2(root, code);
            if (findStudent != nullptr){
                cout << "Student found:\n"
                            << "Name: " << findStudent->student.name << "\n"
                            << "Birth Date: " << findStudent->student.birthDate << "\n"
                            << "Status: " << (findStudent->student.status ? "Graduated" : "Undergrad") << "\n";

                Student newStudent;
                cout << "Enter the student code: ";
                getline(cin, newStudent.code);
                cout << "Enter the student name: ";
                getline(cin, newStudent.name);
                cout << "Enter the student birth date (e.g., 23/9/2004): ";
                getline(cin, newStudent.birthDate);
                cout << "Enter the student status (0: undergrad, 1: graduated): ";
                cin >> newStudent.status;
                cin.ignore();
                root = deleteStudent(root, code);
                addNode(root, newStudent);
                cout << "Student information updated successfully.\n";
            } 
            else
                cout << "Student not found.\n";
            
            break;
        }

        case 3:{
            vector<Student> studentList;
            listNoneOrder(root, studentList);
            std::sort(studentList.begin(), studentList.end(), compare);

            if (studentList.empty())
                cout << "No students found.\n";
            
            else{
                cout << "Students in lexicographic order:\n";
                for (int i = 0; i < studentList.size(); i++){
                    cout << "Code: " << studentList[i].code << "\n"
                        << "Name: " << studentList[i].name << "\n"
                        << "Birth Date: " << studentList[i].birthDate << "\n"
                        << "Status: " << (studentList[i].status ? "Graduated" : "Undergrad") << "\n"
                        << "-----------------\n";
                }   
            }
            break;
        }
        
        case 4:{
            vector<Student> graduatedList;
            listGraduatedStudents(root, graduatedList);

            if (graduatedList.empty())
                cout << "No graduated students found.\n";

            else{
                cout << "Graduated students:\n";
                for (int i = 0; i < graduatedList.size(); i++){
                    cout << "Code: " << graduatedList[i].code << "\n"
                                << "Name: " << graduatedList[i].name << "\n"
                                << "Birth Date: " << graduatedList[i].birthDate << "\n"
                                << "-----------------\n";
                }
            }

            break;
        }
        
        case 5:{
            string code;
            cout << "Enter the student code to delete: ";
            getline(cin, code);
            root = deleteStudent(root, code);
            cout << "Student deleted successfully.\n";
        }
        
        case 6:{
            vector<Student> graduatedList;
            listGraduatedStudents(root, graduatedList);

            if (graduatedList.empty())
                cout << "No graduated students to deleted.\n";
            
            else{
                ofstream outputFile(filename);
                // removing graduated part
                for (int i = 0; i < graduatedList.size(); i++)
                    root = deleteStudent(root, graduatedList[i].code);

                if (outputFile.good()){
                    vector<Student> allStudents;
                    listNoneOrder(root, allStudents);
                    outputFile << allStudents.size() << "\n";
                    for (const Student& student : allStudents){
                        outputFile << student.code << "\n"
                                    << student.name << "\n"
                                    << student.birthDate << "\n"
                                    << student.status << "\n";
                    }
                    outputFile.close();
                    cout << "Graduated students deleted, saving others to file successfully.\n";
                } 
                else
                    cout << "Failed to delete graduated students.\n";
            }   
            break;
        }
        
        case 7:{
            ofstream outputFile(filename);

            if (outputFile.good()){
                vector<Student> allStudents;
                listNoneOrder(root, allStudents);
                outputFile << allStudents.size() << "\n";
                for (const Student& student : allStudents){
                    outputFile << student.code << "\n"
                                << student.name << "\n"
                                << student.birthDate << "\n"
                                << student.status << "\n";
                }
                outputFile.close();
                cout << "Exiting and saving the program.\n";
                return 0;
                break;
            } 
            
            else
                cout << "Failed to save data to file.\n";
            
            return 0;
        }
        
        default:
            cout << "Invalid choice. Please try again.\n";
            break;
    }
    
goto AGAIN;

    return 0;
}
