#ifndef DRAGON_H
#define DRAGON_H

#pragma once
#include <string>

// https://refactoring.guru/design-patterns/state/cpp/example

class State;

class Dragon : public State{
private:
    std::string name;
    int lv;

    float atk;
    float def;
    float hp;
    State* currState;
public:
    Dragon();
    Dragon(State* init) : currState(init){}
    ~Dragon();

    void setState(State* newState);
};

class State{
    virtual float attackPower() = 0;
    virtual void attackAction() = 0;
    virtual void movementAction() = 0;
};

class normalState: public State{
public:


};



#endif