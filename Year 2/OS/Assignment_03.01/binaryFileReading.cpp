#include <iostream>
#include <fstream>
#include <string>
#include <cstdint>
#include <sstream>
#include <iomanip>
#include <vector>

using namespace std;

void readShortLittleEndian(ifstream& file){
    uint16_t value;
    file.read((char*)&value, sizeof(uint16_t));
    // cout << "2B LE: " << value << '\n';
    std::cout << "2B LE: " << std::hex << value << " (" << std::dec << value << ")\n";
}

void readShortBigEndian(ifstream& file){    
    // big endian short
    int16_t value = 0;
    uint8_t bytes[2];
    file.read(reinterpret_cast<char*>(bytes), sizeof(bytes));
    // Combine bytes to reconstruct the original value
    value = (static_cast<int16_t>(bytes[0]) << 8) | static_cast<int16_t>(bytes[1]);
    // cout << "2B BE: " << value << '\n';
    std::cout << "2B BE: " << std::hex << value << " (" << std::dec << value << ")\n";
}

void readFloatToBinary(ifstream& file){    
    file.seekg(8, ios::beg);
    float value;
    file.read((char*)&value, sizeof(value));
    cout << "4B: " << value << '\n';
}

void readHexToBinary(ifstream& file){
    // hex
    string hexStr;
    uint32_t value;
    file.read(reinterpret_cast<char*>(&value), sizeof(value));

    // Convert the value to hexadecimal string
    stringstream ss;
    ss << hex << setw(8) << setfill('0') << value;
    hexStr = ss.str();
    cout << "2B Hex: " << hexStr << '\n';    
}

wstring readUTF16StringFromBinary(ifstream& file) {
    if (file.is_open()) {
        wstring str;

        // Read UTF-16 characters in little-endian byte order
        while (!file.eof()) {
            uint16_t utf16Char;
            file.read(reinterpret_cast<char*>(&utf16Char), sizeof(utf16Char));
            if (file.fail()) {
                break; // Handle potential I/O errors
            }
            str += wchar_t(utf16Char);
        }

        wcout << L"String UTF-16: " << str << '\n';
        return str;
    } else {
        cerr << "Error opening file for reading." << endl;
        return L"";
    }
}

int main(){
    string fileName = "output.dat";
    ifstream fread;

    fread.open(fileName, ios::binary);

    readShortLittleEndian(fread);
    readShortBigEndian(fread);
    
    // readFloatToBinary(fread);
}