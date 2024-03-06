#ifndef FILEHANDLER_H
#define FILEHANDLER_H

#pragma once
#include <fstream>
#include <string>
#include <cstring>

class FileNotFoundException : public std::exception {
private:
    std::string message;
public:
    FileNotFoundException(const std::string& m) : message(m) {}

    const char* what() const throw() {
        return strdup(this->message.c_str());
    }
};

class FileHandler{
private:
    std::string fileName;
    std::fstream fileStream;
public:
    FileHandler();
    ~FileHandler();

    FileHandler(const std::string& file) : fileName(file) {}

    void openFileForReading();

    void openFileForWriting();

    void writeData(const std::string& data);

    bool endFile();

    std::string readData();

    void closeFile();
};

#endif