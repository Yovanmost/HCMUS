#include "Dragon.h"

Dragon::Dragon(){

}

Dragon::Dragon(State* init): currState(nullptr){
    this->setState(init);
}

Dragon::~Dragon(){
    delete currState;
}

void Dragon::setValue(std::string name, int lv, float atk, float def, float hp){
    this->name = name;
    this->lv = lv;
    this->atk = atk;
    this->def = def;
    this->hp = hp;
}

void Dragon::setState(State* newState){
    if (this->currState != nullptr)
        delete this->currState;

    this->currState = newState;
    this->currState->setDragon(this);
}

float Dragon::doCalculatePower(){
    return this->currState->attackPower();
}

void Dragon::doAttack(){
    this->currState->attackAction();
}

void Dragon::doMove(){
    this->currState->movementAction();
}

std::string Dragon::getName(){ return name; }

int Dragon::getLv(){ return lv; }

float Dragon::getAtk(){ return atk; }

float Dragon::getDef(){ return def; }

float Dragon::getHp(){ return hp; }

// -------------------------------------------------------------------------
// BASE STATE
State::~State(){

}

void State::setDragon(Dragon* d){
    this->drg = d;
}

// -------------------------------------------------------------------------
// NORMAL STATE

float NormalState::attackPower(){
    return (drg->getAtk() + drg->getDef() + drg->getHp()) * drg->getLv();
}

void NormalState::attackAction(){
    std::cout << "Dragon " << drg->getName() 
            << " breathes yellow fire.\n";
}

void NormalState::movementAction(){
    std::cout << "Dragon " << drg->getName() 
            << " moves normally.\n";
}

// -------------------------------------------------------------------------
// ATTACK STATE

float AttackState::attackPower(){
    return (2 * drg->getAtk() + drg->getDef() + drg->getHp()) * drg->getLv();
}

void AttackState::attackAction(){
    std::cout << "Dragon " << drg->getName() 
            << " breathes red fire.\n";
}

void AttackState::movementAction(){
    std::cout << "Dragon " << drg->getName() 
            << " moves quickly.\n";
}

// -------------------------------------------------------------------------
// DEFEND STATE

float DefendState::attackPower(){
    return (drg->getAtk() + 1.5 * (drg->getDef() +  drg->getHp())) * drg->getLv();
}

void DefendState::attackAction(){
    std::cout << "Dragon " << drg->getName() 
            << " breathes green fire.\n";
}

void DefendState::movementAction(){
    std::cout << "Dragon " << drg->getName() 
            << " moves slowly.\n";
}