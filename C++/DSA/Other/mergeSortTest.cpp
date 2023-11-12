#include <iostream>
#include <fstream>
#include <sstream>

using namespace std;

#define MAX 1000
struct employee
{
    string ID;
    string name;
    int birthyear;
};

void merge(employee arr[], int p, int q, int r)
{
    int n1 = q - p + 1;
    int n2 = r - q + 1 - 1;

    employee L[n1], R[n2];

    for (int i = 0; i < n1; i++)
        L[i] = arr[p + i];

    for (int j = 0; j < n2; j++)
        R[j] = arr[q + 1 + j];

    int i = 0, j = 0, k = p;

    while (i < n1 && j < n2)
    {
        if (L[i].birthyear <= R[j].birthyear)
        {
            arr[k] = L[i];
            i++;
        }
        else
        {
            arr[k] = R[j];
            j++;
        }
        k++;
    }

    while (i < n1)
    {
        arr[k] = L[i];
        i++;
        k++;
    }

    while (j < n2)
    {
        arr[k] = R[j];
        j++;
        k++;
    }

}

void mergeSort(employee arr[], int l, int r)
{
    if (l < r)
    {
        int m = l + (r - l) / 2;

        mergeSort(arr, l, m);
        mergeSort(arr, m + 1, r);

        merge(arr, l, m, r);
    }
}

void nameOrder(employee List[], int count)
{
    for(int i = 0; i < count; i++)
    {
        if (List[i].birthyear == List[i + 1].birthyear && List[i].name > List[i+1].name)
        {
            swap(List[i], List[i+1]);
            i--;
        }
    }
}

void printList(employee List[], int count)
{
    for (int i = 0; i < count; i++)
        cout << List[i].ID << " " << List[i].name << " " << List[i].birthyear << endl;
}

int main()
{
    employee List[MAX];
    int count = 0;
    ifstream fin;
    string s = "C:\\Users\\Binh Minh\\Desktop\\Deadline\\1. DSA\\Lab\\employee.txt";
    fin.open(s);
    string line;
    getline(fin, line);

    while(getline(fin, line))
    {
        string temp;
        stringstream ss(line);
        getline(ss, temp, ',');
        List[count].ID = temp;
        getline(ss, temp,',');
        List[count].name = temp;
        getline(ss, temp);
        List[count].birthyear = stoi(temp);
        count += 1;
    }
    fin.close();
    int left = 0, right = count - 1;

    mergeSort(List, left, right);
    nameOrder(List, count);
    
    ofstream fout ("sortedemponage1.txt");

    for (int i = 0; i < count; i++)
        fout << List[i].ID << "," << List[i].name << "," << List[i].birthyear << endl;
    
    fout.close();
    return 0;
}