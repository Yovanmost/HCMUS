#include "AllLibraries.h"

void importAccounts(std::map<char*, char*> accs, char* usrname, char* passwrd);
void exportAccounts(std::map<char*, char*> accs, char* usrname, char* passwrd);
bool CheckSignUp(std::map<char*, char*> accs, char* usrname, char* passwrd);
int CheckLogIn(std::map<char*, char*> accs, char* usrname, char* passwrd);