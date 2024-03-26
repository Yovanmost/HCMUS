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
void createFnFile(string fileName, int n, int format){
    ofstream fw;
    fw.open(fileName);

    char newLine = '\n';
    char carriageReturn = '\r'; // in text file(or write text) '\n' will act as '\n\r' as the same time
    int value = 2020+n;

    int sizeLine = sizeof(value) + sizeof(newLine) + sizeof(carriageReturn);
    int nCluster = 4 - n%4;
    int sizeFile = 0;
    sizeFile = nCluster*format*SECTOR_SIZE;

    // switch (format)
    // {
    //     case 0:
    //     sizeFile = nCluster*N_SECTOR_FAT*SECTOR_SIZE;
    //     break;

    //     case 1:
    //     sizeFile = nCluster*N_SECTOR_NTFS*SECTOR_SIZE;
    //     break;

    //     case 2:
    //     sizeFile = nCluster*N_SECTOR_FAT32*SECTOR_SIZE;
    //     break;
    
    // default:
    //     sizeFile = nCluster*format*SECTOR_SIZE;
    //     break;
    // }

    int nLines = sizeFile/sizeLine;

    cout << "File [" << n << "] size: " << sizeFile << " byte(s)"
        << "\nLine size: " << sizeLine << " byte(s)"
        << "\nNumber of cluster: " << nCluster << " cluster(s)"
        << "\nNumber of lines: " << nLines << " line(s)"
        << "\nLine content: " << value << "\n\n";

    for (int i = 0; i < nLines; i++){
        fw << value << '\n';
    }

    fw.close();
}


int main(){
    int n = 0, f = 0;
    string diskName;
    cout << "Input n(number of files): ";
    cin >> n;
    cout << "Basic format: FAT(8 sector), NTFS(4 sector), FAT32(2 sector)\n";
    cout << "Input cluster size(sector): ";
    cin >> f;
    cin.ignore();
    cout << "Input disk location(e.g: Disk E(FAT) - enter: E:\\): ";
    getline(cin, diskName);

    // 1A
    for (int i = 0; i < n; i++){
        string fileName2 = diskName + "F" + to_string(i) + ".dat";
        createFnFile
        (fileName2, i, f);
    }
    
    /*
    1B
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