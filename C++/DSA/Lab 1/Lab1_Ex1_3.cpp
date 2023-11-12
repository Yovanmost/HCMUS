#include <iostream>
#include <string>
#include <fstream>

using namespace std;

struct Day{
    float temperature[12];
    float avgTmp = 0;
    float maxTemp = 0;
    float minTemp = 0;
};

float avgTemp(Day a){
    float temp = 0;
    for (int i = 0; i < 12; i++)
        temp += a.temperature[i];
    temp = temp/12;
    return temp;
}

void findMaxMin(Day &a){
    float max = a.temperature[0], min = a.temperature[0];
    for (int i = 1; i < 12; i++){
        if (max < a.temperature[i])
            max = a.temperature[i];
        if (min > a.temperature[i])
            min = a.temperature[i];
    }
    a.maxTemp = max;
    a.minTemp = min;
}

void readAndWriteFile(ifstream &fr){
    float tmp;
    int numberOfDays;
    fr >> numberOfDays;
    Day listOfDays[numberOfDays];
    int cnt = 0;
    // int i = 0;
    ofstream fw;
    fw.open("output1.3.txt");

    for (int i = 0; i < numberOfDays; i++){
        for (int j = 0; j < 12; j++){
            fr >> tmp;
            listOfDays[i].temperature[j] = tmp;
        }
        listOfDays[i].avgTmp = avgTemp(listOfDays[i]);
        findMaxMin(listOfDays[i]);
        fw << listOfDays[i].avgTmp << ' ' << listOfDays[i].maxTemp << ' ' << listOfDays[i].minTemp << '\n';
    }
    fw.close();
}   



int main(){
    ifstream fr;
    fr.open("input1.3.txt");
    readAndWriteFile(fr);
    fr.close();

    return 0;
}