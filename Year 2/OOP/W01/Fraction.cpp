#include "Fraction.h"

Fraction::Fraction(){
    
}

void Fraction::setValue(int numerator, int denominator){
        this->numerator = numerator;
        this->denominator = denominator;            
}

void Fraction::setNumerator(int numerator){
        this->numerator = numerator;
    }

void Fraction::setDenominator(int denominator){
    this->denominator = denominator;
}

int Fraction::getNumerator(){
    return numerator;
}

int Fraction::getDenominator(){
    return denominator;
}

void Fraction::printWithADash(){
    cout << this->numerator << "/" << this->denominator << '\n';
}

void Fraction::printWithoutADash(){
    float res = (float)this->numerator / this->denominator;
    cout << res << '\n';
}

void Fraction::input(){
    cout << "Numerator: ";
    cin >> numerator;
AGAIN:
    cout << "Denominator: ";
    cin >> denominator;
    if (denominator == 0){
        cout << "Nah\n";
        goto AGAIN;
    }   
        
}

Fraction Fraction::add(Fraction other){
    Fraction res;
    res.numerator = this->numerator * other.denominator + other.numerator * this->denominator;
    res.denominator = this->denominator * other.denominator;
    return res;
}

Fraction Fraction::subtract(Fraction other){
    Fraction res;
    res.numerator = this->numerator * other.denominator - other.numerator * this->denominator;
    res.denominator = this->denominator * other.denominator;
    return res;
}

Fraction Fraction::multiply(Fraction other){
    Fraction res;
    res.numerator = this->numerator * other.numerator;
    res.denominator = this->denominator * other.denominator;
    return res;
}

Fraction Fraction::divide(Fraction other){
    Fraction res;
    res.numerator = this->numerator * other.denominator;
    res.denominator = this->denominator * other.numerator;
    return res;
}