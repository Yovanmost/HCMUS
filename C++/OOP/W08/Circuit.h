#ifndef CIRCUIT_H
#define CIRCUIT_H

#pragma once
#include <vector>

class Circuit{
protected:
    float _R; // Resistance(R)
    float _U; // Voltage(U)
    float _I; // Current(I)
public:
    virtual float getResistance() = 0;
    virtual float getVoltage() = 0;
    virtual float getCurrent() = 0;
    virtual float calculateResistance() = 0;

    virtual void addCircuit(Circuit* c){}
    virtual void removeCircuit(Circuit* c){}

    virtual ~Circuit(){}
};

// leaf
class SingleCircuit : public Circuit{
public:
    ~SingleCircuit();

    float getResistance();
    float getVoltage();
    float getCurrent();
    float calculateResistance();
};

class SeriesCircuit : public Circuit{
public:
    std::vector<Circuit*> series;

    float getResistance();
    float getVoltage();
    float getCurrent();
    float calculateResistance();
};

#endif