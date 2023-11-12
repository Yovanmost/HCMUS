#include "Menu.h"

void Logo()
{
    SetColor(BLACK, BLUE);
    // SetColor(BLACK, BLUE);
    // SetPosition(10, 1);
    SetPosition(10, 1);
    std::cout << ".:::::::      .::::     .::   .::  .::::::::.::       .::    .::::     .:::     .::";
    // SetPosition(10, 2);
    SetPosition(10, 2);
    std::cout << ".::    .::  .::    .::  .::  .::   .::      .: .::   .:::  .::    .::  .: .::   .::";
    // SetPosition(10, 3);
    SetPosition(10, 3);
    std::cout << ".::    .::.::        .::.:: .::    .::      .:: .:: . .::.::        .::.:: .::  .::";
    // SetPosition(10, 4);
    SetPosition(10, 4);
    std::cout << ".:::::::  .::        .::.: .:      .::::::  .::  .::  .::.::        .::.::  .:: .::";
    // SetPosition(10, 5);
    SetPosition(10, 5);
    std::cout << ".::       .::        .::.::  .::   .::      .::   .:  .::.::        .::.::   .: .::";
    // SetPosition(10, 6);
    SetPosition(10, 6);
    std::cout << ".::         .::     .:: .::   .::  .::      .::       .::  .::     .:: .::    .: ::";
    // SetPosition(10, 7);
    SetPosition(10, 7);
    std::cout << ".::           .::::     .::     .::.::::::::.::       .::    .::::     .::      .::";
}

void SetMenu()
{
    SetPosition(20, 10);
    SetColor(0, RED);
    std::cout << "play   ";
    
    SetPosition(20, 12);
    SetColor(0, BLUE);
    std::cout << "help   ";

    SetPosition(20, 14);
    SetColor(0, RED);
    std::cout << "leaderboard   ";

    SetPosition(20, 16);
    SetColor(0, BLUE);
    std::cout << "account   ";

    SetPosition(20, 18);
    SetColor(0, RED);
    std::cout << "credits   ";

    SetPosition(20, 20);
    SetColor(0, BLUE);
    std::cout << "exit   ";
    
    SetColor(0, WHITE);
}

