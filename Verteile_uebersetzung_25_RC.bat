@echo on
@:: Verteile_uebersetzung.bat
@::
@:: 2020-12 Aufrufen aus erstem Unterverzeichnis im entpackten Weblate ZIP
@:: 2020-12-22 Fest eingestellter aus .zip entpackter Unterpfad zum einfachen Doppelklick
@::-----------------------------------------------------------------------------
@:: 2021-08 Aus github wird der Inhalt des Repository "uebersetzung_01" auf den
@::		lokalen Speicher geholt.
@::		Bei meinem Rechner liegt das auf "C:\DATEN\GitHub\uebersetzung_01"
@:: 	Im Unterverzeichnis "25" liegen die übersetzten .rc Dateien mit kurzen 
@:: 	Bezeichnungen der Sprachen.
@:: 	Durch Starten dieser .BAT Datei werden die .rc mit den in PYTHA benutzten
@:: 	Sprach-Namensendungen in die PYTHA Quelltext Verzeichnisse kopiert. Die
@:: 	letzten 14 Versionen der dort existierenden werden zuvor sicherheitshalber
@::		 aufgehoben.
@:: 
@::=============================================================================

:: Das Unterverzeichnis mit den .rc Dateien:
@SET Verzeichnis_RC=25

: Die Wurzel ohne \ am Ende
@SET SVN_wurzel=C:\SVN_Workdir\PYTHA.24.2


:: Vari-1:   powershell -command "Expand-Archive pytha-25_alles.zip .\pytha-25_alles"
:: Vari-2:   powershell -command "Expand-Archive pytha-25_alles.zip .\%Verzeichnis_RC%"
:: Inzwischen entpacke ich per Mausklick die neueste .zip

ECHO Wirklich aus %Verzeichnis_RC% dir .rc nach 24.2 verteilen?
PAUSE


@SET Zielwurzel=%SVN_wurzel%\Quellen\einga\res
@SET QuellUnterVerzeichnis=%Verzeichnis_RC%
@SET Sprachunterverzeichnis=1
@SET Dateiname=einga_
CALL :Verteile_alle_Sprachen


@SET Zielwurzel=%SVN_wurzel%\Quellen\einga\res
@SET QuellUnterVerzeichnis=%Verzeichnis_RC%
@SET Sprachunterverzeichnis=1
@SET Dateiname=HoleStriTab_
CALL :Verteile_alle_Sprachen


@SET Zielwurzel=%SVN_wurzel%\Zentrale\res\rc_Dateien
@SET QuellUnterVerzeichnis=%Verzeichnis_RC%
@SET Sprachunterverzeichnis=0
@SET Dateiname=Zentrale_
CALL :Verteile_alle_Sprachen


PAUSE
GOTO :Ende_und_aus


::==============================================================================
:Verteile_alle_Sprachen

:: Albanisch:
@SET Sprache_Z=ALB
@SET Sprache_Q=sq
CALL :Verteile_eine_RC_Datei

:: Amharisch:
@SET Sprache_Z=AMH
@SET Sprache_Q=am
CALL :Verteile_eine_RC_Datei

:: Arabisch:
@SET Sprache_Z=ARA
@SET Sprache_Q=ar
CALL :Verteile_eine_RC_Datei

:: Bulgarisch:
@SET Sprache_Z=BGR
@SET Sprache_Q=bg
CALL :Verteile_eine_RC_Datei

:: Deutsch:
@SET Sprache_Z=Deutsch
@SET Sprache_Q=de
CALL :Verteile_eine_RC_Datei

:: Spanisch:
@SET Sprache_Z=ESP
@SET Sprache_Q=es
CALL :Verteile_eine_RC_Datei

:: Französisch
@SET Sprache_Z=FRA
@SET Sprache_Q=fr
CALL :Verteile_eine_RC_Datei

:: Griechisch
@SET Sprache_Z=GRE
@SET Sprache_Q=el
CALL :Verteile_eine_RC_Datei

@SET Sprache_Z=HEB
@SET Sprache_Q=he
CALL :Verteile_eine_RC_Datei

:: Indonesisch:
@SET Sprache_Z=IND
@SET Sprache_Q=id
CALL :Verteile_eine_RC_Datei

:: Italienisch:
@SET Sprache_Z=ITA
@SET Sprache_Q=it
CALL :Verteile_eine_RC_Datei

:: Japanisch:
@SET Sprache_Z=JPN
@SET Sprache_Q=ja
CALL :Verteile_eine_RC_Datei

:: Koreanisch:
@SET Sprache_Z=KOR
@SET Sprache_Q=ko
CALL :Verteile_eine_RC_Datei

:: Niederlaendisch:
@SET Sprache_Z=NLD
@SET Sprache_Q=nl
CALL :Verteile_eine_RC_Datei

:: Polnisch
@SET Sprache_Z=POL
@SET Sprache_Q=pl
CALL :Verteile_eine_RC_Datei

:: Brasilianisch / Portugiesisch:
@SET Sprache_Z=PTG
@SET Sprache_Q=pt
CALL :Verteile_eine_RC_Datei

:: Rumaenisch
@SET Sprache_Z=RO
@SET Sprache_Q=ro
CALL :Verteile_eine_RC_Datei

