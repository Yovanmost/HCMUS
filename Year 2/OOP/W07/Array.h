#ifndef ARRAY_H
#define ARRAY_H

#pragma once
#include <exception>
#include <string>
#include <cstring>
#include <sstream>

class IndexOutOfRangeException : public std::exception{
private:
    int index, capacity;
public:
    IndexOutOfRangeException(int index, int capacity) {
        this->index = index;
        this->capacity = capacity;
    }
    const char* what() const throw() {
        std::stringstream stream;
        stream << "Exception: Index out of range" << '\n';
        stream << "Detail: index = " << index << ", capacity = "
                << capacity << '\n';
        return strdup(stream.str().c_str());
    }
};

class Array{
private:
public:
    Array();
    ~Array();
};

#endif