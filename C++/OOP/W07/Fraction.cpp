#include "Fraction.h"

Fraction::Fraction(){
    
}

Fraction::Fraction(int n, int d) : numerator(n), denominator(d){

}

void Fraction::setValue(int numerator, int denominator){
        this->numerator = numerator;
        this->denominator = denominator;
        if (denominator == 0)
            throw DividedByZeroException();
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
    std::cout << this->numerator << "/" << this->denominator << '\n';
}

void Fraction::printWithoutADash(){
    float res = (float)this->numerator / this->denominator;
    std::cout << res << '\n';
}

void Fraction::input(){
    std::cout << "Numerator: ";
    std::cin >> numerator;
AGAIN:
    std::cout << "Denominator: ";
    std::cin >> denominator;
    if (denominator == 0){
        std::cout << "Nah\n";
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