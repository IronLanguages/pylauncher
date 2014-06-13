:: document sequence required to make a clean build and construct msi
::
setlocal

PATH=%PATH%;C:\Program Files (x86)\WiX Toolset v3.6\bin
PATH=%PATH%;c:\Windows\Microsoft.NET\Framework\v4.0.30319

:: clean
msbuild.exe Launchers-vs10.sln /p:Configuration=Release /p:Platform=x64 /t:clean
msbuild.exe Launchers-vs10.sln /p:Configuration=Release /p:Platform=Win32 /t:clean

:: build 
msbuild.exe Launchers-vs10.sln /p:Configuration=Release /p:Platform=x64
msbuild.exe Launchers-vs10.sln /p:Configuration=Release /p:Platform=Win32


:: package
:: This requires cpython 3.2 with docutils installed
buildmsi.py


endlocal
