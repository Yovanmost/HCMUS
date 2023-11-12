#include <iostream>

using namespace std;

struct TIME{
    short hour;
    short minute;
    short second;
};

int timeToSecond(TIME a){
    return a.hour * 60 * 60 + a.minute * 60 + a.second;
}

int validTime(TIME a){
    if (a.hour < 0 || a.minute < 0 || a.second < 0)
        return -1;
    if (a.hour > 23)
        return -1;
    if (a.minute > 59)
        return -1;
    if (a.second > 59)
        return -1;
    return 0;
}

int secondPass(TIME a){
    int n = timeToSecond(a);
    int min = n / 60;
    int sec = n % 60;
    cout << "Time passed: " << min << " min(s) " << sec << " sec(s)";
}

int timeEarlier(TIME a, TIME b){
    int timeA = timeToSecond(a);
    int timeB = timeToSecond(b);

    if (timeA > timeB)  
        cout << "B is earlier";
    else if (timeB > timeA)
        cout << "A is earlier";
    else cout << "Same";
}

int main(){
    TIME a;
    cin >> a.hour >> a.minute >> a.second;
    secondPass(a);

    return 0;
}