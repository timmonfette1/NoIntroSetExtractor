:: Author- Tim Monfette
:: Date -  10/16/2019
::
:: This script is an organizational tool for organizing files.
:: This was designed to make it easy to extract ROMs from No-Intro-Sets
::   for use on Flash Carts (Everdrive, SD2SNES, etc)
::
:: It will build a directory structure like such:
::
:: 		a
::   		  A Game.ext
::   		  Another Game.ext
:: 		b
::   		  Big Game.ext
::   		  Bigger Game.ext
::
:: 		etc.
::
:: The end result will be a directory catalog of all the ROMs
::   unzipped and alphabetized according to their name.
::
:: There may be some files missed (like [BIOS] files) so you'll
::   have to manually categorize those yourself.
::
:: This script is dependent on you have an install of 7-zip.
:: You'll need to manually input the path to your install location for it.
::
:: Please refer to the README for a bit more detail about where to place
::   this script prior to executing it (it runs from a local directory
::   alongside all of the ROM archives).

:: Set some variables
SET Letters=(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z)
SET Numbers=(0,1,2,3,4,5,6,7,8,9)
SET SourceDir=.
SET DestLetterDir=.
SET DestNumDir=.\1
SET SevenZipLocation=D:\programData\7-Zip\7z.exe

:: Build the directory structure
MKDIR 1
FOR %%A IN %Letters% DO MKDIR "%SourceDir%\%%~A"

:: Move the individual ROM archives to their alphabetical locations
FOR %%A IN %Letters% DO MOVE "%SourceDir%\%%~A*.*" "%DestLetterDir%\%%~A\"
FOR %%B IN %Numbers% DO MOVE "%SourceDir%\%%~B*.*" "%DestNumDir%\"

:: For every directory we just created...
FOR /d %%I IN ("%SourceDir%\*") DO (

  :: Enter the sub directory
  CD "%%I"

  :: Extract the ROM archives
  FOR /R "." %%I IN ("*.zip") DO (
    "%SevenZipLocation%" x -y -o"%%~dpnI" "%%~fI" 
  )

  :: Delete the zip archives
  DEL ".\*.zip" /s /f /q

  :: Move the actual ROMs out of their directories into the parent directory
  :: The parent directory here is the letter directory
  FOR /R "." %%i IN (*.*) DO MOVE "%%i" "."

  :: Remove the now empty directories the ROMs used to be in
  FOR /d %%a IN ("*") DO rd "%%a" /q /s

  :: Return to the original directory
  CD ".."
)