@echo off
chcp 65001 >nul
title YT-DLP TOOL
cd /d "%~dp0"

:: ==============================
:: KIỂM TRA FILE CẦN THIẾT
:: ==============================
if not exist yt-dlp.exe (
    echo ❌ Không tìm thấy yt-dlp.exe
    pause
    exit
)

if not exist ffmpeg.exe (
    echo ❌ Không tìm thấy ffmpeg.exe
    pause
    exit
)

:MENU
cls
echo ==============================
echo        YT-DLP TOOL
echo ==============================
echo  1 - Tải FULL video
echo  2 - Tải 1 ĐOẠN video
echo  3 - Tải video KHÔNG tiếng
echo  4 - Tải CHỈ âm thanh (mp3)
echo  0 - Thoát
echo ==============================
set /p CHOICE=👉 Chọn chức năng: 

if "%CHOICE%"=="1" goto FULL
if "%CHOICE%"=="2" goto CUT
if "%CHOICE%"=="3" goto NOVOL
if "%CHOICE%"=="4" goto AUDIO
if "%CHOICE%"=="0" exit

goto MENU

:: ==============================
:: CHỌN CHẤT LƯỢNG VIDEO
:: ==============================
:QUALITY
echo.
echo ==============================
echo      CHỌN CHẤT LƯỢNG
echo ==============================
echo  1 - 360p
echo  2 - 480p
echo  3 - 720p
echo  4 - 1080p
echo  5 - 1440p (2K)
echo  6 - 2160p (4K)
echo ==============================
set /p QSEL=👉 Nhập lựa chọn: 

if "%QSEL%"=="1" set Q=360
if "%QSEL%"=="2" set Q=480
if "%QSEL%"=="3" set Q=720
if "%QSEL%"=="4" set Q=1080
if "%QSEL%"=="5" set Q=1440
if "%QSEL%"=="6" set Q=2160

if not defined Q (
    echo ❌ Lựa chọn không hợp lệ!
    goto QUALITY
)
exit /b

:: ==============================
:: TẢI FULL VIDEO
:: ==============================
:FULL
cls
set Q=
set /p LINK=🔗 Dán link video: 
call :QUALITY
echo.
echo ⬇️ Đang tải FULL video %Q%p...
yt-dlp.exe -f "bv*[height<=%Q%]+ba/b" --merge-output-format mp4 "%LINK%"
pause
goto MENU

:: ==============================
:: TẢI 1 ĐOẠN VIDEO
:: ==============================
:CUT
cls
set Q=
set /p LINK=🔗 Dán link video: 
set /p TIME=✂️ Nhập đoạn (VD: 00:01:30-00:02:45): 
call :QUALITY
echo.
echo ✂️ Đang cắt đoạn %TIME% (%Q%p)...
yt-dlp.exe --download-sections "*%TIME%" -f "bv*[height<=%Q%]+ba/b" --merge-output-format mp4 "%LINK%"
pause
goto MENU

:: ==============================
:: TẢI VIDEO KHÔNG TIẾNG
:: ==============================
:NOVOL
cls
set Q=
set /p LINK=🔗 Dán link video: 
call :QUALITY
echo.
echo 🔇 Đang tải video KHÔNG tiếng (%Q%p)...
yt-dlp.exe -f "bv*[height<=%Q%]" --merge-output-format mp4 "%LINK%"
pause
goto MENU

:: ==============================
:: TẢI CHỈ ÂM THANH
:: ==============================
:AUDIO
cls
set /p LINK=🔗 Dán link video: 
echo.
echo 🎵 Đang tải âm thanh (mp3, tối ưu dung lượng)...
yt-dlp.exe -x --audio-format mp3 "%LINK%"
pause
goto MENU
