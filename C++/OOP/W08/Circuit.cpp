#include "Circuit.h"

Circuit::Circuit(){

}

Circuit::~Circuit(){

}

// ---------------------------------------------------------------------------

SingleCircuit::~SingleCircuit(){

}

float SingleCircuit::getResistance(){
    return Circuit::_R;
}

float SingleCircuit::getVoltage(){
    return Circuit::_U;
}

float SingleCircuit::getCurrent(){
    return Circuit::_I;
}

float SingleCircuit::calculateResistance(){
    return _U/_I;
}

