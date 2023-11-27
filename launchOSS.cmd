@echo OFF
@set Z_PATH=;%~dp0ChaDEnv\7zip
@set CHAD_CMAKE_PATH=;%~dp0ChaDEnv\cmake\cmake-3.27.8-windows-x86_64\bin
@set CHAD_GIT_PATH=;%~dp0ChaDEnv\git\cmd
@set CHAD_MINGW_PATH=;%~dp0ChaDEnv\mingw64\mingw64\bin
@set CHAD_VCPKG_PATH=;%~dp0ChaDEnv\vcpkg

@set VCPKG_ROOT=%~dp0ChaDEnv\vcpkg

@set PATH=%PATH%%Z_PATH%
@set PATH=%PATH%%CHAD_CMAKE_PATH%
@set PATH=%PATH%%CHAD_GIT_PATH%
@set PATH=%PATH%%CHAD_MINGW_PATH%
@set PATH=%PATH%%CHAD_VCPKG_PATH%

@set CHAD_GCC_FULL_PATH=%~dp0ChaDEnv\mingw64\mingw64\bin\gcc.exe
@set CHAD_GPP_FULL_PATH=%~dp0ChaDEnv\mingw64\mingw64\bin\g++.exe

@set CHAD_VCPKG=%~dp0ChaDEnv\vcpkg\scripts\buildsystems\vcpkg.cmake

@set VCPKG_DEFAULT_TRIPLET=x64-mingw-static
@set VCPKG_HOST_TRIPLET=x64-mingw-static
@set VCPKG_DEFAULT_HOST_TRIPLET=x64-mingw-static
@set VSCPath="%~dp0VSCodium.exe"

@set VSCODE_DEV=
@set ELECTRON_RUN_AS_NODE=1
start "" %VSCPath% "%~dp0resources\app\out\cli.js" --ms-enable-electron-run-as-node %*

exit /b