#include <iostream>
#include <string.h>
#include <string>
#define SIZE 256
using namespace std;

// cut till it is no longer Palindrome
bool fn(char *s, int len) {
    cout << "len = " << len << endl;
    if (len <=1 )
        return true;
    else
        return( (s[0] == s[len-1]) && fn(s+1, len-2) );
}

void reverseName(char s[]){
    int n = strlen(s);
    char tmp[n];
    int flag = 0;
    if (strrchr(s, ' ') != NULL){
        strcpy(tmp, strrchr(s, ' ')+1);
    strcat(tmp, " ");
        s[strrchr(s,' ') - s] = '\0';
        flag = 1;
    }
    while(strrchr(s, ' ') != NULL && s != '\0'){
        // cout << strrchr(s, ' ')+1;
        strcat(tmp, strrchr(s, ' ')+1);
        strcat(tmp, " ");
        s[strrchr(s,' ') - s] = '\0';
    }
    if (strrchr(s, ' ') == NULL){
        if (flag == 0)
            strcpy(tmp, s);
        else strcat(tmp, s);
    }

    cout << tmp << ".";
}

void reverseNameV2(string s){
    int n = s.size();
    string tmp = "";
    int flag = 0;
    if (s.rfind(' ') != string::npos){
        tmp += s.substr(s.rfind(' ')+1, s.size());
        tmp += ' ';
        s.erase(s.rfind(' '));
        flag = 1;
    }
    while(s.rfind(' ') != string::npos){
        // cout << strrchr(s, ' ')+1;
        tmp += s.substr(s.rfind(' ')+1, s.size());
        tmp += ' ';
        s.erase(s.rfind(' '));
    }
    if (s.rfind(' ') == string::npos){
        tmp += s;
    }

    cout << tmp << ".";
}   

void moreThanLength(char s[], int n){
    if (n > strlen(s))
        cout << s;
    else{
        char tmp[n];
        for (int i = 0; i < n; i++)
            tmp[i] = s[i];
        tmp[n] = '\0';
        cout << tmp;
    }    
}

void moreThanLength(string s, int n){
    if (n > s.size())
        cout << s;
    else{
        string tmp = s.substr(0, n);
        cout << tmp;
    }    
}

void capTheFirstLetter(char s[]){
    for (int i = 0; i < strlen(s); i++)
        if (s[i] <= 'Z' && s[i] >= 'A')
            s[i] = tolower(s[i]);
    
    s[0] = toupper(s[0]);
    for (int i = 1; i < strlen(s) - 1; i++)
        if (s[i] == ' ' && s[i+1] != ' ')
            s[i+1]= toupper(s[i+1]);

    cout << s;
}

void caseInsensitive(char s[]){
    char tmp[SIZE];
    int count = 0;
    for (int i = 0; i < strlen(s); i++)
        if (s[i] == ' ')
            continue;
        else tmp[count++] = s[i];
    tmp[count] = '\0';
    // cout << tmp;

    for (int i = 0; i < count/2; i++) 
        if (tmp[i] != tmp[count - 1 - i]){
            cout << "Not palindrome";
            return;
        }
    cout << "Palindrome";
}

void countWords(string s){
    // scan the first word, count the appearance, delete
    // string tmp;
    while (s.empty() != true){
        if (s.find(' ') != string::npos){
            string tmp = s.substr(0, s.find(' '));
            int count = 0;
            while (tmp != s.substr(0, s.find(' '))){
            count++;
            s.erase(0, s.find(' ')+1);
            }
            cout << tmp << count << '\n';
        }
        else{
            string tmp = s;
            
        }
            
    }
}

