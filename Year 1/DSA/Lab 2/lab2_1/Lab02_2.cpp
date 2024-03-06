#include <iostream>
#include <string>
#include <fstream>
#include <vector>

using namespace std;

struct Employee{
    string ID;
    string name;
    int birthYear;
};

vector<Employee> listOfEmployee;

void readInfo(string s){
    ifstream fr;
    fr.open(s);
    Employee tmpEmployee;
    string tmp;
    getline(fr, tmp);
    while (!fr.eof()){
        getline(fr, tmpEmployee.ID, ',');
        getline(fr, tmpEmployee.name, ',');
        getline(fr, tmp);
        tmpEmployee.birthYear = stoi(tmp);
        listOfEmployee.push_back(tmpEmployee);
    }
    fr.close();
}

void printList(){
    for (int i = 0; i < listOfEmployee.size(); i++)
        cout << i + 1<< "." << listOfEmployee[i].name << ' ' << listOfEmployee[i].birthYear << '\n';
}

void writeFile(string s){
    ofstream fw;
    fw.open(s);
    for (int i = 0; i < listOfEmployee.size() - 1; i++)
        fw << listOfEmployee[i].ID << ',' 
            << listOfEmployee[i].name << ','
            << listOfEmployee[i].birthYear << '\n';
    int n = listOfEmployee.size() - 1;
    fw << listOfEmployee[n].ID << ',' 
        << listOfEmployee[n].name << ','
        << listOfEmployee[n].birthYear;
}

bool compareAgeName(Employee a, Employee b){
    return (a.birthYear > b.birthYear) || (a.birthYear == b.birthYear && a.name > b.name);
}

bool compareAgeNameQuick(Employee a, Employee b){
    return (a.birthYear < b.birthYear) || (a.birthYear == b.birthYear && a.name < b.name);
}

bool compareAgeNameMerge(Employee a, Employee b){
    return (a.birthYear <= b.birthYear) || (a.birthYear == b.birthYear && a.name <= b.name);
}

// HEAPSORT

void heapify(int n, int i){
    int largest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;

    if (left < n && compareAgeName(listOfEmployee[left], listOfEmployee[largest]))
        largest = left;

    if (right < n && compareAgeName(listOfEmployee[right], listOfEmployee[largest]))
        largest = right;

    if (largest != i) {
        swap(listOfEmployee[i], listOfEmployee[largest]);
        heapify(n, largest);
    }
}

void heapSort(){
    for (int i = listOfEmployee.size() / 2 - 1; i >= 0; i--)
        heapify(listOfEmployee.size(), i);

    for (int i = listOfEmployee.size() - 1; i >= 0; i--) {
        swap(listOfEmployee[0], listOfEmployee[i]);
        heapify(i, 0);
    }
}

// QUICKSORT

int partition(int low, int high){
    Employee pivot = listOfEmployee[high];
    // Right most so far
    int i = (low - 1);

    for (int j = low; j <= high - 1; j++){
        // If current element is smaller than the pivot
        if (compareAgeNameQuick(listOfEmployee[j], pivot)) {
            i++;
            swap(listOfEmployee[i], listOfEmployee[j]);
        }
    }
    swap(listOfEmployee[i + 1], listOfEmployee[high]);
    return (i + 1);
}

void quickSort(int low, int high){
    if (low < high){
        int pi = partition(low, high);

        quickSort(low, pi - 1);
        quickSort(pi + 1, high);
    }
}

// MERGESORT

void merge(int left, int mid, int right){
    int size1 = mid - left + 1;
    int size2 = right - mid;

    Employee leftTmp[size1], rightTmp[size2];

    for (int i = 0; i < size1; i++)
        leftTmp[i] = listOfEmployee[left+i];

    for (int i = 0; i < size2; i++)
        rightTmp[i] = listOfEmployee[mid + 1 + i];

    int i = 0, j = 0, k = left;
    
    while (i < size1 && j < size2){
        if (compareAgeNameMerge(leftTmp[i], rightTmp[j]))
            listOfEmployee[k++] = leftTmp[i++];
        else
            listOfEmployee[k++] = rightTmp[j++];
    }

    while (i < size1){
        listOfEmployee[k++] = leftTmp[i++];
    }

    while (j < size2){
        listOfEmployee[k++] = rightTmp[j++];
    }  
}

void mergeSort(int left, int right){
    if (left < right){
        int mid = left + (right - left) / 2;
        mergeSort(left, mid);
        mergeSort(mid+1, right);
        merge(left, mid, right);
    }
}


int main(){

    // string s = "C:\\Users\\Binh Minh\\Desktop\\Deadline\\1. DSA\\Lab\\employee.txt";
    string s = "employee.txt";
    cout << "READ\n";
    readInfo(s);
    
    cout << "SORTING\n";
    // heapSort();
    // quickSort(0, listOfEmployee.size() - 1);
    // mergeSort(0, listOfEmployee.size() - 1);
    
    printList();
    cout << "END";

    string outputFile = "sortedemponage.txt";
    writeFile(outputFile);

    return 0;
}