#include <iostream>
#include <Windows.h>
#include <fstream>
#include <string>
#include <locale>
#include <codecvt>

using namespace std;

std::wstring s2ws(const std::string& str)
{
    using convert_typeX = std::codecvt_utf8<wchar_t>;
    std::wstring_convert<convert_typeX, wchar_t> converterX;

    return converterX.from_bytes(str);
}

std::string ws2s(const std::wstring& wstr)
{
    using convert_typeX = std::codecvt_utf8<wchar_t>;
    std::wstring_convert<convert_typeX, wchar_t> converterX;

    return converterX.to_bytes(wstr);
}

bool createFolder(const wchar_t* path){
    if (CreateDirectoryW(path, NULL) || GetLastError() == ERROR_ALREADY_EXISTS){
        cout << "Folder created successfully!" << '\n';
        return true;
    }
    cout << "Failed to create folder " << path << '\n';
    return false;   
}

bool createHiddenFolder(const wchar_t* path){
    if (CreateDirectoryW(path, NULL) || GetLastError() == ERROR_ALREADY_EXISTS) {
        DWORD attributes = GetFileAttributesW(path);
        if (attributes != INVALID_FILE_ATTRIBUTES) {
            SetFileAttributesW(path, attributes | FILE_ATTRIBUTE_HIDDEN);
            return true;
        }
    }
    return false;
}

bool createTextFile(string filePath, string content) {
    ofstream out(filePath);
    if (out.is_open()){
        out << content;
        out.close();
        return true;
    }
    return false;
}

int main() {
    // Name of the main folder
    const wchar_t* mainFolderName = L"Dir1";

    // Name of the subfolders
    const wchar_t* subFolderName1 = L"Dir1.1";
    const wchar_t* subFolderName2 = L"Dir1.2";

    
    string content = "OSes\n22C";

    // main folder
    createFolder(mainFolderName);

    // path for the 1st subfolder
    std::wstring subFolderPath1 = std::wstring(mainFolderName) + L"\\" + subFolderName1;
    // subfolder 1 creation
    createFolder(subFolderPath1.c_str());

    // path for the 2nd subfolder
    std::wstring subFolderPath2 = std::wstring(mainFolderName) + L"\\" + subFolderName2;
    // subfolder 2 creation
    createHiddenFolder(subFolderPath2.c_str());

    // text file in 2nd subfolder
    wstring filePath = subFolderPath2 + L"\\" + L"Data2.txt";
    createTextFile(ws2s(filePath), content);


    return 0;
}
