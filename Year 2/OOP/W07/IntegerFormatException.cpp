#include "IntegerFormatException.h"

IntegerFormatException::IntegerFormatException(){

}

IntegerFormatException::~IntegerFormatException(){

}

const char* IntegerFormatException::what() const throw(){
    return "Error: Cannot format the string";
}