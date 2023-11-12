#include <iostream>
#include <string>
#include <sstream>
#include <fstream>
#include <string.h>
#define MAX 100

using namespace std;

void inMatrix(int a[][MAX], int &m, int &n){
	cin >> m >> n;
	for (int i = 0; i < m; i++)
		for (int j = 0; j < n; j++)
			cin >> a[i][j];
}

void outMatrix(int a[][MAX], int &m, int &n){
	cin >> m >> n;
	for (int i = 0; i < m; i++){
		for (int j = 0; j < n; j++)
			cout <<  a[i][j] << "\n";
		cout << '\n';
	}	
}

// 1 1 1
// 2 2 2
// 3 3 3

//int countSubMatrix(int P[][], int p, int q, int m, int n, int K){
//	
//}
//
struct STUDENT{
	string name;
	int month1;
	int year1;
	int month2;
	int year2;
	int monthOff;
};

// 4 2020
// 3 2023

// 3 2020
// 4 2021


string findLongestWorkingDuration(string fileName){
	ifstream fr;
	fr.open(fileName);
	string endString = "END";
	if (fr.is_open() == false){
		cout << "Nah";
		return endString;
	}
	string s, strTmp;
	int count = 0;
	STUDENT listCanBo[101];
		
	while (fr.eof() == false){
		getline(fr, s);
		stringstream ss(s);
		getline(ss, strTmp, ',');
		listCanBo[count].name = strTmp;
		
		getline(ss, strTmp, '-');
		listCanBo[count].month1 = stoi(strTmp);
		
		getline(ss, strTmp, ',');
		listCanBo[count].year1 = stoi(strTmp);
		
		getline(ss, strTmp, '-');
		listCanBo[count].month2 = stoi(strTmp);
		
		getline(ss, strTmp, ',');
		listCanBo[count].year2 = stoi(strTmp);
		
		getline(ss, strTmp, '\n');
		listCanBo[count].monthOff = stoi(strTmp);
		
		count++;			
	}
	
	int maxMonth= 0;
	int month = 0;
	int idex = 0;
	for (int i = 0; i < count; i++){
		if (listCanBo[i].year2 > listCanBo[i].year1)
			if (listCanBo[i].month2 > listCanBo[i].month1)
				month = (listCanBo[i].year2 - listCanBo[i].year1)*12 + listCanBo[i].month2 - listCanBo[i].month1 - listCanBo[i].monthOff;
			else{
				month = 12 - listCanBo[i].month1 + listCanBo[i].month2 + (listCanBo[i].year2 - listCanBo[i].year1 - 1)*12 - listCanBo[i].monthOff;
			}
		else month = listCanBo[i].month2 - listCanBo[i].month1 - listCanBo[i].monthOff;
		if (month > maxMonth){
			maxMonth = month;
			idex = i;
		}
			
	}
	cout << listCanBo[idex].name;
	
}


int main(){
	const string FILE = "record.txt";
	findLongestWorkingDuration("record.txt");

	return 0;
}



