#include <iostream>
#include <cstring>
#include <string.h>


using namespace std;

struct Lap{
	
	string LapMake;
	string LapModel;
	int yearModel;
	double cost;
	int quantity;
};


void in1Lap(Lap a[], int i){
	
	cout << "Lap[" << i + 1 << "]\n";
	cout << "Input Make: ";
	cin >> a[i].LapMake;
	
	cout << "Input Model: ";
	cin >> a[i].LapModel;
	
	cout << "Input Year: ";
	cin >> a[i].yearModel;
	
	cout << "Input Cost: ";
	cin >> a[i].cost;
	
	cout << "Input Quantity: ";
	cin >> a[i].quantity;
	
}

void inLap(Lap a[], int& n){
	cout << "Storage size: ";
	cin >> n;
	for (int i = 0; i< n; i++){
		in1Lap(a, i);
	}
}



void outLap(Lap a[], int n){
	for (int i = 0; i < n; i++){
		cout << a[i].LapMake << "\t" << a[i].LapModel << "\t" << a[i].yearModel << "\t" << a[i].cost << "\t" << a[i].quantity << "\n";	
	}

}

void addLap(Lap a[], Lap b[], int& n){
	
	for (int i = 0; i < n; i++){
		b[i] = a[i];	
	}
	
	cout << "Input new Lap\n";
	in1Lap(b, n);
	
	n++;
	
	for (int i = 0; i < n; i++){
		a[i] = b[i];	
	}
}

int findModelIndex(Lap a[], int n, string& s){
//	cin.ignore();
	int idex;
//	cout << "Input Model need to buy: ";
	getline(cin, s); 
	for (int i = 0; i < n; i++){
		if (a[i].LapModel == s)
			return i;
		
	}
	
	return -1;
}

void sellLap(Lap a[], string s, int n){
	cout << "Which Lap you want? \n";
	int i = findModelIndex(a, n, s);
	if (i == -1){
		cout << "Not found";
		return;
	}
	else
		cout << "Sell available";
}



void removeLap(Lap a[], Lap b[], int& n, string x){
	for (int i = 0; i < n; i++){
		b[i] = a[i];	
	}
	
	cout << "Remove which Lap?\n";
	int pos = findModelIndex(a, n, x);
	
	for (int i = 0, j = 0; i < n; i++){
		if (i != pos)
		{
			a[i] = b[j];
			j++;
		}
		else{
			j++;
			a[i] = b[j];
			j++;
		}
	}
	n--;	
	
}


int main(){
	Lap LapArr[1000], LapArr2[1000];
	Lap a[100];
	int n = 2;
	string s;
	
	a[0].LapMake = "Ford";
	a[0].LapModel = "Taurus";
	a[0].yearModel = 1997;
	a[0].cost = 21,000;
	a[0].quantity = 10;
		
	a[1].LapMake = "Honda";
	a[1].LapModel = "Accord";
	a[1].yearModel = 1992;
	a[1].cost = 11,000;
	a[1].quantity = 5;
	
//	inLap(a, n);
	outLap(a, n);
	
	string x;
	addLap(a, LapArr2, n);
	outLap(a, n);
	cin.ignore();
	
	sellLap(a, s, n);
	cout << "\n";
	removeLap(a, LapArr2, n, x);	 
	outLap(a, n);
//	cin.ignore();
	
	

//	
//	cout << modelIndex(a, n, s);
	
	
	
	return 0;
}

