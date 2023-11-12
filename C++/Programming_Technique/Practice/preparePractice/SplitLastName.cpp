#include <iostream>
#include <cstring>
using namespace std;

void lastName(PLAYER &a){
    int idex = -1;

    for (int i = 0; i < strlen(a.name); i++)
        if (a.name[i] == ' ')
            idex = i;
    int j = 0;
    if (idex == -1){
        strcpy(a.lastName, a.name);
    }
    else{
        for (int i = idex+1; i < strlen(a.name); i++)
            a.lastName[j++] = a.name[i];
        a.lastName[j] = '\0';   
    }

}

void lastName (PLAYER &a){
    int idex = -1;

    for (int i = 0; i < a.name.size(); i++)
        if (a.name[i] == ' ')
            idex = i;
    
    a.lastName = a.name.substr(idex+1, a.name.size());
}

int main ()
{
    char name[256], family_name[256], given_name[256];
    char* first_space;
    char* last_space;

    cout << "Enter a name:\n";
    cin.getline(name, 256);

    // first_space = strchr(name, ' '); // Tim dau cach dau tien de lay ho
    // if (first_space == NULL){
    //     cout << name;
    // }else{
    //     int len_family_name = first_space - name;
    //     strncpy(family_name, name, len_family_name); // Copy ho tu name vao family_name
    //     family_name[len_family_name] = '\0'; // Gan ky tu ket thuc cho ho
    //     last_space = strrchr(name, ' '); // Tim dau cach cuoi cung de lay ten
    //     strcpy(given_name, last_space + 1); // Copy ten tu name vao given_name
    //     cout << given_name << " " << family_name;
    // }
    
    // char a[] = "Marquinhos";
    // char b[] = "Arrizabalaga";
    // // cout << strcmp(a[0], b[0]);
    // cout << strcmp(a, b);
    // // if (a[0] < a[0])
    //     cout << a[0];
    // else cout << b[0];
    // cout << a[0];
    
    cout << strtok(name, " ") << ".";

    return 0;
}