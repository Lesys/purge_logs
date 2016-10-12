::@ECHO off permet de ne pas affichier chaque ligne exécutée du programme
::@ECHO off
TITLE BatchFile
MODE con cols=200 lines=50
COLOR 0F
setlocal EnableDelayedExpansion

set a=0
FOR %%v IN (%*) DO (
	echo %%v
	set /a a=!a!+1
	echo !a!
)
CD C:\Users\charly.attrait\Documents\programmes\batch
IF %a% LSS 2 (
	echo IL N'Y A PAS ASSEZ D'ARGUMENTS. IL EN FAUT 2
	echo IL N'Y A PAS ASSEZ D'ARGUMENTS. IL EN FAUT 2 > resultat.txt
::Permet de pouvoir lire la console et de la fermet par un appuit sur une touche
	PAUSE > NUL
	exit
) ELSE IF %a% GTR 2 (
	echo IL Y A TROP D'ARGUMENTS. IL EN FAUT 2
	echo IL Y A TROP D'ARGUMENTS. IL EN FAUT 2 > resultat.txt
::Permet de pouvoir lire la console et de la fermet par un appuit sur une touche
	PAUSE > NUL
	exit
) ELSE (
	echo IL Y A BIEN 2 ARGUMENTS
	echo IL Y A BIEN 2 ARGUMENTS > resultat.txt
	SET dos1=%1
	SET dos2=%2
)

IF %CD% == %dos1% (
	CD %dos1%
	echo %dos1% > chemin.txt
)

IF EXIST testFichier.txt (
	DEL testFichier.txt
)

set i=0
FOR /F "tokens=1,2,3 delims= " %%a IN (resultat.txt) DO (
	set dateA=%%a %%b %%c
	echo !dateA!
)


::Permet de pouvoir lire la console et de la fermet par un appuit sur une touche
PAUSE

::Le but du script sera de:
	::-Trouver les fichiers dans les dossiers
	::-Regarder les fichiers modifiés depuis 31 jours
	::-Supprimer le contenu des fichiers de plus de 31 jours (date la plus récente dans les fichiers) (pas forcément TOUT le contenu, juste les parties les plus anciennes)