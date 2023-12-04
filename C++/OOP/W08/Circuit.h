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

    virtual void addCircuit(Circuit* c){}
    virtual void removeCircuit(Circuit* c){}

    virtual ~Circuit(){}
};

// leaf
class SingleCircuit : public Circuit{
public:
    SingleCircuit();
    SingleCircuit(float u, float i);
    ~SingleCircuit();

    float getResistance();
};

class SeriesCircuit : public Circuit{
public:
    std::vector<Circuit*> series;

    float getResistance();
    void addCircuit(Circuit* c);
    void removeCircuit(Circuit* c);
};

class ParallelCircuit : public Circuit{
public:
    std::vector<Circuit*> parallelList;

    float getResistance();
    void addCircuit(Circuit* c);
    void removeCircuit(Circuit* c);
};

#endif