void HelpTitle()
{
    SetConsoleTitle(TEXT("Help | MATCHING GAME"));
    SetColor(BLACK, BLUE);
    SetPosition(5, 1);
    std::cout << ".-. .-. .----. .-. . .-.    .---.  .----.    .----. .-.     .--..-.  .-.";
    SetPosition(5, 2);
    std::cout << "| {_} |/  {}  \\| |/ \\| |   {_   _}/  {}  \\   | {}  }| |    / {} \\ \\/ / ";
    SetPosition(5, 3);
    std::cout << "| { } |\\      /|  .'.  |     | |  \\      /   | .--' | `--./  /\\  \\}  {  ";
    SetPosition(5, 4);
    std::cout << "`-' `-' `----' `-'   `-'     `-'   `----'    `-'    `----'`-'  `-'`--' ";

}
void Help1()
{
    system("cls");
    HelpTitle();
    SetColor(BLACK, WHITE);
    SetPosition(5, 10);
    std::cout << "This is how to play Matching Game.";

    SetColor(BLACK, YELLOW);
    SetPosition(5, 12);
    std::cout << "W or Left Arrow";
    SetPosition(30, 12);
    std::cout << ">> Move Left";

    SetPosition(5, 13);
    std::cout << "D or Right Arrow";
    SetPosition(30, 13);
    std::cout << ">> Move Right";

    SetPosition(5, 15);
    std::cout << "A or Up Arrow";
    SetPosition(30, 15);
    std::cout << ">> Move Up";

    SetPosition(5, 16);
    std::cout << "S or Down Arrow";
    SetPosition(30, 16);
    std::cout << ">> Move Down";

    SetPosition(5, 18);
    std::cout << "Enter or Spacebar ";
    SetPosition(30, 18);
    std::cout << ">> Select Cell";

    SetPosition(5, 20);
    std::cout << "H";
    SetPosition(30, 20);
    std::cout << ">> Help";

    SetPosition(5, 22);
    std::cout << "M";
    SetPosition(30, 22);
    std::cout << ">> Move Hint";

    SetPosition(5, 30);
    std::cout << "Press Enter/Spacebar to Continue";
    SetPosition(5, 32);
    std::cout << "Press Right Arrow key to read more.";

    return;
    
}
// HELP PAGE 2 HERE
void Help2()
{
    system("cls");
    SetColor(BLACK, WHITE);
    SetPosition(5, 10);
    std::cout << "There are 3 game modes:";

    SetColor(BLACK, BLUE);
    SetPosition(5, 12);
    std::cout << "EASY: No cell shifting, choose cell by cell." ;
    SetPosition(5, 13);
    std::cout << "There are 3 levels, with increasing board sizes.";

    SetColor(BLACK, RED);
    SetPosition(5, 16);
    std::cout << "MEDIUM: Cell shifting after every move, ";

    SetColor(BLACK, YELLOW);
    SetPosition(5, 20);
    std::cout << "PRE-MOVE: No cell shifting, plan every move before execution.";


    SetColor(BLACK, YELLOW);
    SetPosition(5, 30);
    std::cout << "Go back by Left arrow key.";
    SetPosition(5, 32);
    std::cout << "Press Enter/Spacebar to go home.";

    return;
// .-. .-. .----. .-. . .-.    .---.  .----.    .----. .-.     .--..-.  .-.
// | {_} |/  {}  \| |/ \| |   {_   _}/  {}  \   | {}  }| |    / {} \\ \/ / 
// | { } |\      /|  .'.  |     | |  \      /   | .--' | `--./  /\  \}  {  
// `-' `-' `----' `-'   `-'     `-'   `----'    `-'    `----'`-'  `-'`--' 
}

void Help()
{
    int page = 0;
    int c;
    HelpTitle();
    while(true)
    {
        switch (page)
        {
        case 0:
            /* code */
            Help1();
            break;
        case 1:
            Help2();
            break;
        default:
            break;
        }

        // c = GetConsoleInput();
        c = getch();
        switch (c)
        {
        case 75:
            if (page > 0)
                page--;
            break;
        case 77:
            if (page < 2)
                page++;
            break;
        default:
            break;
        }

    }
}

void ChoosePlayMode()
{
    int subchoice = 0;
    for (int i = 0; i < 10; i++)
    {
        SetPosition(50, 10 + i);
        std::cout << "|";
    }
    
    while (true)
    {
        switch (subchoice)
        {
            case 0:
                SetColor(BLACK, YELLOW);
                SetPosition(55, 10);
                std::cout << ">> PRE-MOVE";
                SetColor(BLACK, BLUE);
                SetPosition(55, 12);
                std::cout << "easy";
                SetPosition(55, 14);
                std::cout << "medium   ";
                break;

            case 1:
                SetColor(BLACK, BLUE);
                SetPosition(55, 10);
                std::cout << "pre-move   ";
                SetColor(BLACK, YELLOW);
                SetPosition(55, 12);
                std::cout << ">> EASY";
                SetColor(BLACK, BLUE);
                SetPosition(55, 14);
                std::cout << "medium   ";
                break;

            case 2:
                SetColor(BLACK, BLUE);
                SetPosition(55, 10);
                std::cout << "pre-move   ";
                SetPosition(55, 12);
                std::cout << "easy   ";
                SetColor(BLACK, YELLOW);
                SetPosition(55, 14);
                std::cout << ">> MEDIUM";
                break;

        }

        // short key = GetConsoleInput();
        char key = getch();
        switch (getch())
        {

        case 13: // Enter
            switch (subchoice)
            {
            case 0:
                // play easy mode here
                // InitEasyMode();
                break;
            case 1:
                // InitEasyMode();
                // play hard mode
            case 2:
                // play hard mode
            default:
                break;
            }
        case 72: // ARROW UP
            if (subchoice > 0) subchoice--;
            break;
        case 80: // ARROW DOWN
            if (subchoice < 2) subchoice++;
            break;
        case 75:
            // back to menu;
            break;
        default:
            break;
        }

    }

}

