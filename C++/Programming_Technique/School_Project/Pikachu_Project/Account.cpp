#include "Account.h"

void importAccounts(std::map<char*, char*> accs, char* usrname, char* passwrd)
{
    std::fstream fs("Accounts.bin", std::ios::in);
    std::map<char*, char*>::iterator it = accs.begin();
    while(!fs.eof())
    {
        fs.read(usrname, 40);
        fs.read(passwrd, 40);
        accs.insert({usrname, passwrd});
        it++;
    }
    fs.close();
}

void exportAccounts(std::map<char*, char*> accs, char* usrname, char* passwrd)
{
    std::fstream fs("Accounts.bin", std::ios::out);
    std::map<char*, char*>::iterator it = accs.begin();
    while (it != accs.end())
    {
        fs.write(it->first, 40);
        fs.write(it->second, 40);
        it++;
    }
    fs.close();
}



bool CheckSignUp(std::map<char*, char*> accs, char* usrname, char* passwrd)
{
    if (strlen(usrname) < 2 && strlen(usrname) > 40 && strlen(passwrd) < 4 && strlen(passwrd) > 40)
    {
        return false;
    }
    if (accs.empty() == false)
    {
        std::map<char*, char*>::iterator it = accs.begin();
        while (it != accs.end())
        {
            if (usrname == it->first)
                return false;
            it++;
        }
    }
    return true;
}

int CheckLogIn(std::map<char*, char*> accs, char* usrname, char* passwrd)
{
    std::map<char*, char*>::iterator it = accs.begin();
    if (accs.empty() == true)
        return -1; // no accounts found
     
    // find username
    while (it != accs.end())
    {
        if (it->first == usrname)
        {
            if (it->second == passwrd) 
            {
                return 0; // log in successful
            }
            else
            {
                return -2; // wrong password
            }
        }
        it++;
    }

    return -1; // no accounts found
}



