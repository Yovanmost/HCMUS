#include <iostream>

using namespace std;

struct Time{
    int start;
    int process;
    int end;
    int wait;
};

int countLoss(Time customer[], int n){
    int count = 0;
    customer[0].wait = 0;
    customer[0].end = customer[0].start + customer[0].process;
    for (int i = 1; i < n; i++){
        if (customer[i].start >= customer[i-1].end){
            customer[i].wait = 0;
            customer[i].end = customer[i].start + customer[i].process;
        }
        else {
            customer[i].end = customer[i-1].end + customer[i].process;
            customer[i].wait = customer[i-1].end - customer[i].start;
            if (customer[i].wait > 10)
                count++;
        }       
    }
    return count;
}

/*
    Idea: total time = customer waiting time + customer processing time
    (n > 0)
    customer(n) waiting time = customer(n-1) finished time - customer(n) start time
    customer(n) end time = customer(n-1) finished time + customer(n) process time
    ~W: waiting period
    W-: processing period
    S: start (arrival)
    E: end
        (S)  (E)
    1. 0-5----14
    2.     7~~W----19
    3.        14~~~W-----24
    4.                     30-------45
    5.                        32~~~~W-----50
    6.                          34~~~~~~~~W------55

    Corner case: customer(n) start time >= customer(n-1) end time (customer 3 and 4 above)
        => customer(n) doesn't need to wait (customer[n].wait = 0)
*/

int main(){
    int n = 6;
    Time customer[n] = {{5, 9, 0 ,0}, {7, 5, 0, 0}, 
                        {14, 5, 0, 0}, {30, 15, 0, 0}, 
                        {32, 5, 0, 0}, {34, 5, 0, 0}};
    cout << countLoss(customer, n);
    return 0;
}