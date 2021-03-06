@ECHO OFF
ECHO Compiling for release.
CHCP 65001 1>NUL
gcc -std=c99 -Wall -Wpedantic -Wextra -Wfloat-equal -Wfloat-conversion -Wvla -Werror -c *.c
gcc -o app.exe *.o
SET ERR=%ERRORLEVEL%
IF %ERR% NEQ 0 ECHO. & ECHO Files were not compiled.
DEL *.o
ECHO Done.
ECHO.
EXIT /B %ERR%