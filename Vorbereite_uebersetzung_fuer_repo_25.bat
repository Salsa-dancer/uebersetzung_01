@echo on
@:: "C:\DATEN\GitHub\uebersetzung_01\Vorbereite_uebersetzung_fuer_repo_25.bat"
@::
@:: 
@:: 
@::=============================================================================


@SET QuellBasis=C:\SVN_Workdir\PYTHA.24.2
::@SET ZielVerzeichnis="Ausgabe"
@SET ZielVerzeichnis=".\25_aus_SVN_wd"

:: Vari-1:   powershell -command "Expand-Archive pytha-25_alles.zip .\pytha-25_alles"
:: Vari-2:   powershell -command "Expand-Archive pytha-25_alles.zip .\%ZielVerzeichnis%"
:: Inzwischen entpacke ich per Mausklick die neueste .zip

ECHO Wirklich aus %QuellBasis% die .rc Dateien nach %ZielVerzeichnis% verteilen?
PAUSE


@SET Quellwurzel=%QuellBasis%\Quellen\einga\res
::@SET ZielUnterVerzeichnis=%ZielVerzeichnis%\pytha-25\einga
@SET ZielUnterVerzeichnis=%ZielVerzeichnis%
@SET Sprachunterverzeichnis=1
@SET Dateiname=einga_
CALL :Verteile_alle_Sprachen


@SET Quellwurzel=%QuellBasis%\Quellen\einga\res
::@SET ZielUnterVerzeichnis=%ZielVerzeichnis%\pytha-25\holestritab
@SET ZielUnterVerzeichnis=%ZielVerzeichnis%
@SET Sprachunterverzeichnis=1
@SET Dateiname=HoleStriTab_
CALL :Verteile_alle_Sprachen


@SET Quellwurzel=%QuellBasis%\Zentrale\res\rc_Dateien
::@SET ZielUnterVerzeichnis=%ZielVerzeichnis%\pytha-25\zentrale
@SET ZielUnterVerzeichnis=%ZielVerzeichnis%
@SET Sprachunterverzeichnis=0
@SET Dateiname=Zentrale_
CALL :Verteile_alle_Sprachen


PAUSE
GOTO :Ende_und_aus


::==============================================================================
:Verteile_alle_Sprachen

ECHO Jetzt geht es los
:: Englisch Basis-Sprache:
@SET Sprache_PYT=ENU
@SET Sprache_webl=ENU
CALL :Verteile_eine_RC_Datei

:: Amharisch:
@SET Sprache_PYT=AMH
@SET Sprache_webl=am
CALL :Verteile_eine_RC_Datei

:: Arabisch:
@SET Sprache_PYT=ARA
@SET Sprache_webl=ar
CALL :Verteile_eine_RC_Datei

@SET Sprache_PYT=BGR
@SET Sprache_webl=bg
CALL :Verteile_eine_RC_Datei

@SET Sprache_PYT=DEU
@SET Sprache_webl=de
CALL :Verteile_eine_RC_Datei

:: Spanisch:
@SET Sprache_PYT=ESP
@SET Sprache_webl=es
CALL :Verteile_eine_RC_Datei

:: Französisch
@SET Sprache_PYT=FRA
@SET Sprache_webl=fr
CALL :Verteile_eine_RC_Datei

:: Griechisch
@SET Sprache_PYT=GRE
@SET Sprache_webl=%Sprache_PYT%
::#### CALL :Verteile_eine_RC_Datei

@SET Sprache_PYT=HEB
@SET Sprache_webl=he
::#### CALL :Verteile_eine_RC_Datei

@SET Sprache_PYT=IND
@SET Sprache_webl=id
CALL :Verteile_eine_RC_Datei

:: Italienisch:
@SET Sprache_PYT=ITA
@SET Sprache_webl=it
CALL :Verteile_eine_RC_Datei

@SET Sprache_PYT=JPN
@SET Sprache_webl=ja
CALL :Verteile_eine_RC_Datei

@SET Sprache_PYT=KOR
@SET Sprache_webl=ko
CALL :Verteile_eine_RC_Datei

:: Polnisch
@SET Sprache_PYT=POL
@SET Sprache_webl=pl
CALL :Verteile_eine_RC_Datei

@SET Sprache_PYT=PTG
@SET Sprache_webl=pt
CALL :Verteile_eine_RC_Datei

:: Rumaenisch
@SET Sprache_PYT=RO
@SET Sprache_webl=ro
CALL :Verteile_eine_RC_Datei

:: Vietnamesisch
@SET Sprache_PYT=VIE
@SET Sprache_webl=vi
CALL :Verteile_eine_RC_Datei

@SET Sprache_PYT=CHN
@SET Sprache_webl=zh-Hans
CALL :Verteile_eine_RC_Datei

:: Taiwan (traditio chines)
@SET Sprache_PYT=TWN
@SET Sprache_webl=zh-Hant
CALL :Verteile_eine_RC_Datei

:EOF



::==============================================================================
:Verteile_eine_RC_Datei
@ECHO off
ECHO   %Sprache_PYT%   " ---> "   %Sprache_webl%
:: PAUSE
@SET Ziel2=%ZielUnterVerzeichnis%\%Dateiname%%Sprache_webl%.rc
IF %Sprachunterverzeichnis%==1 (
	@SET Quell2=%Quellwurzel%\l.%Sprache_PYT%\%Dateiname%%Sprache_PYT%.rc
) ELSE (
	@SET Quell2=%Quellwurzel%\%Dateiname%%Sprache_PYT%.rc
)

:: ECHO Quell2:   %Quell2%
:: ECHO Ziel2:  %Ziel2%

COPY %Quell2%  %Ziel2%

ECHO.
::PAUSE
:EOF


::==============================================================================
:Ende_und_aus