// PASSWORD
// Enumerator
enum IN {
  
    // 13 is ASCII for carriage
    // return
    IN_BACK = 8,
    IN_RET = 13
  
};
  
// Function that accepts the password
std::string takePasswdFromUser(
    char sp = '*')
{
    // Stores the password
    std::string passwd = "";
    char ch_ipt;
  
    // Until condition is true
    while (true) {
  
        ch_ipt = getch();
  
        // if the ch_ipt
        if (ch_ipt == IN::IN_RET) {
            std::cout << std::endl;
            return passwd;
        }
        else if (ch_ipt == IN::IN_BACK
                 && passwd.length() != 0) {
            passwd.pop_back();
  
            // Cout statement is very
            // important as it will erase
            // previously printed character
            std::cout << "\b \b";
  
            continue;
        }
  
        // Without using this, program
        // will crash as \b can't be
        // print in beginning of line
        else if (ch_ipt == IN::IN_BACK
                 && passwd.length() == 0) {
            continue;
        }
  
        passwd.push_back(ch_ipt);
        std::cout << sp;
    }
}

void SignUpScreen(std::map<char*, char*> &accounts, char* &loggedInUser)
{
/*
 SSSSS  IIIII   GGGG  NN   NN    UU   UU PPPPPP  
SS       III   GG  GG NNN  NN    UU   UU PP   PP 
 SSSSS   III  GG      NN N NN    UU   UU PPPPPP  
     SS  III  GG   GG NN  NNN    UU   UU PP      
 SSSSS  IIIII  GGGGGG NN   NN     UUUUU  PP      

*/
    system("cls");

    SetColor(BLACK, AQUA);
    SetPosition(5, 1);
    std::cout << " SSSSS  IIIII   GGGG  NN   NN    UU   UU PPPPPP ";
    SetPosition(5, 2);
    std::cout << "SS       III   GG  GG NNN  NN    UU   UU PP   PP ";
    SetPosition(5, 3);
    std::cout << " SSSSS   III  GG      NN N NN    UU   UU PPPPPP  ";
    SetPosition(5, 4);
    std::cout << "     SS  III  GG   GG NN  NNN    UU   UU PP      ";
    SetPosition(5, 5);
    std::cout << " SSSSS  IIIII  GGGGGG NN   NN     UUUUU  PP    ";

    std::string tmpPasswrd;
    char* usrname; char* passwrd;

    SetColor(BLACK, WHITE);
    SetPosition(5, 10);
    std::cout << "Your new username:";

    SetPosition(5, 14);
    std::cout << "Your new password:";
    // SetPosition(5, 16);
    // std::cout << "Your password will not appear on screen, so type it carefully.";
    
    SetPosition(0, 12);
    std::cin.getline(usrname, 40);

    SetPosition(0, 16);
    tmpPasswrd = takePasswdFromUser();

    strcpy(passwrd, tmpPasswrd.c_str());

    if (CheckSignUp(accounts, usrname, passwrd) == true)
    {
        accounts.insert({usrname, passwrd});
        SetColor(YELLOW, GREEN);
        SetPosition(5, 20);
        std::cout << "You have signed up successfully.";
        
        SetPosition(5, 21);
        std::cout << "Press Enter/Spacebar to return to main menu.";
        while (true)
        {
            // int k = GetConsoleInput();
            char k = getch();
            if (k == 13)
            {
                // RELOAD GAME
                break;
            }
        }
    }
}

