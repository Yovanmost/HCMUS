#include <iostream>

using namespace std;

struct Date{
    int day;
    int month;
    int year;
};

int leapYear(int n){
    if (n % 400 == 0 || (n % 4 == 0 && n % 100 != 0) )
        return 1;
    return 0;
}

int endOfMonth(Date n){
    if (n.month == 1 || n.month == 3 || n.month == 5 || n.month == 7 || n.month == 8 || n.month == 10 || n.month == 12)
        return 31;
    if (n.month == 4 || n.month == 6 || n.month == 9 || n.month == 11)
        return 30;
    if (n.month == 2 && leapYear(n.year) == 1)
        return 29;
    return 28;
}

Date Tomorrow(Date d){
    if (d.day == endOfMonth(d)){
        d.day = 1;
        if (d.month == 12){
            d.year++;
            d.month = 1;
        }
        else d.month++;
    }
    else{
        d.day++;
    }
    cout << "\n" << d.day << "/" << d.month << "/" << d.year;
    return d;
}

Date Yesterday(Date d){
    if (d.day == 1){
        if (d.month == 1){
            d.day = 31;
            d.month = 12;
            d.year--;
        }
        else{
            d.month--;
            d.day = endOfMonth(d);
        }
    }else{
        d.day--;
    }
    cout << "\n" << d.day << "/" << d.month << "/" << d.year;
    return d;
}

int compareDate(Date d1, Date d2){
    if (d1.year > d2.year)
        return 1;
    if (d1.year < d2.year)
        return -1;

    if (d1.month > d2.month)
        return 1;
    if (d1.month < d2.month)
        return -1;

    if (d1.day > d2.day)
        return 1;
    if (d1.day < d2.day)
        return -1;
}

int Different(Date d1, Date d2){
    int count = 0;
    while (true){
        if (d1.day == d2.day && d1.month == d2.month && d1.year == d2.year)
            break;
        if (d1.day == endOfMonth(d1)){
            d1.day = 1;
            if (d1.month == 12){
                d1.year++;
                d1.month = 1;
            }
            else    
                d1.month++;
        }
        else{
            d1.day++;
        }
        count++;  
    }
    return count; 
}

int main(){
    Date a, b;
    cin >> a.day >> a.month >> a.year;
    cout << a.day << "/" << a.month << "/" << a.year << "\n";

    cin >> b.day >> b.month >> b.year;
    cout << b.day << "/" << b.month << "/" << b.year << "\n";

    Tomorrow(b);
    Yesterday(a);
    cout << "\n" << Different(a, b);

    return 0;
}