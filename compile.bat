@echo off
title Compile
setlocal

call :Clean
if %errorlevel% neq 0 goto :Err
call :XE
if %errorlevel% neq 0 goto :Err
call :BI
if %errorlevel% neq 0 goto :Err
call :XE
if %errorlevel% neq 0 goto :Err
cls
call :XE
if %errorlevel% neq 0 goto :Err
call :Clean
if %errorlevel% neq 0 goto :Err

echo.
echo Successful!
pause
exit /B 0


:Err
call :Clean > nul 2>&1
echo.
echo Error!
pause
exit /B 1

:Clean
call :EC Clean
git clean -X -f -e "!*.xlsx" -e "!*.pdf"
exit /B %errorlevel%

:XE
call :EC XE
xelatex main.tex
exit /B %errorlevel%

:BI
call :EC BI
bibtex main
exit /B %errorlevel%

:EC
echo.
echo.
echo ========================================
echo %~1
echo ========================================
exit /B %errorlevel%