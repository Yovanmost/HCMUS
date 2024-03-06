#include <iostream>

using namespace std;

const int size = 10;
int rear = -1;
// int front = 0;
int queue[size];

bool isEmpty(){
    if (rear == -1)
        return true;
    return false;
}

bool isFull(){
    if (rear == size - 1)
        return true;
    return false;
}

void enqueue(int n){
    if (!isFull())
    queue[++rear] = n;
}

void dequeue(){
    if (!isEmpty()){
        for (int i = 1; i <= rear; i++)
        queue[i-1] = queue[i];
        rear--;
    }
    
}

void printQueue(){
    if (!isEmpty())
        for (int i = 0; i <= rear; i++)
            cout << queue[i] << " ";
    else if (isEmpty())
        cout << "Empty";
    if (isFull())
        cout << "\nFull";
    cout << '\n';
}

int main(){
     char k;
    do {
        system("cls");
        cout << "Queue (10 integers):\n";
        printQueue();
        cout << "0 to end, 1 for enqueue, 2 for dequeue\n";
        cout << "Enter: ";
        cin >> k;
        switch (k)
        {
        case '1':
            int n;
            cout << "Enqueue? ";
            cin >> n;
            enqueue(n);
            break;
        case '2':
            dequeue();
            break;
        case '3':
            printQueue();
            break;  
        case '0':  
            return 0;
        default:
            cout << "Enter again\n";
            break;
        }

        
    } while (k != '0');

    return 0;
}