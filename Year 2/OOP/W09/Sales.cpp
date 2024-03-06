#include "Sales.h"
// -----------------------------------------------------------

void Product::setPrice(float p){ price = p; }

float Product::getPrice(){ return price; }

// -----------------------------------------------------------
void Order::input(std::vector<Product> l){
    for (int i = 0; i < l.size(); i++)
        list.push_back(l[i]);
}

void Order::setPaymentMethod(PaymentMethod* pm){
    p = pm;
}

float Order::totalPrice(){
    float sum = 0;
    for (Product i : list)
        sum+=i.getPrice();
    return sum;
}

void Order::showPaymentMethod(){
    std::cout << "The bill: " << std::fixed << std::setprecision(0) << totalPrice()
            << " Payment method: ";
     p->doPayment();
}