void splitWords(char s[], char tmp[][256]){
    int i = 0, j = 0, k = 0;

    while (s[k] != '\0'){
        if (s[k] != ' '){
            tmp[i][j++] = s[k];
        }else{
            tmp[i][j] = '\0';
            i++;
            j = 0;
        }
        k++;
    }

    for (int j = 0; j <= i; j++)
        cout << tmp[j] << "\n";

    for (int j = 0; j <= i; j++){
        int count = 1;
        for (int p = j+1; p <= i; p++)
            if (strcmp(tmp[j], tmp[p]) == 0 && strcmp(tmp[j],"\0") != 0){
                count++;
                strcpy(tmp[p],"\0");
            }
        if (strcmp(tmp[j],"\0") != 0){
            cout << "-|" << tmp[j] << ' ' << count << "|-";
            strcpy(tmp[j],"\0");
        }
            
    }
}

void pangram(char s[]){
    bool alphabet[26];
    for (int i = 0; i < 26; i++)
        alphabet[i] = false;
    
    for (int i = 0; i < strlen(s); i++)
        s[i] = tolower(s[i]);

    for (int i = 0; i < strlen(s); i++)
        if (s[i] >= 'a' && s[i] <= 'z')
            alphabet[(int)s[i] - (int)'a'] = true;
    
    for (int i = 0; i < 26; i++)
        if (alphabet[i] == false){
            cout << "Not pangram";
            return;
        }
    cout << "Pangram";
}

void password(char s[]){
    if (strlen(s) < 15){
        cout << "Weak";
        return;
    }
    bool caps = false, normal = false, number = false, symbol = false;
    for (int i = 0; i < strlen(s); i++){
        if (isupper(s[i])){
            caps = true;
            continue;
        }
        if (islower(s[i])){
            normal = true;
            continue;
        }
        if (isdigit(s[i])){
            number = true;
            continue;
        }
        if (ispunct(s[i])){
            symbol = true;
            continue;
        }
    }

    if (caps == true && normal == true && number == true && symbol == true)
        cout << "Strong";
    else cout << "Weak";
}

bool condition(char a[], char b[]){
    if (strlen(a) > strlen(b))
        return false;
    else if (strlen(a) < strlen(b))
        return true;
    else
        if (strcmp(a, b) < 0)
            return false;
    return true;
}

void swap(char a[], char b[]){
    char tmp[SIZE];
    strcpy(tmp, a);
    strcpy(a, b);
    strcpy(b, tmp);
}

void sortString(char s[], char tmp[][256]){
    
    int i = 0, j = 0, k = 0;

    while (s[k] != '\0'){
        if (s[k] != ' '){
            tmp[i][j++] = s[k];
        }else{
            tmp[i][j] = '\0';
            i++;
            j = 0;
        }
        k++;
    }
 
    for (int j = 0; j <= i; j++)
        cout << tmp[j] << '|';

    for (int j = 0; j <= i; j++)
        for (int p = j+1; p <=i; p++)
            if (condition(tmp[j], tmp[p]))
                swap(tmp[j], tmp[p]);

    for (int j = 0; j <= i; j++)
        cout << tmp[j] << ' ';
}

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

void deletePattern(string s, string in){
    int i = s.find(in);
    if (s.find(in) == string::npos)
        return;
    string tmp = s.substr(0, i) + s.substr(i+in.length());
    while (tmp.find(in) != string::npos){
        tmp.erase(tmp.find(in), in.length()+1);
    }
    tmp.insert(i, in);
    cout << tmp;
}

void count(char s[]){
    int vowel = 0, consonant = 0;
    for (int i = 0; i < strlen(s); i++)
        s[i] = tolower(s[i]);
    for (int i = 0; i < strlen(s); i++)
        if (s[i] >= 'a' && s[i] <= 'z')
            if (s[i] == 'a' || s[i] == 'e' || s[i] == 'i' || s[i] == 'o' || s[i] == 'u')
                vowel++;
            else consonant++;
    cout << vowel << " vowel(s) " << consonant << " consonant(s)";
}

int main(){
    char s[SIZE];
    cin.getline(s, SIZE);
    count(s);
    
}
