#include <iostream>
#include <Windows.h>
#include <fstream>
#include <string>
#include <locale>
#include <codecvt>
#include "binaryFileWriting.cpp"

using namespace std;

// function for converting wstring to string and vice versa
wstring s2ws(const string& str)
{
    using convert_typeX = codecvt_utf8<wchar_t>;
    wstring_convert<convert_typeX, wchar_t> converterX;

    return converterX.from_bytes(str);
}

string ws2s(const wstring& wstr)
{
    using convert_typeX = codecvt_utf8<wchar_t>;
    wstring_convert<convert_typeX, wchar_t> converterX;

    return converterX.to_bytes(wstr);
}

// create folder function

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
            cout << "Hidden folder created successfully!" << '\n';
            return true;
        }
    }
    return false;
}

// create file function

bool createTextFile(string filePath, string content) {
    ofstream out(filePath);
    if (out.is_open()){
        out << content;
        cout << ".txt file created successfully!\n";
        out.close();
        return true;
    }
    cout << "failed to create .txt!\n";
    return false;
}

bool createOSFile(string filePath){
    ofstream out(filePath);
    if (out.is_open()){
        out.close();
        cout << ".os file created successfully!\n";
        return true;
    }
    cout << "failed to create .os file!\n";
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

    // os file in main folder
    wstring filePath1 = wstring(mainFolderName) + L"\\" + L"Data1.os";
    createOSFile(ws2s(filePath1));

    // path for the 1st subfolder
    wstring subFolderPath1 = wstring(mainFolderName) + L"\\" + subFolderName1;
    // subfolder 1 creation
    createFolder(subFolderPath1.c_str());

    // path for the 2nd subfolder
    wstring subFolderPath2 = wstring(mainFolderName) + L"\\" + subFolderName2;
    // subfolder 2 creation
    createHiddenFolder(subFolderPath2.c_str());

    // text file in 2nd subfolder
    wstring filePath2 = subFolderPath2 + L"\\" + L"Data2.txt";
    createTextFile(ws2s(filePath2), content);

    // binary file in 1st subfolder
    wstring filePath3 = subFolderPath1 + L"\\" + L"Data3.bin";
    createBinaryFile(ws2s(filePath3));

    return 0;
}
