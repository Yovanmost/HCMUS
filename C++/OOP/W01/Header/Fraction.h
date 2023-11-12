#ifndef FRACTION_H
#define FRACTION_H

#pragma once
#include <iostream>
using namespace std;

class Fraction{
private:
    int numerator;
    int denominator;
public:
    Fraction();

    void setValue(int, int);

    void setNumerator(int);

    void setDenominator(int);

    int getNumerator();

    int getDenominator();

    void printWithADash();

    void printWithoutADash();

    void input();

    Fraction add(Fraction);

    Fraction subtract(Fraction);

    Fraction multiply(Fraction);

    Fraction divide(Fraction);

};

#endif


