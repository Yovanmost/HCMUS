#include <iostream>
#include <fstream>

using namespace std;

struct Person
{
    char name[50];
    int age;
    char phone[24];
};


int main(){
    short a = 0;
    short b = 0;
    // ofstream fout;
    // fout.open("junk.dat", ios::binary | ios::out );
    // fout.write((char* )&a, sizeof(a));
    // fout.write((char*)&b, sizeof(b));
    // fout.close();
    // ifstream fin;
    // fin.open("junk.dat", ios::binary);
    // fin.read((char*)&a, sizeof(a));
    // fin.read((char*)&b, sizeof(b));
    // cout << a << "," << b;
    // ifstream fin;
    // fin.open("junk.dat", ios::binary | ios::ate);
    // cout << fin.tellg();
    // fin.close();

    return 0;
}

// int main()
// {
//     Person me = {"Robert", 28, "364-2534"};
//     Person book[30];
//     int x = 123;
//     double fx = 34.54;
//     ofstream outfile;
//     outfile.open("junk.dat", ios::binary | ios::out);
//     outfile.write((char*)&x, sizeof(int)); // sizeof can take a type
//     outfile.write((char*)&fx, sizeof(fx)); // or it can take a variable name
//     outfile.write((char*)&me, sizeof(me));
//     outfile.write((char*)book, 30*sizeof(Person));
//     outfile.close();
// }

// int main()
// {
//     Person me = {"Robert", 28, "364-2534"};
//     Person book[30];
//     int x;
//     double fx;
//     // ofstream outfile;
//     ifstream infile;
//     infile.open("junk.dat", ios::binary | ios::in);
//     infile.read((char*)&x, sizeof(int)); // sizeof can take a type
//     infile.read((char*)&fx, sizeof(fx)); // or it can take a variable name
//     cout << x << "|" << fx;
//     // infile.read((char*)&me, sizeof(me));
//     // infile.read((char*)book, 30*sizeof(Person));
//     // outfile.close();
//     infile.close();
// }


// int main(){


//     return 0;
// }