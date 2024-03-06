#ifndef SALES_H
#define SALES_H

#pragma once
#include <iostream>
#include <string>
#include <vector>
#include <iomanip>


class Product{
private:
    std::string ID;
    std::string name;
    float price;
    float inStock;
public:
    void setPrice(float p);
    float getPrice();
};

class PaymentMethod;

class Order{
private:
    std::string ID;
    std::string name;
    std::string phoneNumber;
    std::string address;
    std::vector<Product> list;
    PaymentMethod* p;
public:
    void input(std::vector<Product> l);
    void setPaymentMethod(PaymentMethod* pm);
    float totalPrice();
    void showPaymentMethod();
};

// Strategy
class PaymentMethod{
public:
    virtual ~PaymentMethod() = default;
    virtual void doPayment() = 0;
};

class ATM : public PaymentMethod{
public:
    void doPayment(){
        std::cout << "ATM";
    }
};

class ZaloPay : public PaymentMethod{
public:
    void doPayment()    {
        std::cout << "Zalo Pay";
    }
};

class MoMo : public PaymentMethod{
public:
    void doPayment(){
        std::cout << "MoMo";
    }
};


#endif