@echo OFF
@set Z_PATH=;%~dp0ChaDEnv\7zip
@set CHAD_CMAKE_PATH=;%~dp0ChaDEnv\cmake-3.28.0-rc4-windows-x86_64\bin
@set CHAD_GIT_PATH=;%~dp0ChaDEnv\git\cmd
@set CHAD_MINGW_PATH=;%~dp0ChaDEnv\mingw64\mingw64\bin
@set CHAD_VCPKG_PATH=;%~dp0ChaDEnv\vcpkg

@set PATH=%PATH%%Z_PATH%
@set PATH=%PATH%%CHAD_CMAKE_PATH%
@set PATH=%PATH%%CHAD_GIT_PATH%
@set PATH=%PATH%%CHAD_MINGW_PATH%
@set PATH=%PATH%%CHAD_VCPKG_PATH%

@set VCPKG_DEFAULT_TRIPLET=x64-mingw-dynamic
@set VSCPath="%~dp0Code.exe"

@set VSCODE_DEV=
@set ELECTRON_RUN_AS_NODE=1
start "" %VSCPath% "%~dp0resources\app\out\cli.js" --ms-enable-electron-run-as-node %*

exit /b