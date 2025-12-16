::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcCOrHSuRLpQywKjYwMe3l3k4Zt4bd5jV1ruPJPMv81GpcZo96nxcldsJC1VdZhfL
::fBE1pAF6MU+EWHreyHcjLQlHcCOrHSuRLpQywKjYwMe3l3k4Zt4bd5jV1ruPJPMv81GpcZo96nxciNkDDh4WewquDg==
::fBE1pAF6MU+EWHreyHcjLQlHcCOrHSuRLpQywKjYwMe3l3k4Zt4bd5jV1ruPJPMv81GpcZo96nZTjs4fGAldfx/lbA4gyQ==
::fBE1pAF6MU+EWHreyHcjLQlHcCOrHSuRLpQywKjYwMe3l3k4Zt4bd5jV1ruPJPMv81GpcZo96ndbkcVCDhpMHg==
::fBE1pAF6MU+EWHreyHcjLQlHcCOrHSuRLpQywKjYwMe3l3k4Zt4bd5jV1ruPJPMv81GpcZo96mxTnM4DQhlZanI=
::fBE1pAF6MU+EWHreyHcjLQlHcCOrHSuRLpQywKjYwMe3l3k4Zt4bd5jV1ruPJPMv81GpcZo96mNO1c8AHFVdZhfL
::YAwzoRdxOk+EWAjk
::fBw5plQjdCqDJAzTpRNieE4CGTvVZTvqU+VIsL+pvbPR8RkiBrFnIN6IjuzdcrZHuRe0I89/6XQUkcgDbA==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF65
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBNQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDx9bUSpFEqULvU/x8XL2t6ikHE5UfE0bIDL5oKnBK0/w3PwepohmH9Cnas=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
chcp 65001 >nul
title TOOL TẢI VIDEO ^& LIVESTREAM
cd /d "%~dp0"

:menu
cls
echo ==============================
echo        TOOL CHÍNH
echo ==============================
echo 1 - Tải video
echo 2 - Quay livestream
echo 00 - Thoát
echo ==============================
set /p choice=Chọn chức năng: 

:: Nếu nhập rỗng hoặc chỉ Enter quay lại menu
if "%choice%"=="" goto menu

:: Tải video
if "%choice%"=="1" (
    if exist "%~dp0video.bat" (
        start "" /wait "%~dp0video.bat"
    ) else (
        echo ❌ Không tìm thấy file video.bat!
        pause
    )
    goto menu
)

:: Quay livestream
if "%choice%"=="2" (
    if exist "%~dp0livestream.bat" (
        start "" /wait "%~dp0livestream.bat"
    ) else (
        echo ❌ Không tìm thấy file livestream.bat!
        pause
    )
    goto menu
)

:: Thoát
if "%choice%"=="00" exit

:: Nếu nhập sai quay lại menu
goto menu
