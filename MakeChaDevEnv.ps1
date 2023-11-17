echo "
_________ .__                .___                                           
\_   ___ \|  |__ _____     __| _/                                           
/    \  \/|  |  \\__  \   / __ |                                            
\     \___|   Y  \/ __ \_/ /_/ |                                            
 \______  /___|  (____  /\____ |                                            
        \/     \/     \/      \/                                            
________                     .__                                       __   
\______ \   _______  __ ____ |  |   ____ ______   _____   ____   _____/  |_ 
 |    |  \_/ __ \  \/ // __ \|  |  /  _ \\____ \ /     \_/ __ \ /    \   __\
 |    `   \  ___/\   /\  ___/|  |_(  <_> )  |_> >  Y Y  \  ___/|   |  \  |  
 /_______  /\___  >\_/  \___  >____/\____/|   __/|__|_|  /\___  >___|  /__|  
 \/     \/          \/            |__|         \/     \/     \/      
 ___________           .__                                            __     
 \_   _____/ _______  _|__|______  ____   ____   _____   ____   _____/  |_   
 |    __)_ /    \  \/ /  \_  __ \/  _ \ /    \ /     \_/ __ \ /    \   __\  
 |        \   |  \   /|  ||  | \(  <_> )   |  \  Y Y  \  ___/|   |  \  |    
 /_______  /___|  /\_/ |__||__|   \____/|___|  /__|_|  /\___  >___|  /__|    
 \/     \/                           \/      \/     \/     \/        
 Hacked together by RaYnoXu1337"
 echo " "
 echo "For dependency licences go look in the unpacked folders. This script just helps you download a bunch of crap."
 echo " "

 $title   = 'Which ChaDE flavor do you want?'
 $msg     = 'Choose Microsoft non-OSS VSCode (possibly spyware, but has more extensions and IntelliSense) or OSS VSCodium (Cool but missing features)'
 $options = '&MS VScode', '&OSS VSCodium'
 $default = 0  # 0=Yes, 1=No
 
 # Choose Microsoft (possibly spyware) non-OSS VSCode or OSS VSCodium
 $flavor = $Host.UI.PromptForChoice($title, $msg, $options, $default)
 if ($flavor){
        echo "OSS VSCodium is being used."
        $vsCodiumURL='https://github.com/VSCodium/vscodium/releases/download/1.84.2.23319/VSCodium-win32-x64-1.84.2.23319.zip'
        $launcherURL="https://raw.githubusercontent.com/raynoxu1337/ChaDE/main/launchOSS.cmd"
    }
    else
    {
        echo "MS VSCode is being used."
        $vsCodiumURL='https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-archive'
        $launcherURL="https://raw.githubusercontent.com/raynoxu1337/ChaDE/main/launchMS.cmd"
    }
$vsCodiumLocal='./download/vsCodium.zip'

$7zrURL='https://7-zip.org/a/7zr.exe'
$7zrLocal='./ChaDEnv/7zr.exe'

$7zURL='https://www.7-zip.org/a/7z2301-extra.7z'
$7zLocal='./download/7z.7z'

$gitURL='https://github.com/git-for-windows/git/releases/download/v2.42.0.windows.2/PortableGit-2.42.0.2-64-bit.7z.exe'
$gitLocal='./download/git.sfx'

$CmakeURL="https://github.com/Kitware/CMake/releases/download/v3.28.0-rc4/cmake-3.28.0-rc4-windows-x86_64.zip"
$CmakeLocal="./download/cmake.zip"

$MinGw64URL="https://github.com/niXman/mingw-builds-binaries/releases/download/13.2.0-rt_v11-rev0/x86_64-13.2.0-release-win32-seh-ucrt-rt_v11-rev0.7z"
$MinGw64Local="./download/mingw64.7z"

$VcpkgURL="https://github.com/Microsoft/vcpkg.git"

$iconURL="https://raw.githubusercontent.com/raynoxu1337/ChaDE/main/CDE.ico"
$iconLocal

$launcherLocal="./launch.cmd"

mkdir download
mkdir ChaDEnv

# Setup the launch scripts here!!

$ProgressPreference = 'SilentlyContinue'
#Download icon
Invoke-WebRequest $iconURL -OutFile $iconLocal
#Download launch script
Invoke-WebRequest $launcherURL -OutFile $launcherLocal
# Downlaod 7z portable to extract other things
echo "Downloading 7zr and 7za..."
Invoke-WebRequest $7zrURL -OutFile $7zrLocal
Invoke-WebRequest $7zURL -OutFile $7zLocal
Start-Process './ChaDEnv/7zr.exe' "x ./download/7z.7z -o./ChaDEnv/7zip *.* -r -y" -NoNewWindow -Wait
# Download portable VSCodium
echo "Downloading VSCode/VSCodium..."
Invoke-WebRequest $vsCodiumURL -OutFile $vsCodiumLocal
Start-Process './ChaDEnv/7zip/7za.exe' "x ./download/vsCodium.zip -o. *.* -r -y" -NoNewWindow -Wait
# Add data folder to make VSCode portabe
$Folder = 'data'
#"Test to see if folder [$Folder]  exists"
if (Test-Path -Path $Folder) {
    echo "Not deleting the data folder, probably we are just updating :)"
} else {
    mkdir data
}

# Download git
echo "Downloading Git..."
Invoke-WebRequest $gitURL -OutFile $gitLocal
Start-Process './ChaDEnv/7zip/7za.exe' "x ./download/git.sfx -o./ChaDEnv/git *.* -r -y" -NoNewWindow -Wait
# Download Cmake
echo "Downloading Cmake..."
Invoke-WebRequest $cmakeURL -OutFile $cmakeLocal
Start-Process './ChaDEnv/7zip/7za.exe' "x ./download/cmake.zip -o./ChaDEnv/cmake *.* -r -y" -NoNewWindow -Wait
# Download MinGw64
echo "Downloading MinGw64..."
Invoke-WebRequest $MinGw64URL -OutFile $MinGw64Local
Start-Process './ChaDEnv/7zip/7za.exe' "x ./download/mingw64.7z -o./ChaDEnv/mingw64 *.* -r -y" -NoNewWindow -Wait
# Download Vcpkg
echo "Downloading Vcpkg..."
cd "./ChaDEnv"
./git/cmd/git.exe clone $VcpkgURL
./vcpkg/bootstrap-vcpkg.bat
cd ..

if ($flavor){
    echo "Installing OSS VsCodium needed extensions."
   }
   else
   {
    echo "Installing MS VSCode needed extensions."
   }
# delete doenloads folder
$dlPath=Join-Path $PSScriptRoot -ChildPath 'download/*'
Remove-Item -Path $dlPath -Force -Recurse
$dlPath=Join-Path $PSScriptRoot -ChildPath 'download'
Remove-Item -Path $dlPath -Force -Recurse
 
#ALL THIS SHIT TO MAKE A FUCKING SHORTCUT HELLO?
$IconRelPath='CDE.ico'
$IconPath=Join-Path $PSScriptRoot -ChildPath $IconRelPath

$ExeRelPath='launch.cmd'
$ExePath=Join-Path $PSScriptRoot -ChildPath $ExeRelPath

$shortcut = (New-Object -ComObject Wscript.Shell).CreateShortcut('ChaDE.lnk')
$shortcut.TargetPath = $ExePath # Executable only
$shortcut.IconLocation = $IconPath
$shortcut.Save()

echo " "
Write-Host 'ChaDE was installed, use shortcut in this folder to launch and/or add said shortcut to your StartMenu/Desktop.

Press any key to exit the installer...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
