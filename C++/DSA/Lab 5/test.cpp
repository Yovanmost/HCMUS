#include <iostream>
#include <string>
#include <fstream>
using namespace std;

// Create node to implement CHAINING METHOD
struct node {
    unsigned long number;
    node* pnext = nullptr;
};

node* createNode(unsigned long x)
{
    node* temp = new node;
    temp->number = x;
    temp->pnext = nullptr;
    return temp;
}

void addList(node *&head, node *temp)
{
    if (head == nullptr)
    {
        head = temp;
    }
    else
    {
        temp->pnext = head;
        head = temp;
    }
}

// Check if the prime
bool isPrime(int n)
{
    if (n <= 1)
        return false;

    for (int i = 2; i * i <= n; i++) 
    {
        if (n % i == 0)
            return false;
    }
    return true;
}

// Find next prime of number n
int findNextPrime(int n)
{
 
    if (n <= 1)
        return 2;
 
    int prime = n;
    bool isFound = false;
 
    while (!isFound) 
    {
        prime++;
        if (isPrime(prime))
            isFound = true;
    }
 
    return prime;
}

// Find previous prime of number n
int findPreviousPrime(int n)
{
 
    if (n <= 1)
        return 2;
 
    int prime = n;
    bool isFound = false;
 
    while (!isFound) 
    {
        prime--;
        if (isPrime(prime))
            isFound = true;
    }
 
    return prime;
}

// Get size of the input file
int getNumberOfName(string fileName)
{
    ifstream fin(fileName);

    int count = 0;
    string temp;

    while (getline(fin, temp))
        count += 1;
    
    fin.close();
    return count;
}

// Find the suitable hash table size
int findHashTableSize(string fileName, double loadFractor)
{
    int size_table = findNextPrime(getNumberOfName(fileName) / loadFractor);

    return size_table;
}

// djb2 hashing function
unsigned long hashing (unsigned char *str)
{
    unsigned long hash = 5381;
    int c;

    while (c = *str++)
    {
        hash = ((hash << 5) + hash) + c;
    }

    return hash;
}

// Create Hashing by Chaining method
void hashingByChain(int size_table, string fileName)
{
    ifstream fin (fileName);

    int count = 0;
    string temp;
    unsigned long c, mod;

    node **array = new node*[size_table];

    for (int i = 0; i < size_table; i++)
        array[i] = nullptr;

    while (getline(fin, temp))
    {
        c = hashing((unsigned char*)temp.c_str());
        mod = c % size_table;
        node* temp = createNode(c);
        addList(array[mod], temp);
    }

    for (int i = 0; i < size_table; i++)
    {
        node *temp = array[i];
        //cout << i << ": ";
        while (temp != nullptr)
        {
            //cout <<  temp->number << "  ";
            temp = temp->pnext;
        }
        if (array[i] != nullptr)
            count += 1;
        //cout << endl;
    }

    for (int i = 0; i < size_table; i++)
    {
        node *curr = array[i];
        while (curr != nullptr)
        {
            node *temp = curr;
            curr = curr->pnext;
            delete temp;
        }
    }
    cout << count << endl;
    fin.close();
}

// Create Hashing by Linear Probing
void hashingByLinearProbing(int size_table, int numberLine, string fileName)
{
    ifstream fin(fileName);
    string temp;
    unsigned long c, mod, hash1, i;
    unsigned long arr[size_table] = {0};

    int count = 0;

    while (getline(fin, temp))
    {
        c = hashing((unsigned char*)temp.c_str());

        // H(x) = x mod N 
        // where x is the element to add/find
        // N is the array size
        hash1 = c % size_table;
        mod = hash1;
        i = 0;

        while (arr[mod] != 0)
        {
            // h(x,i) = (H(x) + i) mod N
            // where i is the order of the attempt
            // N is the number of elements in the array
            mod = (hash1 + i) % numberLine;
            i++;
        }
        arr[mod] = c;

    }

    for (int i = 0; i < size_table; i++)
    {
        //cout << i << ": " << arr[i] << endl;
        if (arr[i] != 0)
            count += 1;
    }

    cout << count << endl;

    fin.close();
}

// Create Hashing by Quadratic Probing
void hashingByQuadraticProbing(int size_table, int numberLine, string fileName)
{
    ifstream fin(fileName);
    string temp;
    unsigned long c, mod, hash1, i;
    unsigned long arr[size_table] = {0};

    int count = 0;

    while (getline(fin, temp))
    {
        c = hashing((unsigned char*)temp.c_str());
        
        // H(x) = x mod N 
        // where x is the element to add/find
        // N is the array size
        hash1 = c % size_table;
        mod = hash1;
        i = 0;

        while (arr[mod] != 0)
        {
            // h(x,i) = (H(x) + i * i) mod N
            // where i is the order of the attempt
            // N is the number of elements in the array
            mod = (hash1 + i * i) % numberLine;
            i++;
        }
        arr[mod] = c;
    }

    for (int i = 0; i < size_table; i++)
    {
        //cout << i << ": " << arr[i];
        if (arr[i] != 0)
            count += 1;
    }

    cout << count << endl;

    fin.close();
}

// Create Hashing by Double Hashing
void hashingByDoubleHashing(int size_table, int numberLine, string fileName)
{
    ifstream fin(fileName);
    string temp;
    unsigned long c, mod, hash1, hash2, i, prime = findPreviousPrime(size_table);
    unsigned long arr[size_table] = {0};

    int count = 0;

    while (getline(fin, temp))
    {
        c = hashing((unsigned char*)temp.c_str());

        // H1(x) = x mod N 
        // where x is the element to add/find
        // N is the array size
        hash1 = c % size_table;
        mod = hash1;

        // H2(x) = prime - (key % prime)
        // where 'prime' is a prime smaller than the 'size_table'
        hash2 = prime - (c % prime);
        i = 0;
        while (arr[mod] != 0)
        {
            // h(k,i) = [H1(k) + i * H2(k)] mod N
            // where i is the order of the attempt
            // H1(k) = first hash function
            // H2(k) = second hash function
            // N is number of element
            mod = (hash1 + i * hash2) % numberLine;
            i++;
        }
        arr[mod] = c;
    }

    for (int i = 0; i < size_table; i++)
    {
        //cout << i << ": " << arr[i];
        if (arr[i] != 0)
            count += 1;
    }

    cout << count << endl;

    fin.close();
}

int main()
{
    string fileName = "names.txt";
    int size_table = findHashTableSize(fileName, 0.7);
    int numberOfLine = getNumberOfName(fileName);

    hashingByChain(size_table, fileName);
    hashingByLinearProbing(size_table, numberOfLine, fileName);
    hashingByQuadraticProbing(size_table, numberOfLine, fileName);
    hashingByDoubleHashing(size_table, numberOfLine, fileName);

    return 0;
}