@echo off
setlocal enabledelayedexpansion

REM Get the number of files to delete from the command line argument
set num_files=%1

REM Loop through the files and delete F0.dat, F2.dat, F4.dat, ..., F2n.dat
for /l %%i in (0,2,%num_files%) do (
    set filename=F%%i.dat
    if exist "!filename!" (
        del "!filename!"
        echo Deleted !filename!
    ) else (
        echo !filename! not found.
    )
)

endlocal