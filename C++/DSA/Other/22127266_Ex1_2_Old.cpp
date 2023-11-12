#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>

using namespace std;

struct PhanSo{
	int tu;
	int mau;
};

int uocChungLonNhat(int a, int b){
	int uoc;
	for (int i = 1; i <= a; i++){
		if (a % i == 0 && b % i == 0)
			uoc = i;
	}
	return uoc;
}

bool findPhanSoToiGian(PhanSo n){
    PhanSo tmp = n;
	int uoc = uocChungLonNhat(n.tu, n.mau);
    n.tu /= uoc;
	n.mau /= uoc;
	if (tmp.mau == n.mau && tmp.tu == n.tu)
        return true;
    return false;
}

PhanSo matran[100][100];

void readMatrix(ifstream &fr){
    int x, y;
    fr >> x >> y;
    string tu, mau, s;
    for (int i = 0; i < x; i++)
        for (int j = 0; j < y; j++){
            stringstream ss(s);
            getline(ss, tu, '/');
            getline(ss, mau, ' ');
            matran[i][j].mau = stoi(mau);
            matran[i][j].tu = stoi(tu);
            if (!findPhanSoToiGian(matran[i][j]))
                matran[i][j].mau = matran[i][j].mau / uocChungLonNhat(matran[i][j].mau, matran[i][j].tu);
                matran[i][j].tu = matran[i][j].tu / uocChungLonNhat(matran[i][j].mau, matran[i][j].tu);
        }
    
    ofstream fw;
    fw.open("output.txt");
    for (int i = 0; i < x; i++){
        for (int j = 0; j < y; j++){
            fw << matran[i][j].tu << '/' << matran[i][j].mau << ' ';
        }
        fw << '\n';
    }
        
}