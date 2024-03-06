#include <iostream>
#include <string.h>
#include <math.h>

using namespace std;

// turn string of number into an array
// failed because cannot add negative numbers into the array
// DO NOT USE IF THERE A NEGATIVE NUMBER
int stringToNumber(char* str, int a[]){
    int n = strlen(str);
    int i, j = 0;

    for (i = 0; str[i] != '\0'; i++){
        if (str[i] == ' '){
            j++;
            continue;
        }
        else if (str[i] == '-'){
            a[j] = -1;
        }   
        else{
            // subtract str[i] by 48 to convert it to int
            // Generate number by multiplying 10 and adding
            // (int)(str[i])
            a[j] = a[j] * 10 + (str[i] - 48);
        }
    }

    return j;
}


// create battery life and km the car has traveled
int battery = 100;
int travel = 0;


// calculate how much battery used for going up
// Di len mat het bao nhieu pin
float useGoUp(int n){
    // so km co the di voi so pin hien tai
    float kmCanGo = battery * 2.15;
    
    // so km con lai
    float kmLeft = kmCanGo - n;

    // neu so km con lai la so am thi tra ve so km max co the di
    if (kmLeft < 0){
        travel += kmCanGo;
        return battery * 2.15;
    }
    
    // truong hop con du pin
    travel += n;
    // cap nhat so pin con lai
    battery = kmLeft / 2.15;
}


// sac pin di dung yen 
void chargeStay(int n){
    battery += 25;
}


// moi 10km di xuong thi sac 10%
void rechargeGoDown(int n){
    while (n != 0){
        n /= 10;
        battery += 10;
        // truong hop pin qua 100
        if (battery > 100)
        battery = 100;
    }
}

int main(){
    
    // dieu chinh input day de test
    int test[100] = {100, 0, 500};

    for (int i = 0; i < 3; i++){
        if (test[i] == 0)
            chargeStay(test[i]);
        else if (test[i] < 0)
            rechargeGoDown(test[i]);
        else useGoUp(test[i]);
    }

    // xuat ra km da di
    cout << travel;

    return 0;
}