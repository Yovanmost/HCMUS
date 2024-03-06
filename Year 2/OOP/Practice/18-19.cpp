#include <iostream>
#include <string>

using namespace std;

class SC{
public:
    string name;
    SC(){}
    SC(string n) : name(n){}
    ~SC(){}
    void insert(){
        cin >> name;
    }
    
    virtual int countFlightTime() = 0;
};

class UC : public SC{
public:
    int flightTime;
    UC(){}
    UC(string name, int ft) : SC(name), flightTime(ft){}
    

    int countFlightTime(){
        return flightTime;
    }

    void printInfo(){
        cout << SC::name << ' ' << flightTime;
    }

    void insert(){
        SC::insert();
        cin >> flightTime;
    }
};



int main(){
    UC test("hel", 12);
    test.printInfo();
    test.insert();
    test.printInfo();

}