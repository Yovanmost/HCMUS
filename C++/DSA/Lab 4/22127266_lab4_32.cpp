#include <iostream>
#define SIZE 10

using namespace std;

int queue[SIZE];
int rear = -1;

bool isFull(){
    return rear == SIZE - 1;
}

bool isEmpty(){
    return rear == -1;
}

void enqueue(int k){
    if (!isFull())
        queue[++rear] = k;
    else return;
}

void dequeue(){
    if (!isEmpty()){
        for (int i = 0; i < rear; i++)
            queue[i] = queue[i+1];
        rear--;
    }
    else return;
}

void printQueue(){
    if (!isEmpty())
    for (int i = 0; i <= rear; i++)
        cout << queue[i] << ' ';
    else{
        cout << "Empty\n";
        return;
    }
    if (isFull())
        cout << "Full";    
    cout << '\n';
}

int main(){
    char k;
    do {
        // system("cls");
        cout << "Queue (10 integers):\n";
        printQueue();
        cout << "0 to end, 1 for enqueue, 2 for dequeue\n";
        cout << "Enter: ";
        cin >> k;
        switch (k)
        {
        case '1':
            int c;
            cout << "Enqueue? ";
            cin >> c;
            enqueue(c);
            break;
        case '2':
            dequeue();
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