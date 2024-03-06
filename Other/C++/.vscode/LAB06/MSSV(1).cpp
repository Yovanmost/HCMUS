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

}

/* Bai 2: Dem so luong cap duoc ghep doi
 * - Dau vao:
 *      + dsNguoiChoi: mang mot chieu luu danh sach ma so nguoi choi
 *      + n: so luong nguoi choi
 * - Dau ra: so luong cap duoc ghep doi
 */
int CountPair(int dsNguoiChoi[], int n)
{
    return -1;
}

/* Bai 3: Chuan hoa ho va ten
 * - Dau vao: name - la ten can chuan hoa
 */
void removeChar(char s[], int pos){
    for (int i = pos; i < strlen(s) - 1; i++){
        s[i] = s[i+1];
    }
    int n = strlen(s);
    s[n - 1] = '\0'; 
}

void removeSpace(char s[]){
    int x = 0;
    int n = strlen(s);
    for (int i = 0; i < n - 1; i++){
        if (s[i] == ' ' && s[i+1] == ' '){
            removeChar(s, i);
            i--;
            x++;
        }
    }

    if (s[0] == ' '){
        removeChar(s, 0);
        x++;
    }
        
    if (s[n - x - 1] == ' ')
        removeChar(s, n - x - 1);
}

void normalChar(char s[]){
    int n = strlen(s);
    for (int i = 0; i < n - 1; i++){
        if (s[i] <= 'Z' && s[i] >= 'A')
            s[i] += 'a' - 'A';
    }
}
// 0 1 2 3

void upLetter(char s[]){
    int n = strlen(s);
    for (int i = 0; i < n - 2; i++){
        if (s[i] == ' ' && s[i+1] != ' ' && s[i+1] <= 'z' && s[i+1] >= 'a'){
            s[i+1] -= 'a' - 'A';
        }
    }
    s[0] -= 'a' - 'A';
}

void StandardizeName(char name[])
{
    removeSpace(name);
    normalChar(name);
    upLetter(name);

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

    // Test bai 2 ----------------------------------------------------------------------------------
    int dsNguoiChoi[100] = {1234, 673, 189, 4321, 756, 1023, 513, 981};
    int n_2 = 8;
    cout << "Bai 2: ";
    if (CountPair(dsNguoiChoi, n_2) == 2)
        cout << "Dung vi du de bai\n";
    else
        cout << "Sai vi du de bai\n";
    
    // Test bai 3 ----------------------------------------------------------------------------------
    char name[100];
    strcpy(name, "  nguyen  vAn teO");
    cout << "Bai 3: ";
    StandardizeName(name);
    if (strcmp(name, "Nguyen Van Teo") == 0)
        cout << "Dung vi du de bai\n";
    else
        cout << "Sai vi du de bai\n";

    return 0;
}