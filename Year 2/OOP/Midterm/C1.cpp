#include <iostream>
#include <cstring>
#define MAX_CHAR 256


using namespace std;

class SinhVien{
private:
    char* mssv;
    char* hoten;
    static int sl;
public:
    SinhVien();
    SinhVien(const char* mssv, const char* hoten);
    SinhVien(const SinhVien& sv);
    const SinhVien& operator= (const SinhVien& sv);
    ~SinhVien();
    static int SoLuongSV();
};

SinhVien::SinhVien() : mssv("null"), hoten("null"){
    sl++;
}

SinhVien::SinhVien(const char* mssv, const char* hoten){
    int mssvLen = strlen(mssv);
    int hotenLen = strlen(hoten);
    this->mssv = new char[mssvLen];
    strcmp(this->mssv, mssv);
    this->hoten = new char[hotenLen];
    strcmp(this->hoten, hoten);
    sl++;
}

SinhVien::SinhVien(const SinhVien& sv){
    int mssvLen = strlen(sv.mssv);
    int hotenLen = strlen(sv.hoten);
    this->mssv = new char[mssvLen];
    strcmp(this->mssv, sv.mssv);
    this->hoten = new char[hotenLen];
    strcmp(this->hoten, sv.hoten);
    sl++;
}

const SinhVien& SinhVien::operator=(const SinhVien &sv){
    if (this != &sv){
        int mssvLen = strlen(sv.mssv);
        int hotenLen = strlen(sv.hoten);
        this->mssv = new char[mssvLen];
        strcmp(this->mssv, sv.mssv);
        this->hoten = new char[hotenLen];
        strcmp(this->hoten, sv.hoten);
    }
    return *this;
}

SinhVien::~SinhVien(){
    delete []mssv;
    delete []hoten;
    sl--;
}

int SinhVien::SoLuongSV(){
    return sl;
}

// -------------------------------------------------------------------------------------------------

class SoNguyen{
private:
    int v;
public:
    SoNguyen();
    SoNguyen(int val);
    SoNguyen(const SoNguyen& s);
    const SoNguyen& operator=(const SoNguyen& s);
    int getValue();

    bool operator>(const SoNguyen& s) const;
    bool operator<(const SoNguyen& s) const;
    friend ostream& operator<<(ostream& out, const SoNguyen& s);
    friend istream& operator>>(istream& in, SoNguyen& s);
};

SoNguyen::SoNguyen() : v(0){

}

SoNguyen::SoNguyen(int val) : v(val){

}

SoNguyen::SoNguyen(const SoNguyen &s){
    this->v = s.v;
}

const SoNguyen& SoNguyen::operator=(const SoNguyen& s){
    this->v = s.v;
    return *this;
}

int SoNguyen::getValue(){
    return v;
}

bool SoNguyen::operator<(const SoNguyen& s) const{
    return this->v < s.v;
}

bool SoNguyen::operator>(const SoNguyen& s) const{
    return this->v > s.v;
}

ostream& operator<<(ostream& out, const SoNguyen& s){
    cout << s.v;
}

istream& operator>>(istream& in, SoNguyen& s){
    cin >> s.v;
}

