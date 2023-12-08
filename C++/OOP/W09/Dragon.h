#ifndef DRAGON_H
#define DRAGON_H

#pragma once
#include <string>
#include <iostream>

// https://refactoring.guru/design-patterns/state/cpp/example

class Dragon;

class State{
protected:
    Dragon* drg;    
public:
    virtual ~State();

    void setDragon(Dragon* d);

    virtual float attackPower() = 0;
    virtual void attackAction() = 0;
    virtual void movementAction() = 0;
};

class Dragon{
private:
    std::string name;
    int lv;

    float atk;
    float def;
    float hp;

    State* currState;
public:
    Dragon();
    Dragon(State* init);
    ~Dragon();

    void setValue(std::string name, int lv, float atk, float def, float hp);
    void setState(State* newState);

    std::string getName();
    int getLv();
    float getAtk();
    float getDef();
    float getHp();

    float doCalculatePower();
    void doAttack();
    void doMove();


};

class NormalState : public State{
public:
    float attackPower();
    void attackAction();
    void movementAction();
};

class AttackState : public State{
public:
    float attackPower();
    void attackAction();
    void movementAction();
};

class DefendState : public State{
public:
    float attackPower();
    void attackAction();
    void movementAction();
};

#endif