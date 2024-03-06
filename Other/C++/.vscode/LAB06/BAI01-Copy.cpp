#include <iostream>
#include <fstream>
#include <string>
#include <string.h>

using namespace std;

ifstream fin;
ofstream fout;

//copy from 1 file to another
int copyFileO(char input[], char output[]){
	fin.getline(input, 256);
//	cout << input;
	strcpy(output, input);
	fout << output << '\n';
	cout << strlen(input) << " ";
}

//test
int copyFile(char input[], char output[]){
	int count = 0;
	fin.getline(input, 256);
	for (int i = 0;i < strlen(input); i++){
		if (input[i] != ' ')
			count++;
	}
	strcpy(output, input);
	fout << output << '\n';
	cout << count << " ";
    // return count;
}


//not done
int countAverageChar(char input[]){
	int i = 0, count = 0;
	char output[256];
	while (fin.eof() == false){
		fin.getline(input, 256);
		i++;
		cout << i;	
	}
	return strlen(output);
}


int main(){
	
	fin.open("LAB06-IN.txt");
	fout.open("LAB06-OUT.txt");
	

	char textIn[256];
	char textOut[256];
	int n = 0;
	int count = 0;
	
	if (fin.is_open() == false)
		return 0;
	
	int t = 0;

	cout << "Input somthing: ";
    cin >> t;
	
    while (fin.eof() == false){
		copyFile(textIn, textOut);
        // count += copyFile(textIn, textOut);
	}

	// copyFile(textIn, textOut);
	
	fin.close();
	fout.close();

	// fin.open("LAB06-IN.txt");
	
	// while (fin.eof() == false){
	// 	copyFile(textIn, textOut);
    //     // count += copyFile(textIn, textOut);
	// }

	// fin.close();

	return 0;
}
