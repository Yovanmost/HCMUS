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

bool checkPhanSoToiGian(PhanSo n){
    PhanSo tmp = n;
	int uoc = uocChungLonNhat(n.tu, n.mau);
    n.tu /= uoc;
	n.mau /= uoc;
	if (tmp.mau == n.mau && tmp.tu == n.tu)
        return true;
    return false;
}

PhanSo matran[100][100];

PhanSo split(string s){
    int pos = s.find('/');
    PhanSo x;
    x.tu = stoi(s.substr(0, pos));
    x.mau = stoi(s.substr(pos+1));
    return x;
}

void readMatrix(ifstream &fr){
    int x, y;
    fr >> x >> y;
    string s;
    for (int i = 0; i < x; i++){
        for (int j = 0; j < y; j++){
            fr >> s;
            matran[i][j] = split(s);
            if (!checkPhanSoToiGian(matran[i][j])){
                matran[i][j].mau = matran[i][j].mau / uocChungLonNhat(matran[i][j].mau, matran[i][j].tu);
                matran[i][j].tu = matran[i][j].tu / uocChungLonNhat(matran[i][j].mau, matran[i][j].tu);
            }
        }
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



int main(){
    ifstream fr;         


    return 0;
}