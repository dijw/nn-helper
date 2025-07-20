@echo off
chcp 1251 >nul
setlocal enabledelayedexpansion

set "ZIP_URL=https://github.com/dijw/nn/raw/refs/heads/main/horassist.zip"
set "ZIP_FILE=horassist.zip"

echo ��������� �����...
powershell -Command "Invoke-WebRequest -Uri '%ZIP_URL%' -OutFile '%ZIP_FILE%' -UseBasicParsing"

if not exist "%ZIP_FILE%" (
    echo ������: ����� �� ��� ������.
    pause
    exit /b
)

set "SEVENZIP="
for %%A in (
    "%ProgramFiles%\7-Zip\7z.exe"
    "%ProgramFiles(x86)%\7-Zip\7z.exe"
    "7z.exe"
) do (
    if exist %%~A (
        set "SEVENZIP=%%~A"
        goto :USE_7ZIP
    )
)

:: ����� WinRAR
set "WINRAR="
for %%A in (
    "%ProgramFiles%\WinRAR\WinRAR.exe"
    "%ProgramFiles(x86)%\WinRAR\WinRAR.exe"
    "WinRAR.exe"
) do (
    if exist %%~A (
        set "WINRAR=%%~A"
        goto :USE_WINRAR
    )
)

echo �� ������� ����� ������������� ���������� (7-Zip ��� WinRAR).
echo ����������, ���������� ���� �� ���:
echo - 7-Zip: https://www.7-zip.org/
echo - WinRAR: https://www.rarlab.com/
pause
exit /b

:USE_7ZIP
echo ������ 7-Zip: !SEVENZIP!
"!SEVENZIP!" x "%ZIP_FILE%" -y >nul
if %errorlevel% neq 0 (
    echo ������ ��� ���������� ����� 7-Zip.
    pause
    exit /b
)
goto :CLEANUP

:USE_WINRAR
echo ������ WinRAR: !WINRAR!
"!WINRAR!" x -inul -ibck -y "%ZIP_FILE%"
if %errorlevel% neq 0 (
    echo ������ ��� ���������� ����� WinRAR.
    pause
    exit /b
)
goto :CLEANUP

:CLEANUP
echo ������� �����...
del "%ZIP_FILE%"
echo ������!
pause
exit /b
