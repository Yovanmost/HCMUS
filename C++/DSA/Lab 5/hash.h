#pragma once
#include <iostream>
#include <string>
#define us unsigned

using namespace std;

unsigned long long djb2_hash(char* str){
    unsigned long long hash = 5381;
    int c;

    while (c = *str++)
        hash = ((hash << 5) + hash) + c; /*hash * 33 + c*/
    return hash;
}

unsigned long long djb2_hash(string str){
    unsigned long long hash = 5381;
    int i = 0;

    while (i < str.size())
        hash = ((hash << 5) + hash) + (int)str[i++]; /*hash * 33 + c*/
        
    return hash;
}