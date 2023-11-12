#include <iostream>
#include <cstring>
#include <fstream>
#include <vector>
#define SIZE 50

using namespace std;

struct Employee{
    char name[50];
    char department[50];
    unsigned short age;
    bool gender; // 0 for male, 1 for female
    int sales;
};

struct Node{
    Employee employee;
    Node* next = nullptr;
};

Node* createNode(Employee a){
    Node* p = new Node;
    p->employee = a;
    return p;
}

void addTail(Node* &pHead, Employee a){
    Node* p = createNode(a);
    if (pHead == nullptr)
        pHead = p;
    else {
        Node* tmp = pHead;
        while (tmp->next != nullptr)
            tmp = tmp->next;
        tmp->next = p;
    }
}

void loadFile(Node* &pHead, char fileName[]){
    ifstream fr;
    fr.open(fileName);
    Employee tmp;
    char tmp2[SIZE];
    while (!fr.eof()){
        fr.getline(tmp.name, SIZE, ',');
        fr.getline(tmp.department, SIZE, ',');

        fr.getline(tmp2, SIZE, ',');
        tmp.age = (unsigned short)stoi(tmp2);

        fr.getline(tmp2, SIZE, ',');
        if (strcmp(tmp2, "Female") == 0)
            tmp.gender = true;
        else tmp.gender = false;

        fr.getline(tmp2, SIZE);
        tmp.sales = stoi(tmp2);

        addTail(pHead, tmp);
    }
}

void printList(Node* pHead){
    Node* tmp = pHead;
    while (tmp != nullptr){
        cout << tmp->employee.name << " " 
            << tmp->employee.department  << " "
            << tmp->employee.age << " "
            << (tmp->employee.gender ? "Female" : "Male") << " "
            << tmp->employee.sales << "\n";
        tmp = tmp->next;
    }

}

int maxAgeMale(Node* pHead){
    int max = 0;
    Node* tmp = pHead;
    while (tmp != nullptr){
        if (tmp->employee.age > max && !tmp->employee.gender)
            max = tmp->employee.age;
        tmp = tmp->next;
    }
    return max;
}

int maxSalesMales(Node* pHead){
    int max = 0;
    Node* tmp = pHead;
    while (tmp != nullptr){
        if (tmp->employee.sales > max && !tmp->employee.gender)
            max = tmp->employee.sales;
        tmp = tmp->next;
    }
    return max;
}

void findOldestMale(Node* pHead){
    vector<Node*> list;
    int maxAge = maxAgeMale(pHead);
    Node* tmp = pHead;
    while (tmp != nullptr){
        if (tmp->employee.age == maxAge && !tmp->employee.gender)
            list.push_back(tmp);
        tmp = tmp->next;
    }
    
    for (int i = 0; i < list.size() - 1; i++)
        for (int j = 0; j < list.size(); j++)
            if (list[i]->employee.sales < list[j]->employee.sales)
                swap(list[i], list[j]);
    
    int maxSales = list[0]->employee.sales;
    int i = 0;
    while (list[i]->employee.sales == maxSales){
        cout << list[i]->employee.name << '\n';
        i++;
    }
}

float averageSalesFemale(Node* pHead){
    int sum = 0;
    int count = 0;
    Node* tmp = pHead;
    while (tmp != nullptr){
        if (tmp->employee.gender)
            sum += tmp->employee.sales;
        count++;
        tmp = tmp->next;
    }   
    return sum/(float)count;
}

bool compareEmployee(Node* a, char name[], char department[], unsigned short age){
    if (!strcmp(a->employee.name, name) && !strcmp(a->employee.department, department) && a->employee.age == age)
        return true;
    return false;
}

Node* findEmployee(Node* pHead, char name[], char department[], unsigned short age){
    Node* tmp = pHead;
    while (tmp != nullptr){
        if (compareEmployee(tmp, name, department, age))
            return tmp;
        tmp = tmp->next;
    }
    return nullptr;
}

