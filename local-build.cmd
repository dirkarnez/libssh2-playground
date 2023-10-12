@REM run as Administrator
@echo off
cd /d %~dp0
set DOWNLOADS_DIR=%USERPROFILE%\Downloads
set DOWNLOADS_DIR_LINUX=%DOWNLOADS_DIR:\=/%

SET PATH=^
%DOWNLOADS_DIR%\PortableGit\bin;^
%DOWNLOADS_DIR%\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\mingw64;^
%DOWNLOADS_DIR%\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\mingw64\bin;^
%DOWNLOADS_DIR%\cmake-3.26.1-windows-x86_64\bin;

@REM set PATH=^
@REM D:\Softwares\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\mingw64;^
@REM D:\Softwares\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\mingw64\bin;^
@REM D:\Softwares\cmake-3.23.0-rc1-windows-x86_64\bin;

cmake.exe -G"MinGW Makefiles" ^
-DCMAKE_BUILD_TYPE=Release ^
-DLibssh2_DIR="%DOWNLOADS_DIR_LINUX%/libssh2-v1.11.0-x86_64-8.1.0-release-posix-seh-rt_v6-rev0/lib/cmake/libssh2" ^
-DOpenSSL_DIR="%DOWNLOADS_DIR_LINUX%/openssl-v3.1.3-x86_64-8.1.0-release-posix-seh-rt_v6-rev0" ^
-DZLIB_ROOT="%DOWNLOADS_DIR_LINUX%/zlib-v1.2.13-mingw64-x86_64-posix-seh-rev0-8.1.0" ^
-DZLIB_USE_STATIC_LIBS=ON ^
-B./cmake-build &&^
cd cmake-build &&^
cmake --build . &&^
echo "Successful build"
pause