void LogInScreen(std::map<char*, char*> &accounts, char* &loggedInUser)
{
    /*
    LL       OOOOO    GGGG  IIIII NN   NN 
    LL      OO   OO  GG  GG  III  NNN  NN 
    LL      OO   OO GG       III  NN N NN 
    LL      OO   OO GG   GG  III  NN  NNN 
    LLLLLLL  OOOO0   GGGGGG IIIII NN   NN 
    */
    system("cls");

    std::string tmpPasswrd;
    int k;
    char* usrname;
    char* passwrd;

    SetColor(BLACK, AQUA);
    SetPosition(5, 1);
    std::cout << "LL       OOOOO    GGGG  IIIII NN   NN";
    SetPosition(5, 2);
    std::cout << "LL      OO   OO  GG  GG  III  NNN  NN";
    SetPosition(5, 3);
    std::cout << "LL      OO   OO GG       III  NN N NN";
    SetPosition(5, 4);
    std::cout << "LL      OO   OO GG   GG  III  NN  NNN";
    SetPosition(5, 5);
    std::cout << "LLLLLLL  OOOO0   GGGGGG IIIII NN   NN";

    SetColor(BLACK, WHITE);
    SetPosition(5, 10);
    std::cout << "Username:";
    
    SetPosition(5, 14);
    std::cout << "Password:";

    SetPosition(0, 12);
    std::cin.getline(usrname, 40);

    SetPosition(0, 16);
    tmpPasswrd = takePasswdFromUser();

    strcpy(passwrd, tmpPasswrd.c_str());

    if(CheckLogIn(accounts, usrname, passwrd) == 0)
    {
        SetColor(BLACK, GREEN);
        SetPosition(5, 20);
        std::cout << "Logged in sucessfully";
        loggedInUser = usrname;

        SetPosition(5, 21);
        std::cout << "Press Enter/Spacebar to return to main menu.";
        SetPosition(5, 22);

        while (true)
        {
            // k = GetConsoleInput();
            char k = getch();
            if (k == 13)
            {
                InitGame();
                break;
            }
        }
    }
    else if (CheckLogIn(accounts, usrname, passwrd) == -1)
    {
        
        SetColor(BLACK, RED);
        SetPosition(5, 20);
        std::cout << "No accounts found with this username.";
        SetPosition(5, 21);
        std::cout << "Please press Enter/Spacebar to sign up.";
        SetPosition(5, 22);
        std::cout << "Or, press M to go to main menu.";

        while(true)
        {
            // k = GetConsoleInput();

            char k = getch();
            if (k == 13)
            {
                SignUpScreen(accounts, loggedInUser);
                break;
            }
            else if (k == 'M')
            {
                InitGame();
                break;
            }
        }

    }
}

// void Rank_PreMove()
void Navigation()
{
    short key;
    short choice = 0;
    SetColor(WHITE, BLACK);
    while (true)
    {
        SetMenu();
        switch (choice)
        {
        case 0:
            SetPosition(20, 10);
            std::cout << ">> PLAY";
            
            break;

        case 1:
            SetPosition(20, 12);
            std::cout << ">> HELP";
            break;

        case 2:
            SetPosition(20, 14);
            std::cout << ">> LEADERBOARD";
            break;
        
        case 3:
            SetPosition(20, 16);
            std::cout << ">> ACCOUNT";
            break;

        case 4:
            SetPosition(20, 18);
            std::cout << ">> CREDITS";
            break;
            
        case 5:
            SetPosition(20, 20);
            std::cout << ">> EXIT";
            break;

        default:
            break;
        }

        // key = GetConsoleInput();
        switch (getch())
        {
            case 13: // Enter
                switch (choice)
                {
                case 0:
                    ChoosePlayMode();
                case 1:
                    Help();
                    break;
                case 2:

                default:
                    break;
                }
            case 72: // ARROW UP
                if (choice > 0) choice--;
                break;

            case 80: // ARROW DOWN
                if (choice < 5) choice++;
                break;
            
            default:
                break;
        }

    }
    return;
}

