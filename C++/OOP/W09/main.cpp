#include <iostream>
#include "Dragon.h"
#include "Sales.h"
#include "Dragon.cpp"
#include "Sales.cpp"


using namespace std;

void demo1(){
    Order od;
    Product a, b, c, d;
    a.setPrice(500000);
    b.setPrice(60000);
    c.setPrice(1400000);
    d.setPrice(5000);

    vector<Product> list;
    list.push_back(a);
    list.push_back(b);
    list.push_back(c);
    list.push_back(d);

    od.input(list);
    cout << "Change payment method to MoMo\n";
    od.setPaymentMethod(new MoMo);
    od.showPaymentMethod();
    cout << "\nChange payment method to ATM\n";
    od.setPaymentMethod(new ATM);
    od.showPaymentMethod();
    
}

void demo2(){
    cout << "Dragon: Alpha, Level: 73, Mode: Attack\n" 
        << "Atk: 200, Def: 50, Hp: 1300\n";
    Dragon* drgA = new Dragon(new AttackState);
    drgA->setValue("Alpha", 73, 200, 50, 1300);
    drgA->doAttack();
    drgA->doMove();
    cout << "Alpha's damage: " << drgA->doCalculatePower() << '\n';

    cout << '\n';

    cout << "Dragon: Beta, Level: 72, Mode: Defend\n" 
        << "Atk: 50, Def: 150, Hp: 1200\n";
    Dragon* drgB = new Dragon(new DefendState);
    drgB->setValue("Beta", 72, 50, 150, 1200);
    drgB->doAttack();
    drgB->doMove();
    cout << "Beta's damage: " << drgB->doCalculatePower() << '\n';

    cout << '\n';

    cout << "Dragon: Omega, Level: 74, Mode: Normal\n" 
        << "Atk: 120, Def: 110, Hp: 1400\n";
    Dragon* drgO = new Dragon(new NormalState);
    drgO->setValue("Omega", 75, 120, 110, 1400);
    drgO->doAttack();
    drgO->doMove();
    cout << "Omega's damage: " << drgO->doCalculatePower() << '\n';

    delete drgA;
    delete drgB;
    delete drgO;
}

int main(){
    demo1();
    // demo2();

    return 0;
}