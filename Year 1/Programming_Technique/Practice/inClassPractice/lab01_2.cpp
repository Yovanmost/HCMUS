#include <iostream>
#include <cstring>
#include <fstream>
#include <math.h>


using namespace std;

void inArray(int a[], int n){
	for (int i = 0; i < n; i++){
		cin >> a[i];
	}
}

void outArray(int a[], int n){
	for (int i = 0; i < n; i++){
		cout << a[i] << " ";
	}
}

int isPrime(int n){
	if (n < 2)
		return 0;
	for(int i = 2; i < n; i++){
		if (n % i == 0)
			return 0;
	}
	return 1;
}

int countPrimeArray(int a[], int n){
	int count = 0;
	for (int i = 0; i < n; i++){
		if (isPrime(a[i]) == 1)
			count++;
	}
	return count;
}

int sumArray(int a[], int n){
	int sumArray = 0;
	for (int i = 0; i < n; i++)
		sumArray += a[i];
	return sumArray;
}

bool isIncreasing(int a[], int n){
	for (int i = 0; i < n - 1; i++){
		if( a[i] >= a[i+1])
			return false;
	}
	return true;
}

bool isDecreasing(int a[], int n){
	for (int i = 0; i < n - 1; i++){
		if( a[i] <= a[i+1])
			return false;
	}
	return true;
}

int sumOfDigit(int n){
	int sum = 0;
	int tmp = 0;
	while (n > 0){
		tmp = n % 10;
		sum += tmp;
		n /= 10;
	}
	
	return sum;
}

int main(){
	int n;
	cin >> n;
//	int a[1000];
//	inArray(a, n);
//	outArray(a, n);
//	cout << "\n" << sumArray(a, n);
	cout << '\n' << sumOfDigit(n);




	return 0;
}

