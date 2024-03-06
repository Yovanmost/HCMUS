#include <iostream>
#include <string.h>
#include <cstddef>
using namespace std;

struct addr {
    char city[10];
    char street[30];
    int pin ;
};

struct info{
	char name[30];
	int gender;
	struct addr locate;
};

// https://www.reddit.com/r/Cplusplus/comments/2h15s3/how_are_structs_stored_in_memory/
// 8 c c i
// c: 1 byte 000x
// c: 1 byte + 3 byte padding 000x 0000 0000 0000
// i: 4 000x 000x 000x 000x
// = 8 byte
// 12 c i c
// c
// 8 i c c
// char size is 1 byte => 8 bit 0000 0000
struct student{
    char a;
    char b;
    int c;
};

typedef struct Student{
	int rollno;
	int total;
} Student;
Student s1;
struct Student s2;

struct test{
    int x;
};

struct ComplexNum{
    int real;
    int imaginary;
};

void sumComplex(ComplexNum a, ComplexNum b){
    cout << a.real + b.real << '+' << a.imaginary + b.imaginary << 'i';
}

void multiComplex(ComplexNum a, ComplexNum b){
    cout << (a.real*b.real - a.imaginary*b.imaginary) << '+' <<
            (a.real*b.imaginary + a.imaginary*b.real) << 'i';
}



int main(){
    ComplexNum a = {3, 2}, b = {1, 7};
    // sumComplex(a, b);
    multiComplex(a, b);
    return 0;
}
