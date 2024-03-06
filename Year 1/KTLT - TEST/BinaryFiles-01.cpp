#include <iostream>
#include <string.h>
#include <string>

using namespace std;

int main(){
    FILE *filePointer;
      char *dataToBeWritten = "//TESTING.";
 
    // Open the existing file GfgTest.c using fopen()
    // in write mode using "w" attribute
    filePointer = fopen("BinaryTest.txt", "wb") ;
     
    // Check if this filePointer is null
    // which maybe if the file does not exist
    if ( filePointer == NULL )
    {
        cout <<  "File failed to open."  ;
    }
    else
    {
         
        cout << "The file is now opened.\n" ;
         
        // Write the dataToBeWritten into the file
        if ( strlen( dataToBeWritten ) > 0 )
        {
             
            // writing in the file using fputs()
            fputs(dataToBeWritten, filePointer) ;
            fputs("\n", filePointer) ;
        }
         
        // Closing the file using fclose()
        fclose(filePointer) ;
         
        cout << "Data successfully written in file GfgTest.c\n";
        cout << "The file is now closed.";
    }

    return 0;
}