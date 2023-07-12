@echo off
@:: Verteile_uebersetzung_XLIFF_Quelltexte.bat
@::
@:: 
@:: 
@::-----------------------------------------------------------------------------
@:: 2021-10 Aus github wird der Inhalt des Repository "uebersetzung_01" auf den
@::		lokalen Speicher geholt.
@::		Bei meinem Rechner liegt das auf "C:\DATEN\GitHub\uebersetzung_01"
@:: 	Im Unterverzeichnis "25/XLIFF" liegen die übersetzten .xlf Dateien mit kurzen 
@:: 	Bezeichnungen der Sprachen.
@:: 	Durch Starten dieser .BAT Datei ...
@:: 
@:: 2022-06 Die Sonne dreht sich weiter jeden Tag einmal um die Erde...
@:: 
@:: 2023-04-17 Guggsdu automatisches inkrementieren:
@::		https://superuser.com/questions/560329/how-to-modify-create-values-in-xml-files-using-powershell
@::
@::=============================================================================

:: Das Unterverzeichnis mit den .xlf Dateien:
::   @SET QuellVerzeichnis_XLIFF=25\XLIFF
@SET QuellVerzeichnis_XLIFF=.\XLIFF
@SET Benutzername=alexa.PYTHA-LAB
REM		##### @SET ZielBasis=C:\Users\%Benutzername%\AppData\Roaming\PYTHA25.0\plugins
@SET ZielBasis=C:\SVN_Workdir\PYTHA.26\Quellen\plugins_lua

setlocal EnableDelayedExpansion EnableExtensions 

set Plugin[0].Verz=Block
set Plugin[0].Name=Block_V1.0

set Plugin[1].Verz=GameOfLife
set Plugin[1].Name=Game_of_Life_V1.0

set Plugin[2].Verz=KitchenWizard
set Plugin[2].Name=Kitchen_Wizard_V2.22

set Plugin[3].Verz=MengerSponge
set Plugin[3].Name=Menger_Sponge_V1.0

set Plugin[4].Verz=Pegboard
set Plugin[4].Name=Pegboard_V1.0

set Plugin[5].Verz=Penrose
set Plugin[5].Name=Penrose_V1.0

set Plugin[6].Verz=SpiralStairs1
set Plugin[6].Name=Spiral_Stairs_1_V1.0

set Plugin[7].Verz=SpiralStairs2
set Plugin[7].Name=Spiral_Stairs_2_V1.0

set Plugin[8].Verz=Staircase
set Plugin[8].Name=Staircase_V1.0



ECHO.
ECHO Wirklich aus %QuellVerzeichnis_XLIFF% die .xlf nach %ZielBasis% verteilen?
PAUSE


CALL :Verteile_alle_Sprachen

ECHO Vor goto Ende und aus
PAUSE
GOTO :Ende_und_aus


::==============================================================================
:Verteile_alle_Sprachen

:: Albanisch:
@SET Sprache_Z=sq-AL
@SET Sprache_Q=sq
CALL :Verteile_eine_XLIFF_Datei

:: Amharisch:
@SET Sprache_Z=am-ET
@SET Sprache_Q=am
CALL :Verteile_eine_XLIFF_Datei

:: Arabisch:
@SET Sprache_Z=ar-SA
@SET Sprache_Q=ar
CALL :Verteile_eine_XLIFF_Datei

:: Bulgarisch:
@SET Sprache_Z=bg-BG
@SET Sprache_Q=bg
CALL :Verteile_eine_XLIFF_Datei

@SET Sprache_Z=de-Deutsch
@SET Sprache_Q=de
CALL :Verteile_eine_XLIFF_Datei

:: Spanisch:
@SET Sprache_Z=es-ES
@SET Sprache_Q=es
CALL :Verteile_eine_XLIFF_Datei

:: Französisch
@SET Sprache_Z=fr-FR
@SET Sprache_Q=fr
CALL :Verteile_eine_XLIFF_Datei

:: Griechisch
@SET Sprache_Z=el-EL
@SET Sprache_Q=el
CALL :Verteile_eine_XLIFF_Datei

:: Hebräisch - Palästina:
@SET Sprache_Z=HEB
@SET Sprache_Q=he
CALL :Verteile_eine_XLIFF_Datei

:: Indonesisch:
@SET Sprache_Z=id-ID
@SET Sprache_Q=id
CALL :Verteile_eine_XLIFF_Datei

:: Italienisch:
@SET Sprache_Z=it-IT
@SET Sprache_Q=it
CALL :Verteile_eine_XLIFF_Datei

:: Japanisch:
@SET Sprache_Z=ja-JP
@SET Sprache_Q=ja
CALL :Verteile_eine_XLIFF_Datei

:: Koreanisch:
@SET Sprache_Z=ko-KR
@SET Sprache_Q=ko
CALL :Verteile_eine_XLIFF_Datei

:: Niederlande:
@SET Sprache_Z=nl-NL
@SET Sprache_Q=nl
CALL :Verteile_eine_XLIFF_Datei

:: Polnisch
@SET Sprache_Z=pl-PL
@SET Sprache_Q=pl
CALL :Verteile_eine_XLIFF_Datei

:: Brasilianisch / Portugiesisch:
@SET Sprache_Z=pt-PT
@SET Sprache_Q=pt
CALL :Verteile_eine_XLIFF_Datei

:: Rumaenisch
@SET Sprache_Z=ro-RO
@SET Sprache_Q=ro
CALL :Verteile_eine_XLIFF_Datei

:: Vietnamesisch
@SET Sprache_Z=vi-VN
@SET Sprache_Q=vi
CALL :Verteile_eine_XLIFF_Datei

:: China (Simplified Chinesisch)
@SET Sprache_Z=zh-CN
@SET Sprache_Q=zh-Hans
CALL :Verteile_eine_XLIFF_Datei

:: Taiwan (Traditionelles chinesisch)
@SET Sprache_Z=zh-TW
@SET Sprache_Q=zh-Hant
CALL :Verteile_eine_XLIFF_Datei

REM   GOTO :EOF
EXIT /b


::==============================================================================
:Verteile_eine_XLIFF_Datei
REM   ECHO Label Verteile_eine_XLIFF_Datei 
REM   ECHO %Sprache_Q%  nach   %Sprache_Z% 

@echo off
for /l %%n in (0,1,8) do ( 
	REM ECHO Index ist %%n
   
	SET  ZVerz=!Plugin[%%n].Verz!
	SET  QName=!Plugin[%%n].Name!
	
	SET Quell="%QuellVerzeichnis_XLIFF%\!QName!_%Sprache_Q%.xlf"
	SET Ziel="%ZielBasis%\!ZVerz!\localization.%Sprache_Z%.xlf"
   
	REM  @ECHO Nun Kopiere es: !Quell! nach !Ziel! %Sprache_Z%
	REM  COPY  !Quell! !Ziel!
	C:\SVN_Workdir\PYTHA.24.2\x64\Release\XLIFF_weblate_Konverter.exe !Quell! !Ziel! %Sprache_Z%
)
echo off

REM   GOTO :EOF
EXIT /b

ECHO Hier duerfte es nicht hinkommen

::==============================================================================
:Ende_und_aus

