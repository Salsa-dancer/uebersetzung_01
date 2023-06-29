@echo off
@:: "C:\DATEN\GitHub\uebersetzung_01\Vorbereite_uebersetzung_XLIFF_25.bat"
@::
@:: 
@:: 
@::=============================================================================

@SET Benutzername=alexa.PYTHA-LAB
@SET QuellBasis=C:\Users\%Benutzername%\AppData\Roaming\PYTHA25.0\plugins
::@SET ZielVerzeichnis="Ausgabe"
@SET ZielVerzeichnis=.\25\XLIFF


ECHO Wirklich aus %QuellBasis% die .XLF Dateien nach %ZielVerzeichnis% verteilen?
PAUSE

setlocal EnableDelayedExpansion EnableExtensions 


set Plugin[0].Verz=Block V1.0
set Plugin[0].Name=Block_V1.0

set Plugin[1].Verz=Game of Life V1.0
set Plugin[1].Name=Game_of_Life_V1.0

set Plugin[2].Verz=Kitchen Wizard V2.22
set Plugin[2].Name=Kitchen_Wizard_V2.22

set Plugin[3].Verz=Menger Sponge V1.0
set Plugin[3].Name=Menger_Sponge_V1.0

set Plugin[4].Verz=Pegboard V1.0
set Plugin[4].Name=Pegboard_V1.0

set Plugin[5].Verz=Penrose V1.0
set Plugin[5].Name=Penrose_V1.0

set Plugin[6].Verz=Spiral Stairs 1 V1.0
set Plugin[6].Name=Spiral_Stairs_1_V1.0

set Plugin[7].Verz=Spiral Stairs 2 V1.0
set Plugin[7].Name=Spiral_Stairs_2_V1.0

set Plugin[8].Verz=Staircase V1.0
set Plugin[8].Name=Staircase_V1.0



echo off
for /l %%n in (0,1,8) do ( 
	ECHO Index ist %%n
   
	SET  QVerz=!Plugin[%%n].Verz!
	SET  ZName=!Plugin[%%n].Name!
	
	SET Quell="%QuellBasis%\!QVerz!\localization.base.xlf"
	SET Ziel="%ZielVerzeichnis%\!ZName!_en.xlf"
   
	@ECHO Nun Kopiere es: !Quell! nach !Ziel!
	
	COPY  !Quell! !Ziel!
)
echo off


PAUSE
GOTO :Ende_und_aus


ECHO.
::PAUSE
:EOF


::==============================================================================
:Ende_und_aus