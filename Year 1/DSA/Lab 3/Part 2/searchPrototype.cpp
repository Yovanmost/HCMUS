#pragma once
#include <iostream>
#include <string>

using namespace std;

int linearSearch(string s[], int n, string k){
    for (int i = 0; i < n; i++)
        if (s[i] == k)
            return i;
    return -1;
}

int binarySearch(string s[], int n, string k){
    int left = 0, right = n-1;
    while (left <= right){
        int mid = (left + right)/2;
        if (s[mid] == k)
            return mid;
        if (s[mid] < k)
            left = mid+1;
        else 
            right = mid - 1;
    }
    return -1;
}