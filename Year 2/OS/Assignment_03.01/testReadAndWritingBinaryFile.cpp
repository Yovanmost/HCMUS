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
    cout << "2B LE: " << value << '\n';
}

void readShortLittleEndian4Bytes(ifstream& file){
    uint32_t value;
    file.read((char*)&value, sizeof(value));
    cout << "24 LE: " << value << '\n';
}

void readShortBigEndian(ifstream& file){    
    // big endian short
    int16_t value = 0;
    uint8_t bytes[2];
    file.read(reinterpret_cast<char*>(bytes), sizeof(bytes));
    // Combine bytes to reconstruct the original value
    value = (static_cast<int16_t>(bytes[0]) << 8) | static_cast<int16_t>(bytes[1]);
    cout << "2B BE: " << value << '\n';
}

void readFloatToBinary(ifstream& file){    
    // file.seekg(6, ios::beg);
    float value;
    file.read((char*)&value, sizeof(value));
    cout << "4B: " << value << " Hex: " << hex << value  << '\n';
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
    if (!fwrite.is_open())
        return false;
    writeShortLittleEndian(fwrite, a);
    writeShortBigEndian(fwrite, b);
    writeHexToBinary(fwrite, c);
    writeFloatToBinary(fwrite, d);
    writeUTF16StringToBinary(fwrite, e);
    fwrite.close();

    return true;
}


int main(){
    string fileName = "output.dat";
    uint16_t a = 2023;
    int16_t b = 2024;
    string c = "-22C";
    float d = 2024.01;
    wstring e = L"OSes";
    wstring tmp;

    ofstream fwrite;

    fwrite.open(fileName, ios::binary);
    writeShortLittleEndian(fwrite, a);
    writeShortBigEndian(fwrite, b);
    writeHexToBinary(fwrite, c);
    writeFloatToBinary(fwrite, d);
    writeUTF16StringToBinary(fwrite, e);
    fwrite.close();


    ifstream fread;

    fread.open(fileName, ios::binary);
    readShortLittleEndian(fread);
    readShortBigEndian(fread);
    readHexToBinary(fread);
    readFloatToBinary(fread);
    readUTF16StringFromBinary(fread);
    fread.close();

    return 0;
}