:: Vietnamesisch
@SET Sprache_Z=VIE
@SET Sprache_Q=vi
CALL :Verteile_eine_RC_Datei

:: China (Simplified Chinesisch)
@SET Sprache_Z=CHN
@SET Sprache_Q=zh-Hans
CALL :Verteile_eine_RC_Datei

:: Taiwan (Traditionelles chinesisch)
@SET Sprache_Z=TWN
@SET Sprache_Q=zh-Hant
CALL :Verteile_eine_RC_Datei

:: Thailaendisch	(Isaiah Cheng 2023-05 hinzugefuegt)
@SET Sprache_Z=THA
@SET Sprache_Q=th
CALL :Verteile_eine_RC_Datei

:EOF



::==============================================================================
:Umbenenne_eine_Datei
if exist %1 (
    @MOVE %1  %2
::    @RENAME %1  %2
) else (
    rem file doesn't exist
)
EXIT /b

::==============================================================================
:Verteile_eine_RC_Datei
@ECHO off
@SET Quelldatei=%QuellUnterverzeichnis%\%Dateiname%%Sprache_Q%.rc
IF %Sprachunterverzeichnis%==1 (
	@SET Zieldatei=%Zielwurzel%\l.%Sprache_Z%\%Dateiname%%Sprache_Z%.rc
) ELSE (
	@SET Zieldatei=%Zielwurzel%\%Dateiname%%Sprache_Z%.rc
)
ECHO Quelldatei:  %Quelldatei%
ECHO Zieldatei:   %Zieldatei%

@SET Bupdatei01=%Zieldatei%_bup01.rc
@SET Bupdatei02=%Zieldatei%_bup02.rc
@SET Bupdatei03=%Zieldatei%_bup03.rc
@SET Bupdatei04=%Zieldatei%_bup04.rc
@SET Bupdatei05=%Zieldatei%_bup05.rc
@SET Bupdatei06=%Zieldatei%_bup06.rc
@SET Bupdatei07=%Zieldatei%_bup07.rc
@SET Bupdatei08=%Zieldatei%_bup08.rc
@SET Bupdatei09=%Zieldatei%_bup09.rc
@SET Bupdatei10=%Zieldatei%_bup10.rc
@SET Bupdatei11=%Zieldatei%_bup11.rc
@SET Bupdatei12=%Zieldatei%_bup12.rc
@SET Bupdatei13=%Zieldatei%_bup13.rc
@SET Bupdatei14=%Zieldatei%_bup14.rc
@SET Bupdatei15=%Zieldatei%_bup15.rc
@SET Bupdatei16=%Zieldatei%_bup16.rc
@SET Bupdatei17=%Zieldatei%_bup17.rc
@SET Bupdatei18=%Zieldatei%_bup18.rc
@SET Bupdatei19=%Zieldatei%_bup19.rc
@SET Bupdatei20=%Zieldatei%_bup20.rc


if EXIST %Bupdatei20% (
   @DEL  %Bupdatei20%
)

CALL :Umbenenne_eine_Datei %Bupdatei19%  %Bupdatei20%
CALL :Umbenenne_eine_Datei %Bupdatei18%  %Bupdatei19%
CALL :Umbenenne_eine_Datei %Bupdatei17%  %Bupdatei18%
CALL :Umbenenne_eine_Datei %Bupdatei16%  %Bupdatei17%
CALL :Umbenenne_eine_Datei %Bupdatei15%  %Bupdatei16%
CALL :Umbenenne_eine_Datei %Bupdatei14%  %Bupdatei15%
CALL :Umbenenne_eine_Datei %Bupdatei13%  %Bupdatei14%
CALL :Umbenenne_eine_Datei %Bupdatei12%  %Bupdatei13%
CALL :Umbenenne_eine_Datei %Bupdatei11%  %Bupdatei12%
CALL :Umbenenne_eine_Datei %Bupdatei10%  %Bupdatei11%
CALL :Umbenenne_eine_Datei %Bupdatei09%  %Bupdatei10%
CALL :Umbenenne_eine_Datei %Bupdatei08%  %Bupdatei09%
CALL :Umbenenne_eine_Datei %Bupdatei07%  %Bupdatei08%
CALL :Umbenenne_eine_Datei %Bupdatei06%  %Bupdatei07%
CALL :Umbenenne_eine_Datei %Bupdatei05%  %Bupdatei06%
CALL :Umbenenne_eine_Datei %Bupdatei04%  %Bupdatei05%
CALL :Umbenenne_eine_Datei %Bupdatei03%  %Bupdatei04%
CALL :Umbenenne_eine_Datei %Bupdatei02%  %Bupdatei03%
CALL :Umbenenne_eine_Datei %Bupdatei01%  %Bupdatei02%


if EXIST %Zieldatei% (
	::ECHO # MOVE %Zieldatei%    %Bupdatei01%
	MOVE %Zieldatei%    %Bupdatei01%
) ELSE (
	ECHO Datei %Zieldatei% fehlt
)


if EXIST %Quelldatei% (
	::ECHO # COPY %Quelldatei%  %Zieldatei%
	COPY %Quelldatei%  %Zieldatei%
) ELSE (
	ECHO Datei %Quelldatei% fehlt
)
ECHO.
::PAUSE
REM :EOF
EXIT /B


::==============================================================================
:Ende_und_aus