void Credits()
{
/*
 CCCCC  RRRRRR  EEEEEEE DDDDD   IIIII TTTTTTT  SSSSS  
CC    C RR   RR EE      DD  DD   III    TTT   SS      
CC      RRRRRR  EEEEE   DD   DD  III    TTT    SSSSS  
CC    C RR  RR  EE      DD   DD  III    TTT        SS 
 CCCCC  RR   RR EEEEEEE DDDDDD  IIIII   TTT    SSSSS  

*/
    SetConsoleTitle(TEXT("Credits | MATCHING GAME"));
    SetColor(BLACK, BLUE);
    SetPosition(5, 1);
    std::cout << " CCCCC  RRRRRR  EEEEEEE DDDDD   IIIII TTTTTTT  SSSSS ";

    SetPosition(5, 2);
    std::cout << "CC    C RR   RR EE      DD  DD   III    TTT   SS      ";

    SetPosition(5, 3);
    std::cout << "CC      RRRRRR  EEEEE   DD   DD  III    TTT    SSSSS  ";
    
    SetPosition(5, 4);
    std::cout << "CC    C RR  RR  EE      DD   DD  III    TTT        SS";

    SetPosition(5, 5);
    std::cout << " CCCCC  RR   RR EEEEEEE DDDDDD  IIIII   TTT    SSSSS  ";

    SetColor(BLACK, WHITE);
    SetPosition(5, 8);
    std::cout << "Our team:";

    SetPosition(5, 10);
    std::cout << "Nguyen Ba Cong - Nguyen Binh Minh";

    SetPosition(5, 12);
    std::cout << "22CLC03";

    SetPosition(5, 13);
    std::cout << "Faculty of Information Technology";

    SetPosition(5, 14);
    std::cout << "VNU-HCM University of Science";

    SetPosition(5, 16);
    std::cout << "April 2023";

    SetPosition(5, 22);
    std::cout << "Press Enter/Spacebar to return to main menu.";

    int k;
    while (true)
    {
        // k = GetConsoleInput();
        char k = getch();
        if (k == 13)
        // if (k == ENTER_KEY)
        {
            InitGame();
            break;
        }
    }
}

void LeaderboardTitle()
{
/*
      ___       __   ___  __   __   __        __   __  
|    |__   /\  |  \ |__  |__) |__) /  \  /\  |__) |  \ 
|___ |___ /~~\ |__/ |___ |  \ |__) \__/ /~~\ |  \ |__/ 
*/   
    SetConsoleTitle(TEXT("Leaderboard | PIKACHU MATCHING GAME"));
    SetPosition(5, 1);
    std::cout << "       ___       __   ___  __   __   __        __   __  ";
    SetPosition(5, 2);
    std::cout << "|    |__   /\\  |  \\ |__  |__) |__) /  \\  /\\  |__) |  \\ ";
    SetPosition(5, 3);
    std::cout << "|___ |___ /~~\\ |__/ |___ |  \\ |__) \\__/ /~~\\ |  \\ |__/ ";

}
void LeaderboardTable(std::vector<Player> LDB)
{
    SetColor(BLACK, YELLOW);
    
    for (int i = 0; i < 10; i++)
    {
        SetPosition(5, 8 + i * 2);
        std::cout << i + 1;
        SetPosition(8, 8 + i * 2);   
        std::cout << LDB[i].name;
        SetPosition(50, 8 * i + 2);
        std::cout << LDB[i].score;
    }

}

void InitGame()
{
    SetConsoleTitle(TEXT("MATCHING GAME"));
    system("cls");
    Logo();
    SetMenu();
    Navigation();
}

int main(){
    InitEasyModeV1();

    return 0;
}
