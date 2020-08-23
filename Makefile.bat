@echo off

REM /////////////////////////////////////////////////////////////
REM // BATCH script to compile & run C/C++ project on VS Code //
REM ///////////////////////////////////////////////////////////

REM Choose compiler betzeen GCC & G++
set compilator=g++
REM Indicate the Current Working Directory / leave "./" if you launch this script from the root of your project
set cwd=./
REM Indicate the name of the file with extention you want to compile / with extension ".c" for C or ".cpp" for C++
set srcFileName=main.cpp
REM Choose temporary output folder name
set bindir=bin
REM Indicate the source directory name of your project
set srcdir=src
REM Indicate the name of your executable
set outputFileName=run
REM Leave empty if your dont want to save the compilation temporary files / Add -save-temps=obj if you want it
set saveTmpOption=
REM "lib" folder
set LIB=-Llib
REM "include" folder
set INCLUDE=-Iinclude
REM Library you want to use to compile / for SDL2 add "-lmingw32 -lSDL2main -lSDL2" in this order
set library=-lmingw32 -lSDL2main -lSDL2
REM Need to add SDl2 dll to the temporary folder beside your executable if you want to execute it out of VS Code also leave empty
set sdlDll=SDL2.dll

REM //////////////////////////////////////////////////////////////////
REM // Don't modify the code below if you don't know BATCH language //
REM ////////////////////////////////////////////////////////////////

echo.
cls
echo *** C/C++ - Compile and Run Script for Visual Studio Code ***
echo.

set cleaned=0

if [%1]==[] goto compile
if [%1] == [-c] goto clean
if [%1] == [-r] goto run
if [%1] == [-cr] goto compile
goto compile

REM Clean temporary folder
:clean
    if [%1] == [-c] IF NOT EXIST %bindir% echo - Start cleaning temporary folders
    IF EXIST %bindir% echo - Start cleaning temporary folders
    if [%1] == [-c] IF NOT EXIST %bindir% echo         Nothing to clean > con
    IF EXIST %bindir% rmdir /S /Q %bindir% && echo         All Temporaries folders is now cleaned. > con
    set cleaned=1
    if [%1] == [-c] goto end
    goto compile

REM Compile project regarding the configuration on the top of this file
:compile
    if %cleaned% == 0 goto clean
    IF NOT EXIST %bindir% mkdir %bindir% && echo - Create temporary folder && echo         Temporary folder is created > con
    echo - Start compilation
    %compilator% -g %saveTmpOption% %cwd%\%srcdir%\%srcFileName% %INCLUDE% %LIB% %library% -o %cwd%\%bindir%\%outputFileName% > con
    echo         Compilation is done without error.
    echo - Copy %sdlDll% to temporary folder
    copy %sdlDll% %bindir% > con
    if [%1] == [-cr] goto run
    if [%1] == [] goto end

REM Run your project
:run
    if NOT [%1] == [-r] echo.
    echo -- Start running the executable --
    echo.
    .\bin\run.exe > con
    goto end

REM exit this script
:end
    exit
