#include<iostream>
#include<cstdlib>
#include <time.h>
using namespace std;

int main(){
	srand((unsigned) time(NULL));
    long long random = (rand() % 200000);

    do		{

		long long random = (rand() % 200000);

		// Print the random number
		cout<<random<<endl;
    }while (random < 100000);

	return 1;
}