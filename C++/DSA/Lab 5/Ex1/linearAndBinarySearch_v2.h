#pragma once
#include "hashV2.h"

int lineaSearch(string table[], int tableSize, string key){
    for (int i = 0; i < tableSize; i++)
        if (table[i] == key)
            return i;
    return -1;
}

int binarySearch(string table[], int tableSize, string key){
    int left = 0, right = tableSize;
    while (left <= right){
        int mid = (left + right)/2;
        if (table[mid] == key)
            return mid;
        if (table[mid] < key)
            left = mid+1;
        else right = mid-1;
    }
    return -1;
}