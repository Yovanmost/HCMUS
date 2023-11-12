#include "NgayThang.h"

NgayThang::NgayThang() : ngay(1), thang(1), nam(1){}

NgayThang::NgayThang(int ngay) : thang(1), nam(1){
    if (ngay > 30){
        
    }
        

}

NgayThang::NgayThang(int ngay, int thang) : ngay(ngay), thang(thang), nam(1){}

NgayThang::NgayThang(int ngay, int thang, int nam) : ngay(ngay), thang(thang), nam(nam){}



NgayThang::~NgayThang(){

}