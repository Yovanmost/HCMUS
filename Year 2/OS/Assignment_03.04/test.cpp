#include <iostream>
#include <fstream>
#include <string>
#include <cstdint>
#include <sstream>
#include <iomanip>
#include <vector>

#define SECTOR_SIZE 512
#define ENTRY_SIZE 32
#define N_SECTOR_FAT 8
#define N_SECTOR_NTFS 4
#define N_SECTOR_FAT32 2

using namespace std;

/*format:
0:FAT, 1: NTFS, 2: FAT32*/
void writeText(string fileName, int n, int format){
    ofstream fw;
    fw.open(fileName);

    char newLine = '\n';
    char carriageReturn = '\r'; // in text file(or write text) '\n' will act as '\n\r' as the same time
    int value = 2020+n;

    int sizeLine = sizeof(value) + sizeof(newLine) + sizeof(carriageReturn);
    int nCluster = 4 - n%4;
    int sizeFile = 0;
    switch (format)
    {
        case 0:
        sizeFile = nCluster*N_SECTOR_FAT*SECTOR_SIZE;
        break;

        case 1:
        sizeFile = nCluster*N_SECTOR_NTFS*SECTOR_SIZE;
        break;

        case 2:
        sizeFile = nCluster*N_SECTOR_FAT32*SECTOR_SIZE;
        break;
    
    default:
        return;
        break;
    }

    int nLines = sizeFile/sizeLine;

    cout << "File [" << n << "] size: " << sizeFile << " byte(s)"
        << "\nLine size:" << sizeLine << " byte(s)"
        << "\nNumber of cluster: " << nCluster << " cluster(s)"
        << "\nNumber of lines: " << nLines << " line(s)"
        << "\nLine content: " << value << "\n\n";

    for (int i = 0; i < nLines; i++){
        fw << value << '\n';
    }

    fw.close();
}



/*format:
0:FAT, 1: NTFS, 2: FAT32*/
void writeDat(string fileName, int n, int format){
    ofstream fw;
    fw.open(fileName, ios::binary);
    char newLine = '\n';
    char carriageReturn = '\r';
    int value = 2020+n;
    // char *value = (char*)(to_string(2020+n)).c_str();
    // cout << value;

    int sizeLine = sizeof(value) + sizeof(newLine) + sizeof(carriageReturn);
    int nCluster = 4 - n%4;
    int sizeFile = 0;
    switch (format)
    {
        case 0:
        sizeFile = nCluster*N_SECTOR_FAT*SECTOR_SIZE;
        break;

        case 1:
        sizeFile = nCluster*N_SECTOR_NTFS*SECTOR_SIZE;
        break;

        case 2:
        sizeFile = nCluster*N_SECTOR_FAT32*SECTOR_SIZE;
        break;
    
    default:
        break;
    }

    int nLines = sizeFile/sizeLine;
    cout << "File [" << n << "] size: " << sizeFile << " byte(s)"
        << "\nLine size:" << sizeLine << " byte(s)"
        << "\nNumber of cluster: " << nCluster << " cluster(s)"
        << "\nNumber of lines: " << nLines << " line(s)\n"
        << "\nLine content: " << value << "\n\n";

    for (int i = 0; i < nLines; i++){
        fw.write((char*)&value, sizeof(value));
        fw.write((char*)&newLine, sizeof(newLine));
        fw.write((char*)&carriageReturn, sizeof(carriageReturn));
    }

    fw.close();
}

int writeText100(int n, int format){
    char newLine = '\n';
    char carriageReturn = '\r'; // in text file(or write text) '\n' will act as '\n\r' as the same time
    int value = 2020+n;

    int sizeLine = sizeof(value) + sizeof(newLine) + sizeof(carriageReturn);
    int nCluster = 4 - n%4;
    int sizeFile = 0;
    switch (format)
    {
        case 0:
        sizeFile = nCluster*N_SECTOR_FAT*SECTOR_SIZE;
        break;

        case 1:
        sizeFile = nCluster*N_SECTOR_NTFS*SECTOR_SIZE;
        break;

        case 2:
        sizeFile = nCluster*N_SECTOR_FAT32*SECTOR_SIZE;
        break;
    
    default:
        return 0;
        break;
    }

    int nLines = sizeFile/sizeLine;

    cout << "File [" << n << "] size: " << sizeFile << " byte(s)"
        << "\nLine size:" << sizeLine << " byte(s)"
        << "\nNumber of cluster: " << nCluster << " cluster(s)"
        << "\nNumber of lines: " << nLines << " line(s)"
        << "\nLine content: " << value << "\n\n";
}

int main(){
    int n = 0, f = 0;
    cout << "Input n: ";
    cin >> n;
    cout << "Input format: ";
    cin >> f;

    for (int i = 0; i < n; i++){
        // string fileName = "F" + to_string(i) + ".dat";
        // writeDat(fileName, i, f);

        string fileName2 = "F" + to_string(i) + ".dat";
        writeText(fileName2, i, f);
    }
    
    /*
    - The number of RDET's cluster on volume FAT32 after create 100 files: 
        + 1 file info = 1 entry = 32 bytes (notice that file name is short -> no extra entry)
        + 100 files -> 100 entry -> 100*32 = 320 bytes (1)
        + 1 cluster has 2 sectors
        + 1 sector = 512 bytes
        + number of RDET's cluster = (1)(number of entry * entry size in bytes)/sector size in bytes
                                    = 320/512 ~= 1 sector
        => Because the RDET size is 1 sector, this means that the size of RDET is 1 cluster
    */
    

    return 0;
}