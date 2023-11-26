#ifndef FRACTION_H
#define FRACTION_H

#pragma once
#include <iostream>
#include <exception>
// using namespace std;

class DividedByZeroException : public std::exception{
public:
    const char* what() const throw() {
        return "Exception: Cannot divide by zero!";
    }
};

class Fraction{
private:
    int numerator;
    int denominator;
public:
    Fraction();
    Fraction(int n, int d);

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


