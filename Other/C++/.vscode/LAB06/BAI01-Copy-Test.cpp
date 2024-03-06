#include <iostream>
#include <fstream>
#include <string>
#include <string.h>

using namespace std;

ifstream fin;
ofstream fout;

void prototypeFile(char a[], char b[]){
    fin.open("LAB06-IN.txt");
    fout.open("LAB06-OUT.txt");
    if (fin.is_open() == false)
		return;

    while (fin.eof() == false){
    
    }

    fin.close();
    fout.close();

}

int copyFile(char input[], char output[]){
    while (fin.eof() == false){
		fin.getline(input, 256);
	    strcpy(output, input);
	    fout << output << '\n';
	}
}

int copyFileV2(char input[], char output[]){
    fin.open("LAB06-IN.txt");
    fout.open("LAB06-OUT.txt");
    if (fin.is_open() == false)
		return 0;

    while (fin.eof() == false){
		fin.getline(input, 256);
	    strcpy(output, input);
	    fout << output << '\n';
	}

    fin.close();
    fout.close();
}

int deleteEmptyLines(char input[]){
    int i = 0;
    // char tmp[256];
    fin.open("LAB06-IN.txt");
    if (fin.is_open() == false)
		return 0;

    while (fin.eof() == false){
		fin.getline(input, 256);
        if (strlen(input) != 0){
	        cout << input << '\n';
        }
	}
    fin.close();
}


int countAverageChar(char input[]){
    fin.open("LAB06-IN.txt");
    if (fin.is_open() == false)
		return 0;
    
    int letter = 0, line = 0;

    while (fin.eof() == false){
		fin.getline(input, 256);
        line++;
	    for (int i = 0;i < strlen(input); i++){
		    if (input[i] != ' ')
			    letter++;
	    }
	}
    cout << letter << "\n" << line << "\n";
    cout << letter / line;
    
    fin.close();
}

int printSource(char input[]){
    fin.open("BAI01-Copy-Test.cpp");
    if (fin.is_open() == false)
		return 0;
    char output[256];
    while (fin.eof() == false){
		fin.getline(input, 256);
	    strcpy(output, input);
	    cout << output << '\n';
	}    

    fin.close();
}

int deleteLastLine(char input[]){
    int i = 0;
    char tmp[256][256];
    fin.open("LAB06-IN.txt");
    if (fin.is_open() == false)
		return 0;

    while (fin.eof() == false){
		i++;
		fin.getline(input, 256);
	    strcpy(tmp[i], input);
		// cout << tmp[i];
	}
	for (int j = 0; j < i; j++)
		cout << tmp[j] << "\n";
    fin.close();
}

int insert7thLine(char input[]){
    int i = 0;
    char tmp[256][256];
    fin.open("LAB06-IN.txt");
    if (fin.is_open() == false)
		return 0;

    while (fin.eof() == false){
		i++;
		fin.getline(input, 256);
	    strcpy(tmp[i], input);
		// cout << tmp[i];
	}
	for (int j = 0; j < i; j++)
		if (j == 7)
			cout << tmp[j] << "\n\n";
		else 
			cout << tmp[j] << "\n";
    fin.close();
}

int insertDoubleSpaced(char input[]){
	fin.open("LAB06-IN.txt");
	if (fin.is_open() == false)
		return 0;

	while (fin.eof() == false){
		fin.getline(input, 256);
		cout << input << "\n\n";
	}
	fin.close();
}

int main(){
	
    char textIn[256];
	char textOut[256];
	int n = 0;
	int count = 0;

    int t = 0;

	cout << "Input somthing: ";
    cin >> t;
	cin.ignore();

	insert7thLine(textIn);

	// deleteLastLine(textIn);
    // deleteEmptyLines(textIn);
    // copyFileV2(textIn, textOut);
    // countAverageChar(textIn);
    // printSource(textIn);

	return 0;
}
