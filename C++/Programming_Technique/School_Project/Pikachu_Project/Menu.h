// #include "Play.h"
#include "Account.h"
#include "Ranking.h"
#include "FinalTestting.h"

void Logo();
void SetMenu();
void HelpTitle();
void Help1();
void Help2();
void Help();

void ChoosePlayMode();

std::string takePasswdFromUser(char sp = '*');
void SignUpScreen(std::map<char*, char*> &accounts, char* &loggedInUser);
void LogInScreen(std::map<char*, char*> &accounts, char* &loggedInUser);

void Navigation();
void InitGame();
