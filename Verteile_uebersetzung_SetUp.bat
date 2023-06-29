@echo off
@:: Verteile_uebersetzung_SetUp.bat
@::
@:: 
@:: 
@::-----------------------------------------------------------------------------
@:: 2021-11 Aus github wird der Inhalt des Repository "uebersetzung_01" auf den
@::		lokalen Datenträger geholt.
@::		C:\DATEN\GitHub\uebersetzung_01\25\SetUp		# die PYTHA SetUp Texte
@::		C:\DATEN\GitHub\uebersetzung_01\25\SetUp_Basis	# Die InstallMate eigenen Texte
@:: 	Durch Starten dieser .BAT Datei ...
@:: 
@::=============================================================================

:: Das Unterverzeichnis mit den .ini Dateien aus weblate:
@SET QuellVerzeichnis_INI=25\SetUp
@SET ZielBasis=C:\SVN_Workdir\Installation\25

@SET Konverterprogramm=C:\SVN_Workdir\Lizenzierung.root\x64\Release\weblate_INI_zu_SetUp_Konverter.exe

@::=============================================================================

REM setlocal EnableDelayedExpansion EnableExtensions 



ECHO Wirklich aus "%QuellVerzeichnis_INI%" die .ini Dateien nach "%ZielBasis%" konvertieren?
PAUSE


CALL :Verteile_alle_Sprachen

ECHO Vor goto Ende und aus
PAUSE
GOTO :Ende_und_aus


::==============================================================================
:Verteile_alle_Sprachen

REM		 Albanisch:
@SET Sprache_Z=sq-AL
@SET Sprache_Q=sq
CALL :Konvertiere_eine_INI_Datei

REM		 Amharisch:
@SET Sprache_Z=am-ET
@SET Sprache_Q=am
CALL :Konvertiere_eine_INI_Datei

REM		 Arabisch:
@SET Sprache_Z=ar-SA
@SET Sprache_Q=ar
CALL :Konvertiere_eine_INI_Datei

REM		 Bulgarisch:
@SET Sprache_Z=bg-BG
@SET Sprache_Q=bg
CALL :Konvertiere_eine_INI_Datei

@SET Sprache_Z=de-Deutsch
@SET Sprache_Q=de
CALL :Konvertiere_eine_INI_Datei

REM		 Espanol - Spanisch:
@SET Sprache_Z=es-ES
@SET Sprache_Q=es
CALL :Konvertiere_eine_INI_Datei

REM		Francais - Französisch
@SET Sprache_Z=fr-FR
@SET Sprache_Q=fr
CALL :Konvertiere_eine_INI_Datei

REM		Griechisch
@SET Sprache_Z=el-EL
@SET Sprache_Q=el
CALL :Konvertiere_eine_INI_Datei

@SET Sprache_Z=HEB
@SET Sprache_Q=he
CALL :Konvertiere_eine_INI_Datei

REM		Indonesisch:
@SET Sprache_Z=id-ID
@SET Sprache_Q=id
CALL :Konvertiere_eine_INI_Datei

REM		Italienisch:
@SET Sprache_Z=it-IT
@SET Sprache_Q=it
CALL :Konvertiere_eine_INI_Datei

REM		Japanisch:
@SET Sprache_Z=ja-JP
@SET Sprache_Q=ja
CALL :Konvertiere_eine_INI_Datei

REM		Koreanisch:
@SET Sprache_Z=ko-KR
@SET Sprache_Q=ko
CALL :Konvertiere_eine_INI_Datei

REM		Polnisch
@SET Sprache_Z=pl-PL
@SET Sprache_Q=pl
CALL :Konvertiere_eine_INI_Datei

REM		Brasilianisch / Portugiesisch:
@SET Sprache_Z=pt-PT
@SET Sprache_Q=pt
CALL :Konvertiere_eine_INI_Datei

REM		Rumaenisch
@SET Sprache_Z=ro-RO
@SET Sprache_Q=ro
CALL :Konvertiere_eine_INI_Datei

REM		Vietnamesisch
@SET Sprache_Z=vi-VN
@SET Sprache_Q=vi
CALL :Konvertiere_eine_INI_Datei

REM		China (Simplified Chinesisch)
@SET Sprache_Z=zh-CN
@SET Sprache_Q=zh-Hans
CALL :Konvertiere_eine_INI_Datei

REM		Taiwan (Traditionelles chinesisch)
@SET Sprache_Z=zh-TW
@SET Sprache_Q=zh-Hant
CALL :Konvertiere_eine_INI_Datei

ECHO Vor goto eof
PAUSE
GOTO :EOF



::==============================================================================
:Konvertiere_eine_INI_Datei
REM   ECHO Label Konvertiere_eine_INI_Datei 
REM   ECHO %Sprache_Q%  nach   %Sprache_Z% 

@echo off
REM		for /l %%n in (0,1,8) do ( 
	REM ECHO Index ist %%n
   
	
	REM ## SET Quell="%QuellVerzeichnis_INI%\!QName!_%Sprache_Q%.xlf"
	SET Quell="%QuellVerzeichnis_INI%\SetUp_%Sprache_Q%.ini"
	SET Ziel="%ZielBasis%\XPytha.%Sprache_Q%.imq"

::	ECHO   	%Konverterprogramm%  %Quell% %Ziel% %Sprache_Z%
   
	%Konverterprogramm%  %Quell% %Ziel% %Sprache_Z%


	REM ## Wenn jemand die Basistexte fuer das InstallShield Programm noch übersetzt:
	SET Quell="%QuellVerzeichnis_INI%_Basis\SetUp_Basis_%Sprache_Q%.ini"
	SET Ziel="%ZielBasis%\InstallMate.%Sprache_Q%.imq"
   
	%Konverterprogramm%  %Quell% %Ziel% %Sprache_Z%

REM		)
echo off

GOTO :EOF


ECHO Hier duerfte es nicht hinkommen

::==============================================================================
:Ende_und_aus

