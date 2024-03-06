#pragma once
#include "hash.h"

int lineaSearch(Node table[], int tableSize, string key){
    for (int i = 0; i < tableSize; i++)
        if (table[i].name == key)
            return i;
    return -1;
}

int binarySearch(Node table[], int tableSize, string key){
    int left = 0, right = tableSize;
    while (left <= right){
        int mid = (left + right)/2;
        if (table[mid].name == key)
            return mid;
        if (table[mid].name < key)
            left = mid+1;
        else right = mid-1;
    }
    return -1;
}