#include "FileHandler.h"

FileHandler::FileHandler(){

}

FileHandler::~FileHandler(){
    fileStream.close();
}

void FileHandler::openFileForReading() {
        fileStream.open(this->fileName, std::ios::in);
        if (!fileStream.is_open()) {
            throw FileNotFoundException("Error opening file for reading: " + fileName);
        }
    }

void FileHandler::openFileForWriting() {
    fileStream.open(fileName, std::ios::out | std::ios::trunc);
    if (!fileStream.is_open()) {
        throw FileNotFoundException("Error opening file for writing: " + fileName);
    }
}

void FileHandler::writeData(const std::string& data) {
    if (fileStream.is_open()) {
        fileStream << data;
    } else {
        throw FileNotFoundException("File not open for writing: " + fileName);
    }
}

bool FileHandler::endFile(){
    return fileStream.eof();
}

std::string FileHandler::readData() {
    if (fileStream.is_open()) {
        std::string data;
        // fileStream >> data;
        std::getline(fileStream, data);
        return data;
    } else {
        throw FileNotFoundException("File not open for reading: " + fileName);
    }
}

void FileHandler::closeFile() {
    if (fileStream.is_open()) {
        fileStream.close();
    }
}