@echo OFF
@set Z_PATH=;%~dp0ChaDEnv\7zip

@set CHAD_GIT_PATH=;%~dp0ChaDEnv\git\cmd
@set CHAD_MINGW_PATH=;%~dp0ChaDEnv\mingw64\mingw64\bin
@set CHAD_VCPKG_PATH=;%~dp0ChaDEnv\vcpkg

@set PATH=%PATH%%Z_PATH%

@set PATH=%PATH%%CHAD_GIT_PATH%
@set PATH=%PATH%%CHAD_MINGW_PATH%
@set PATH=%PATH%%CHAD_VCPKG_PATH%

@set CHAD_VCPKG=%~dp0ChaDEnv\vcpkg\scripts\buildsystems\vcpkg.cmake

@set VCPKG_DEFAULT_TRIPLET=x64-mingw-dynamic
@set VSCPath="%~dp0VSCodium.exe"

@set VSCODE_DEV=
@set ELECTRON_RUN_AS_NODE=1
start "" %VSCPath% "%~dp0resources\app\out\cli.js" --ms-enable-electron-run-as-node %*

exit /b