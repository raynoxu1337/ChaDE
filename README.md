# ChaDevelopmentEnvironment

Unlike most c++ IDE's this is not an IDE, this is CDE, short for Chad Development Environment, If "integrated" means spamming your system and $PATH with random incompatible things, then this one is not "integrated", but alot more "chad" because it doesn't create trash in your system (except MSVC), uses free and mostly open source software(except MSVC), supports GCC/Clang and has a WORKING package manager, that does not integrate to your $PATH like a virus and outputs nice .exe files for your friends to run on their Windows pc's. Also it's great to share your c++ projects with your friends as they just need to download CDE. Your Linux/Os X friends will also appreciate this because we are building on GCC/Clang, so they can join the fun.


TLDR:
This script will install VScode or VScodium with GNU c++ build tools. Everything is made with relative paths and does not install anything to your path. The total size after install is around 1.8Gb.

| :exclamation:  Please do not install in path with spaces, CMake WILL HAVE ISSUES!   |
|-------------------------------------------------------------------------------------|

| :exclamation:  If your PC restarts after installing the WindowsSDK and BuildTools   you will need to rerun the script until it completes without a restart!    |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------|

You only need to [download](https://raw.githubusercontent.com/raynoxu1337/ChaDE/main/MakeChaDevEnv.ps1) (Rightclick save link as) and run the MakeChaDevEnv.ps1 script. The script will install the ChaDE in the same folder it is located in. Your PC MIGHT restart, in that case you need to run the script untill it finishes without a restart!

Alternatively you can run the following in the PowerShell when you are located in your desired install folder:
> Invoke-WebRequest https://raw.githubusercontent.com/raynoxu1337/ChaDE/main/MakeChaDevEnv.ps1 -OutFile ./install.ps1 ; powershell './install.ps1'

In the folder there will be a pretty shortcut called ChaDE, right-click and add to desktop or pin to start and you're good. This launches the portable VSCod(e/ium) with all of the c++ dev environment setup so you don't need to worry about non-sense.

## Post install
### MS VS Code
* Install official c++ extension, id "ms-vscode.cpptools" to get intellisense and the debugger working.
* Download Git Graph, id "mhutchie.git-graph" to make working with git less painful.
* Install Discord Rich Presense, id "leonardssh.vscord"
    * This way your friends will know when you are coding, because you got friends, right? If they see you coding on free time hopefully they will invite you to have a beer, go to the gym or touch grass.
* Install background, id "shalldie.background"
    * This will help you have nice waifu wallpaper, I've tried all the background plugins and this one is the best so far.
* Change the font to something less dull than usual VSCode, default is depressing.
* Download a nice theme, default is also pretty depressing.
### OSS VS Codium
* You'll figure it out, you're too chad for automatic everything, keep in mind CDE has clang and clangd by default so get clangd probably as LSP and get some debugger action going.
## Usage
You will need the default project to make this the *MOST* convenient, its in a git repo, just download as zip and use it as a basis of your project. Link to repo [ChaDeTemplate(MS)](https://github.com/raynoxu1337/ChDETemplateMS).
### Package Manager
We are using VcPkg to install stuff. To install stuff, in CDE terminal (VsCode or Codium) type:
> vcpkg install packagename

And it will download and build the package with all of the dependencies.
It will even be so nice to also print you what to put in your CMakeLists.txt so it is included in your project.

You can search using commandline:
> vcpkg search packagename

You can also search on VcPkg's website.

### CMakeLists
Default project already has CMakeLists.txt with all the needed stuff setup. If you truly care beyond just having a good time running your c++ code on Windows BLAZINGLY FAST, then go ahead, edit it. But it basically works out of the box with CDE and there is no need to edit it. If you need to its pretty self explanatory. DO NOT FORGET TO ADD YOUR VCPKG PACKAGES after you install them if you are using any of them!!!
### Building/Debuging
You will build your code from build tasks defined by default project in Terminal->Run Build Task. You can build Debug or Release flavors, to start the debugger you can just go to the side pane and start debugging, but the debug build first needs to be done, you can also run debugger from the Run->Start Debugging. If you add a new package on VcPkg you will need to clean the build, cofigure and rebuild again, so don't forget that.

## Improvement
It could be nice to add some way to change the tripplets from the VSCode, but whatever, its Kenough for the first version.
I will do my best to maintain this repo. If you like this work please share with friends and don't hesitate to fill a PR, I will gladly merge it if it improves something. If you know how to install the extensions from powershell and make them appear in the portable extensions folder, not the standard, system wide one, let me know, we can make it so the chades extensions are integrated by default. Also if you are using the OSS verison, please add build/launch tasks to the template repo and add a PR to this readme to recommend the best extensions.
