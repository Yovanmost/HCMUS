// #pragma comment(lib, "Winmm.lib")
#include <Windows.h>
#include <conio.h>
#include <vector>
#include <Random>
#include <string>
#include <mmsystem.h>
#include <iostream>
#include <string>

//#ifdef UNICODE
//    typedef LPCWSTR PCTSTR, LPCTSTR;
//    typedef CONST WCHAR* LPCWSTR, * PCWSTR;
//    typedef wchar_t WCHAR; // wc, 16-bit UNICODE character
//#else
//    typedef LPCSTR PCTSTR, LPCTSTR, PCUTSTR, LPCUTSTR;
//    typedef CONST CHAR* LPCSTR, * PCSTR;
//    typedef char CHAR;
//#endif // !UNICODE
//
//#ifdef UNICODE
//    #define PlaySound PlaySoundW
//#else
//    #define PlaySound PlaySoundA
//#endif // !UNICODE
//
//#ifdef UNICODE  
//    LPCTSTR sound_move = L"Move.wav";
//    LPCTSTR sound_select = L"Select.wav";
//    LPCTSTR sound_incorrect = L"Incorrect.wav";
//    LPCTSTR sound_correct = L"Correct.wav";
//    LPCTSTR sound_hint = L"Hint.wav";
//    LPCTSTR sound_background = L"Background.wav"; 
//#else  
//    LPCTSTR sound_move = "Move.wav";
//    LPCTSTR sound_select = "Select.wav";
//    LPCTSTR sound_incorrect = "Incorrect.wav";
//    LPCTSTR sound_correct = "Correct.wav";
//    LPCTSTR sound_hint = "Hint.wav";
//    LPCTSTR sound_background = "Background.wav"; 
//    LPCTSTR sz = "AAA";  
//#endif  
//
//LPCTSTR test;

void playBackGround(){
    PlaySound(TEXT("Background.wav"), NULL, SND_FILENAME | SND_LOOP | SND_ASYNC);
}

using namespace std;

int main(){
    playBackGround();
    int x, y;
    while (true)
    {
        cin >> x;
        if (x == 0)
            PlaySound(NULL, NULL, 0);
        else if (x == 1)
            playBackGround();
    }
    
    

    
    return 0;
}
