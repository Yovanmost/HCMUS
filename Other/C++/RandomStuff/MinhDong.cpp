#include <iostream>
using namespace std ;
int main()
{
	char name[256];
	char MSSV[20];
	char lop[20];
	cout << "MSSV: ";
	cin.getline(MSSV,20);
	
	cout << "Name: ";
	cin.getline(name, 256);
	
	cout << "Lop: ";
	cin.getline(lop, 20);
	
	cout << "Name: " << name << "\n";
	cout << "MSSV: " << MSSV << "\n";
	cout << "Class: "  << lop << "\n";
	return 0;	
}

