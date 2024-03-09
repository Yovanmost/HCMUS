#include <iostream>
#include <fstream>
#include <string>
#include <cstdint>
#include <sstream>
#include <iomanip>
#include <vector>

using namespace std;


// ==========================================================================================================

void writeShortLittleEndian(ofstream& file, uint16_t value) {
    // ofstream file(fileName, ios::binary);
    if (file.is_open()) {
        file.write((char*)&value, sizeof(value));
        cout << "Number " << value << " written to output.bin in little-endian format." << '\n';
    } else {
        cerr << "Error opening file for writing." << '\n';
    }
}

void writeShortBigEndian(ofstream& file, int16_t value) {
    uint8_t bytes[2];
    bytes[0] = static_cast<uint8_t>((value >> 8) & 0xFF); // Most significant byte
    bytes[1] = static_cast<uint8_t>(value & 0xFF);        // Least significant byte

    if (file.is_open()) {
        file.write(reinterpret_cast<const char*>(bytes), sizeof(bytes));
        cout << "Number " << value << " written to output.bin in big-endian format." << '\n';
    } else {
        cerr << "Error opening file for writing." << '\n';
    }
}

void writeHexToBinary(ofstream& file, const string& hexStr) {
    // Convert hexadecimal string to unsigned integer
    uint32_t value = stoul(hexStr, nullptr, 16);

    // Write the value to a binary file
    if (file.is_open()) {
        file.write(reinterpret_cast<const char*>(&value), sizeof(value));
        cout << "Hexadecimal number " << hexStr << " written to output.bin." << '\n';
    } else {
        cerr << "Error opening file for writing." << '\n';
    }
}

void writeFloatToBinary(ofstream& file, float value) {
    if (file.is_open()) {
        file.write(reinterpret_cast<const char*>(&value), sizeof(value));
        cout << "Float number " << value << " written to output.bin." << '\n';
    } else {
        cerr << "Error opening file for writing." << '\n';
    }
}

void writeUTF16StringToBinary(ofstream& file, const wstring& str) {
    if (file.is_open()) {
        for (wchar_t ch : str) {
            uint16_t utf16Char = static_cast<uint16_t>(ch);
            // Write UTF-16 character in little-endian byte order
            file.write(reinterpret_cast<const char*>(&utf16Char), sizeof(utf16Char));
        }
        wcout << L"String \"" << str << L"\" written to output.bin as UTF-16." << endl;
    } else {
        cerr << "Error opening file for writing." << endl;
    }
}

// ==========================================================================================================


bool createBinaryFile(string filePath){
    // string fileName = "output.dat";
    uint16_t a = 2023;
    int16_t b = 2024;
    string c = "-22C";
    float d = 2024.01;
    wstring e = L"OSes";

    ofstream fwrite;

    fwrite.open(filePath, ios::binary);
    if (!fwrite.is_open()){
        cout << "failed to create .bin file\n";
        return false;
    }
        
    writeShortLittleEndian(fwrite, a);
    writeShortBigEndian(fwrite, b);
    writeHexToBinary(fwrite, c);
    writeFloatToBinary(fwrite, d);
    writeUTF16StringToBinary(fwrite, e);
    fwrite.close();

    cout << ".bin file created successfully!\n";
    
    return true;
}
