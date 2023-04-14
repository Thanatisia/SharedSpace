@echo off
:: Compile OpenCL

:: Initialize Variables
SET AMD_SDK_INCLUDE="C:\\AMD APP SDK\3.0\include"
SET AMD_SDK_LIBRARY="C:\\AMD APP SDK\3.0\lib\x86_64"
SET CLINK=OpenCL
SET /p SRC="C++ Source File: "
SET OBJ="out.o"
SET OUT="out.exe"

:: Compile Object file
g++ -c -I %AMD_SDK_INCLUDE% %SRC% -o %OBJ% && (
    echo Object compiled successfully.

    :: Compile object file to binary
    g++ %OBJ% -o %OUT% -L %AMD_SDK_LIBRARY% -l %CLINK% && (
        echo Binary compiled successfully.
    ) || (
        echo Error compiling Binary.
    )
) || (
    echo Error compiling Object.
)

pause