@echo off
chcp 65001 >nul
title QUAY LIVESTREAM - by you
cd /d "%~dp0"

:: ===== KIỂM TRA FILE =====
if not exist yt-dlp.exe (
    echo ❌ Không tìm thấy yt-dlp.exe
    pause
    exit
)

:: ===== NHẬP LINK LIVESTREAM =====
:inputLive
set /p link=Dán link livestream (nhập 00 để thoát): 
if "%link%"=="00" exit
if "%link%"=="" (
    echo ❌ Chưa nhập link! Vui lòng nhập lại.
    goto inputLive
)

:: ===== KIỂM TRA SHORTS =====
echo %link% | findstr /i "/shorts/" >nul
if %errorlevel%==0 (
    cls
    echo ==============================
    echo ❌  KHÔNG HỖ TRỢ YOUTUBE SHORTS
    echo ==============================
    pause
    goto inputLive
)

:: ===== CHỌN CHẤT LƯỢNG =====
cls
echo Chọn chất lượng livestream (360p-2160p, nhập 00 để quay về): 
echo 1 - 360p
echo 2 - 480p
echo 3 - 720p
echo 4 - 1080p
echo 5 - 1440p (2K)
echo 6 - 2160p (4K)

set "Q="
:inputQ
set /p q=Nhập lựa chọn: 
if "%q%"=="00" goto inputLive
if "%q%"=="1" set "Q=360"
if "%q%"=="2" set "Q=480"
if "%q%"=="3" set "Q=720"
if "%q%"=="4" set "Q=1080"
if "%q%"=="5" set "Q=1440"
if "%q%"=="6" set "Q=2160"
if not defined Q (
    echo ❌ Lựa chọn không hợp lệ! Vui lòng nhập lại.
    goto inputQ
)

:: ===== XÁC NHẬN TẢI =====
cls
echo ==============================
echo Link livestream: %link%
echo Chất lượng: %Q%p
echo ==============================
set /p confirm=Đồng ý tải? [Y/N]: 
set "confirm=%confirm:~0,1%"
if /i "%confirm%"=="Y" goto doLive
goto inputLive

:doLive
cls
echo ⬇️ Đang ghi livestream...
yt-dlp.exe -f "bestvideo[height<=%Q%]+bestaudio/best" --hls-use-mpegts "%link%"
pause
goto inputLive
