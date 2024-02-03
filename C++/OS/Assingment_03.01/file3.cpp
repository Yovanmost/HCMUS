#include <iostream>
#include <fstream>
#include <string>
#include <bitset>
#include <unordered_map>

using namespace std;

void printLittleEndianBytes(uint16_t value) {
    // Use a pointer to reinterpret the value as an array of bytes
    uint8_t* bytes = reinterpret_cast<uint8_t*>(&value);

    // Print the bytes in little-endian order
    for (int i = sizeof(value) - 1; i >= 0; --i) {
        std::cout << std::hex << static_cast<int>(bytes[i]) << " ";
    }
    std::cout << std::endl;
}

void printBigEndianBytes(uint16_t value) {
    // Use a pointer to reinterpret the value as an array of bytes
    uint8_t* bytes = reinterpret_cast<uint8_t*>(&value);

    // Print the bytes in big-endian order
    for (int i = 0; i < sizeof(value); ++i) {
        std::cout << std::hex << static_cast<int>(bytes[i]) << " ";
    }
    std::cout << std::endl;
}


void printBigEndianBytesNegative(int16_t value) {
    // Use a pointer to reinterpret the value as an array of bytes
    uint8_t* bytes = reinterpret_cast<uint8_t*>(&value);

    // Print the bytes in big-endian order
    for (int i = sizeof(value) - 1; i >= 0; --i) {
        std::cout << std::hex << static_cast<int>(bytes[i]) << " ";
    }
    std::cout << std::endl;
}


// Function to convert a hexadecimal character to its binary representation
std::string hexCharToBinary(char hexChar) {
    static const std::unordered_map<char, std::string> hexToBinary = {
        {'0', "0000"}, {'1', "0001"}, {'2', "0010"}, {'3', "0011"},
        {'4', "0100"}, {'5', "0101"}, {'6', "0110"}, {'7', "0111"},
        {'8', "1000"}, {'9', "1001"}, {'A', "1010"}, {'B', "1011"},
        {'C', "1100"}, {'D', "1101"}, {'E', "1110"}, {'F', "1111"}
    };
    
    return hexToBinary.at(toupper(hexChar)); // Convert to uppercase before lookup
}

// Function to convert a hexadecimal string to binary string
std::string hexToBinary(const std::string& hexStr) {
    std::string binaryStr;
    
    // Determine if the number is negative
    bool isNegative = (hexStr[0] == '-');
    size_t startIdx = isNegative ? 1 : 0;

    // Convert each character to binary representation
    for (size_t i = startIdx; i < hexStr.size(); ++i) {
        binaryStr += hexCharToBinary(hexStr[i]);
    }
    
    // If the number is negative, perform two's complement
    if (isNegative) {
        // Perform one's complement
        for (char& c : binaryStr) {
            c = (c == '0') ? '1' : '0';
        }
        // Add 1 to complete two's complement
        for (int i = binaryStr.size() - 1; i >= 0; --i) {
            if (binaryStr[i] == '0') {
                binaryStr[i] = '1';
                break;
            } else {
                binaryStr[i] = '0';
            }
        }
    }

    return binaryStr;
}

void printFloatAsBinary(float value) {
    // Interpret the float value as an uint32_t to access its bits
    uint32_t intValue = *reinterpret_cast<uint32_t*>(&value);

    // Print the binary representation
    for (int i = 31; i >= 0; --i) {
        std::cout <<    ((intValue >> i) & 1);
        if (i % 4 == 0) std::cout << " "; // Add a space every 4 bits for readability
    }
    std::cout << std::endl;
}

int main(){
    // uint16_t number = 24; // Example unsigned short number

    // std::cout << "Little-Endian Bytes: ";
    // printLittleEndianBytes(number);

    // int16_t negativeNumber = -24;
    // std::cout << "Big-Endian Bytes: ";
    // printBigEndianBytes(number);
    // printBigEndianBytesNegative(negativeNumber);

    // std::string hexStr = "22C"; // Example negative hexadecimal string

    // std::cout << "Binary representation of " << hexStr << " is: " << hexToBinary(hexStr) << std::endl;

    float floatValue = 2024.01; // Example float value

    std::cout << "Binary representation of " << floatValue << " is: ";
    printFloatAsBinary(floatValue);
    
    return 0;
}