void deleteNodeV2(Node* pHead, char name[], char department[], unsigned short age){
    if (pHead == nullptr)
        return;
    
    if (pHead->next == nullptr){
        delete pHead;
        pHead = nullptr;
        return;
    }

    Node* cur = pHead;
    Node* pre = nullptr;
    while (cur->next != nullptr){
x            break;
        pre = cur;
        cur = cur->next;
    }
    pre->next = cur->next;
    delete cur;
}

void deleteLastNode(Node* pHead) {
    if (pHead == nullptr) {
        return; // Empty list, nothing to delete
    }

    if (pHead->next == nullptr) {
        delete pHead;
        pHead = nullptr;
        return; // List had only one node, which is now deleted
    }

    Node* previous = nullptr;
    Node* current = pHead;

    while (current->next != nullptr) {
        previous = current;
        current = current->next;
    }

    delete current;
    previous->next = nullptr;
}

void deleteNode(Node* pHead, char name[], char department[], unsigned short age){
    Node* p = findEmployee(pHead, name, department, age);
    Node* tmp = p->next;        
    if (tmp == nullptr){
        // p->next 
        delete p;
        p = nullptr;
        return;
    }   
    *p = *tmp;
    delete tmp;
}

bool checkMaleLessThan20(Node* p){
    if (p->employee.age <= 20 && !p->employee.gender)
        return true;
    return false;
}

void removeMaleLessThan20(Node* pHead){
    Node *tmp = pHead;
    while (tmp != nullptr){
        if (checkMaleLessThan20(tmp))
            deleteNodeV2(pHead, tmp->employee.name, tmp->employee.department, tmp->employee.age);
        tmp = tmp->next;
    }
}

bool compareCondition(Employee a, Employee b){
    return (a.sales <= b.sales) || 
            (a.sales == b.sales && a.age <= b.age) ||
            (a.sales == b.sales && a.age == b.age && strcmp(a.name, b.name) <= 0);
            
}

Node* merge(Node* firstNode, Node* secondNode){
    Node* tmp = new Node;
    Node* merged = new Node;

    merged = tmp;

    while (firstNode != nullptr && secondNode != nullptr){
        if (compareCondition(firstNode->employee, secondNode->employee)){
            tmp->next = firstNode;
            firstNode = firstNode->next;
        }
        else {
            tmp->next = secondNode;
            secondNode = secondNode->next;
        }
        tmp = tmp->next;
    }

    while (firstNode != nullptr){
        tmp->next = firstNode;
        firstNode = firstNode->next;
        tmp = tmp->next;
    }

    while (secondNode != nullptr){
        tmp->next = secondNode;
        secondNode = secondNode->next;
        tmp = tmp->next;
    }

    return merged->next;
}

Node* middle(Node* p){
    Node* slow = p;
    Node* fast = p->next;
    while (slow != nullptr && (fast != nullptr && fast->next != nullptr)){
        slow = slow->next;
        fast = fast->next->next;
    }
    return slow;
}

Node* sort(Node* pHead){
    if (pHead->next == nullptr)
        return pHead;

    Node* mid = new Node;
    Node* pHead2 = new Node;
    mid = middle(pHead);
    pHead2 = mid->next;
    mid->next = nullptr;

    Node* finalHead = merge(sort(pHead), sort(pHead2));
    return finalHead;    
}


int main(){
    Node* head = nullptr;
    char s[] = "input.txt";
    loadFile(head, s);
    printList(head);
    cout << "---------------------------------------------------\n";
    // findOldestMale(head);
    // cout << averageSalesFemale(head);
    // deleteNodeV2(head, "Robert Taylor", "Research", 26);
    // printList(head);
    // cout << "---------------------------------------------------\n";
    // removeMaleLessThan20(head);
    // printList(head);

    // cout << "---------------------------------------------------\n";
    Node* sorted = sort(head);
    printList(sorted);


    return 0;
}