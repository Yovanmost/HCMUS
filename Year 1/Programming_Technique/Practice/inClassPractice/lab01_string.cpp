#include <iostream>
#include <cstring>
#include <string>
#include <fstream>


using namespace std;
//1.
void printStringPalindrome(char s[]){
	int n = strlen(s);
	for (int i = 0; i < n/2; i++){
		if (s[i] != s[n-1-i]){
			cout << "Not";
			return;
		}
	}
	cout << "Yeh";
}
//2.
void countCapital(char s[]){
	int count = 0;
	int n = strlen(s);
	for (int i = 0; i < n; i++)
		if (s[i] <= 'Z' && s[i] >= 'A')
			count++;
	
	cout << "Number of capital letters: " << count;
}
//3.
void delChar(char s[], int pos){
	int n = strlen(s);
	for (int i = pos; i < n - 1; i++){
		s[i] = s[i+1];
	}
	s[n-1] = '\0';
}

void removeSpace(char s[]){
	int n = strlen(s);
	
	for (int i = 0; i < n - 1; i++){
		if (s[i] == ' ' && s[i+1] == ' '){
			delChar(s, i);
			i--;
		}
	}
	if (s[strlen(s) - 1] == ' ')
		delChar(s, strlen(s) - 1);
	if (s[0] == ' ')
		delChar(s, 0);
}

void countWord(char s[]){
	removeSpace(s);
	int count = 0;
	int n = strlen(s);
	
	if (n > 0)
		count++;
	for (int i = 0; i < n; i++){
		if (s[i] == ' ')
			count++;
	}
	cout << "Number of words: " << count;
	
	if (n == 0)
		cout << "None";
}

//4.
void countAppearance(char s[], char &k){
	cout << "Which letter you want to find: ";
	cin >> k;
	int n = strlen(s);
	int count = 0;
	for (int i = 0; i < n; i++){
		if (s[i] == k)
			count++;
	}
	if (count == 0)	
		cout << "Not found";
	else cout << "The letter '" << k << "' appeared " << count << " time(s)";
}

int main(){
	char str[1000];
	cin.getline(str, 1000);
	// printStringPalindrome(string);
	// countCapital(string);
	// countWord(string);
	// char k;
	// countAppearance(string, k);
	removeSpace(str);
	string newStr = str;
	cout << newStr;
	return 0;
}

