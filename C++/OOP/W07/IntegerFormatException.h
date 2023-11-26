#ifndef INTEGERFORMATEXCEPTION_H
#define INTEGERFORMATEXCEPTION_H

#pragma once

class IntegerFormatException{
private:

public:
    IntegerFormatException();
    ~IntegerFormatException();

    const char* what() const throw();
};

#endif