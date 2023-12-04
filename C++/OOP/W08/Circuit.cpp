#include "Circuit.h"
// ---------------------------------------------------------------------------

SingleCircuit::SingleCircuit(){

}

SingleCircuit::SingleCircuit(float u, float i){
    Circuit::_U = u;
    Circuit::_I = i;
}

SingleCircuit::~SingleCircuit(){

}

float SingleCircuit::getResistance(){
    Circuit::_R = Circuit::_U/Circuit::_I;
    return Circuit::_R;
}

// -----------------------------------------------------------

float SeriesCircuit::getResistance(){
    float sum = 0;
    for (int i = 0; i < series.size(); i++)
        sum += series[i]->getResistance();
    return sum;
}

void SeriesCircuit::addCircuit(Circuit* c){
    series.push_back(c);
}

void SeriesCircuit::removeCircuit(Circuit* c){
    for (auto i = 0; i < series.size(); i++)
        if (series[i] == c)
            series.erase(series.begin() + i);
}

// -----------------------------------------------------------

float ParallelCircuit::getResistance(){
    float sum = 0, mult = 1;
    for (int i = 0; i < parallelList.size(); i++){
        sum += parallelList[i]->getResistance();
        mult *= parallelList[i]->getResistance();
    }
    // std::cout << mult << "|" << sum << "|";
    return mult/sum;
}

void ParallelCircuit::addCircuit(Circuit* c){
    parallelList.push_back(c);
}

void ParallelCircuit::removeCircuit(Circuit* c){
    for (auto i = 0; i < parallelList.size(); i++)
        if (parallelList[i] == c)
            parallelList.erase(parallelList.begin() + i);
}

