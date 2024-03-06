#ifndef FRACTION_V2_H
#define FRACTION_V2_H

#pragma once
#include <iostream>

class Fraction{
private:
    int numerator;
    int denominator;
public:
    Fraction();
    Fraction(int, int);
    ~Fraction();

    void setValue(int, int);
    void setNumerator(int);
    void setDenominator(int);
    int getNumerator();
    int getDenominator();
    void printWithADash();
    void printWithoutADash();
    void input();
    float getValue();

    Fraction add(const Fraction &p);
    Fraction subtract(const Fraction &p);
    Fraction multiply(const Fraction &p);
    Fraction divide(const Fraction &p);

    Fraction& operator=(const Fraction &p);
    Fraction operator+(const Fraction &p);
    Fraction operator-(const Fraction &p);
    Fraction operator*(const Fraction &p);
    Fraction operator/(const Fraction &p);

    bool operator==(const Fraction &p) const;
    bool operator!=(const Fraction &p) const;
    bool operator>(const Fraction &p) const;
    bool operator<(const Fraction &p) const;
    bool operator>=(const Fraction &p) const;
    bool operator<=(const Fraction &p) const;

    Fraction& operator+=(const Fraction &p);
    Fraction& operator-=(const Fraction &p);
    Fraction& operator*=(const Fraction &p);
    Fraction& operator/=(const Fraction &p);

    // friend istream& operator>>(istream &is, Fraction &p);
    friend std::ostream& operator<<(std::ostream &os,const Fraction &p);

    friend Fraction operator+(int t, const Fraction &p);
    friend Fraction operator+(const Fraction &p, int t);
    friend Fraction operator-(int t, const Fraction &p);
    friend Fraction operator-(const Fraction &p, int t);
    friend Fraction operator*(int t, const Fraction &p);
    friend Fraction operator*(const Fraction &p, int t);
    // friend Fraction operator/(int t, const Fraction &p);
    // friend Fraction operator/(const Fraction &p, int t);

    Fraction operator++(int);
    Fraction& operator++();
    Fraction operator--(int);
    Fraction& operator--();

    operator float() const{
        return (float)numerator / denominator;
    }

    operator int() const{
        return numerator / denominator;
    }
};

#endif
