@ECHO OFF
ECHO Compiling for release.
CHCP 65001 1>NUL
SET VAR=%CD%
PUSHD "C:\msys64\mingw64\bin"
C:\msys64\mingw64\bin\gcc.exe -std=c99 -Wall -Wpedantic -Wextra -Wfloat-equal -Wfloat-conversion -Wvla -Werror -O3 -c %VAR%\main.c -o %VAR%\main.o
C:\msys64\mingw64\bin\gcc.exe -std=c99 -Wall -Wpedantic -Wextra -Wfloat-equal -Wfloat-conversion -Wvla -Werror -O3 -c %VAR%\matrix.c -o %VAR%\matrix.o
C:\msys64\mingw64\bin\gcc.exe -std=c99 -Wall -Wpedantic -Wextra -Wfloat-equal -Wfloat-conversion -Wvla -Werror -O3 -c %VAR%\array.c -o %VAR%\array.o
C:\msys64\mingw64\bin\gcc.exe -o %VAR%\app.exe %VAR%\main.o %VAR%\matrix.o %VAR%\array.o
SET ERR=%ERRORLEVEL%
POPD
IF %ERR% NEQ 0 ECHO. & ECHO Files were not compiled. & GOTO :END
DEL *.o
:END
ECHO Done.
EXIT /B %ERR%