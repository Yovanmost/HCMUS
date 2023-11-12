#include <iostream> 
#include <fstream>
using namespace std;

int main() {
    ifstream inp("i.txt");
    ofstream out("o.txt");
    out << "testing files\n";
    return 0;
}
