#include <iostream>
#include <string.h>

using namespace std;

// Struct cho bai 1
struct DienThoai
{
    int maSo;
    int namSanXuat;
    float giaBan;
};


/* Bai 1: Loc danh sach dien thoai giam gia
 * - Dau vao:
 *      + dsDienThoai: mang mot chieu co kieu du lieu DienThoai
 *      + n: so luong dien thoai
 *      + namHienTai: nam hien tai
 *      + giamGia: phan tram giam gia
 */
void GetSaleList(DienThoai dsDienThoai[], int &n, int namHienTai, float giamGia)
{
    for (int i = 0; i < n; i++){
        int nam = namHienTai -  dsDienThoai[i].namSanXuat;
        if (nam < 1){
            for (int j = i; j < n - 1; j++){
                dsDienThoai[j] = dsDienThoai[j+1];
            }
            n -= 1;
            i--;
        }
    }

    for (int i = 0; i < n; i++){
        dsDienThoai[i].giaBan *= (1 - giamGia);
		cout << dsDienThoai[i].maSo << "\n";
    	cout << dsDienThoai[i].giaBan << "\n";
	}

//	for (int i = 0; i < n; i++){
//		cout  << i;
//	}
}
int main()
{
    // Test bai 1 ----------------------------------------------------------------------------------
    DienThoai dsDienThoai[100];
    int n_1 = 5;
    
    // Khoi tao danh sach dien thoai
    dsDienThoai[0] = {1001, 2019, 400};
    dsDienThoai[1] = {2002, 2020, 500};
    dsDienThoai[2] = {1005, 2018, 700};
    dsDienThoai[3] = {3005, 2020, 1000};
    dsDienThoai[4] = {2005, 2020, 900};
    
    // Goi ham de nhan ve danh sach giam gia
    GetSaleList(dsDienThoai, n_1, 2020, 0.2);
    cout << "Bai 1: ";
    if (n_1 == 2 && (dsDienThoai[0].maSo == 1001 && dsDienThoai[0].giaBan == 320)
                 && (dsDienThoai[1].maSo == 1005 && dsDienThoai[1].giaBan == 560))
        std::cout << "Dung vi du de bai\n";
    else
        std::cout << "Sai vi du de bai\n";

    return 0;
}