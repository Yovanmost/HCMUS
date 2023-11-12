#include "Fraction.h"

Fraction::Fraction() : numerator(0), denominator(1) {
    
}

Fraction::~Fraction(){

}


// --------------------------------------------------------------------------------------------------


Fraction::Fraction(int numerator, int denominator) : numerator(numerator), denominator(denominator){
    if (this->denominator == 0) {
            std::cerr << "Error: Denominator cannot be zero." << std::endl;
            exit(1);
        }
}


// --------------------------------------------------------------------------------------------------


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

float Fraction::getValue(){
    return numerator / denominator;
}


// --------------------------------------------------------------------------------------------------


Fraction Fraction::add(const Fraction &p){
    return Fraction(this->numerator * p.denominator + p.numerator * this->denominator,
            this->denominator * p.denominator);
}

Fraction Fraction::subtract(const Fraction &p){
    return Fraction(this->numerator * p.denominator - p.numerator * this->denominator,
            this->denominator * p.denominator);
}

Fraction Fraction::multiply(const Fraction &p){
    return Fraction(this->numerator * p.numerator, 
            this->denominator * p.denominator);
}

Fraction Fraction::divide(const Fraction &p){
    return Fraction(this->numerator * p.denominator, 
            this->denominator * p.numerator);
}


// --------------------------------------------------------------------------------------------------


Fraction& Fraction::operator=(const Fraction &p){
    if (this == &p)
        return *this;
    this->numerator = p.numerator;
    this->denominator = p.denominator;
    return *this;
}

Fraction Fraction::operator+(const Fraction &p){
    return add(p);
}

// Fraction Fraction::operator+(const Fraction &p){
//     return Fraction(this->numerator * p.denominator + p.numerator * this->denominator,
//      this->denominator * p.denominator);
// }

Fraction Fraction::operator-(const Fraction &p){
    return subtract(p);
}

Fraction Fraction::operator*(const Fraction &p){
    return multiply(p);
}

Fraction Fraction::operator/(const Fraction &p){
    if (p.numerator == 0){
        std::cerr << "Error: Cannot divide by zero!\n";
        return *this;
    }
    return divide(p);
}

// --------------------------------------------------------------------------------------------------

bool Fraction::operator==(const Fraction &p) const{
    return !((float)*this - (float)p);
}

bool Fraction::operator!=(const Fraction &p) const{
    return (float)*this - (float)p;
}

bool Fraction::operator<(const Fraction &p) const{
    return (float)*this - (float)p < 0;
}

bool Fraction::operator>(const Fraction &p) const{
    return (float)*this - (float)p > 0;
}

bool Fraction::operator<=(const Fraction &p) const{
    return (*this < p) || (*this == p);
}

bool Fraction::operator>=(const Fraction &p) const{
    return (*this > p) || (*this == p);
}


// --------------------------------------------------------------------------------------------------


Fraction& Fraction::operator+=(const Fraction &p){
    numerator = numerator * p.denominator + p.numerator * denominator;
    denominator = denominator * p.denominator;
    return *this;
}

Fraction& Fraction::operator-=(const Fraction &p){
    numerator = numerator * p.denominator - p.numerator * denominator;
    denominator = denominator * p.denominator;
    return *this;
}

Fraction& Fraction::operator*=(const Fraction &p){
    numerator = numerator * p.numerator;
    denominator = denominator * p.denominator;
    return *this;
}

Fraction& Fraction::operator/=(const Fraction &p){
    if (p.numerator == 0){
        std::cerr << "Error: Cannot divide by zero!\n";
        return *this;
    }

    numerator = numerator * p.denominator;
    denominator = denominator * p.numerator;
    return *this;
}


// --------------------------------------------------------------------------------------------------

// istream& operator>>(istream &is, Fraction &p){}

std::ostream& operator<<(std::ostream &os, const Fraction &p){
    os << p.numerator << "/" << p.denominator;
    return os;
}


// --------------------------------------------------------------------------------------------------


Fraction operator+(int t, const Fraction &p){
    return Fraction(p.numerator + t * p.denominator, p.denominator);
}

Fraction operator+(const Fraction &p, int t){
    return Fraction(p.numerator + t * p.denominator, p.denominator);
}

Fraction operator-(int t, const Fraction &p){
    return Fraction(p.numerator - t * p.denominator, p.denominator);
}

Fraction operator-(const Fraction &p, int t){
    return Fraction(p.numerator - t * p.denominator, p.denominator);
}

Fraction operator*(int t, const Fraction &p){
    return Fraction(p.numerator * t, p.denominator);
}

Fraction operator*(const Fraction &p, int t){
    return Fraction(p.numerator * t, p.denominator);
}




// --------------------------------------------------------------------------------------------------


Fraction Fraction::operator++(int t){
    Fraction tmp(*this);
    numerator = numerator + denominator; // this+1
    return tmp; // return original before +1
}

Fraction& Fraction::operator++(){
    numerator = numerator + denominator; // this+1
    return *this;
}

Fraction Fraction::operator--(int t){
    Fraction tmp(*this);
    numerator = numerator - denominator; // this+1
    return tmp; // return original before +1
}

Fraction& Fraction::operator--(){
    numerator = numerator - denominator; // this+1
    return *this;
}

